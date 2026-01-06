DoPlayerTurn:
	call SetPlayerTurn

	ld a, [wBattlePlayerAction]
	and a ; BATTLEPLAYERACTION_USEMOVE?
	ret nz

	jr DoTurn

DoEnemyTurn:
	call SetEnemyTurn

	ld a, [wLinkMode]
	and a
	jr z, DoTurn

	ld a, [wBattleAction]
	cp BATTLEACTION_STRUGGLE
	jr z, DoTurn
	cp BATTLEACTION_SWITCH1
	ret nc

	; fallthrough

DoTurn:
; Read in and execute the user's move effects for this turn.

	xor a
	ld [wTurnEnded], a

	; Effect command checkturn is called for every move.
	call CheckTurn

	ld a, [wTurnEnded]
	and a
	ret nz

	call UpdateMoveData

DoMove:
; Get the user's move effect.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	ld c, a
	ld b, 0
	ld hl, MoveEffectsPointers
	add hl, bc
	add hl, bc
	ld a, BANK(MoveEffectsPointers)
	call GetFarWord

	ld de, wBattleScriptBuffer

.GetMoveEffect:
	ld a, BANK(MoveEffects)
	call GetFarByte
	inc hl
	ld [de], a
	inc de
	cp endmove_command
	jr nz, .GetMoveEffect

; Start at the first command.
	ld hl, wBattleScriptBuffer
	ld a, l
	ld [wBattleScriptBufferAddress], a
	ld a, h
	ld [wBattleScriptBufferAddress + 1], a

.ReadMoveEffectCommand:
; ld a, [wBattleScriptBufferAddress++]
	ld a, [wBattleScriptBufferAddress]
	ld l, a
	ld a, [wBattleScriptBufferAddress + 1]
	ld h, a

	ld a, [hli]

	push af
	ld a, l
	ld [wBattleScriptBufferAddress], a
	ld a, h
	ld [wBattleScriptBufferAddress + 1], a
	pop af

; endturn_command (-2) is used to terminate branches without ending the read cycle.
	cp endturn_command
	ret nc

; The rest of the commands (01-af) are read from BattleCommandPointers.
	push bc
	dec a
	ld c, a
	ld b, 0
	ld hl, BattleCommandPointers
	add hl, bc
	add hl, bc
	pop bc

	ld a, BANK(BattleCommandPointers)
	call GetFarWord

	call .DoMoveEffectCommand

	jr .ReadMoveEffectCommand

.DoMoveEffectCommand:
	jp hl

CheckTurn:
BattleCommand_CheckTurn:
; Repurposed as hardcoded turn handling. Useless as a command.

; Move $ff immediately ends the turn.
	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	inc a
	jp z, EndTurn

	xor a
	ld [wAttackMissed], a
	ld [wEffectFailed], a
	ld [wBattleAnimParam], a
	ld [wAlreadyDisobeyed], a
	ld [wAlreadyFailed], a
	ld [wSomeoneIsRampaging], a

	ld a, EFFECTIVE
	ld [wTypeModifier], a

	ldh a, [hBattleTurn]
	and a
	jp nz, CheckEnemyTurn

; check player turn
	ld hl, wPlayerSubStatus4
	bit SUBSTATUS_RECHARGE, [hl]
	jr z, .no_recharge

	res SUBSTATUS_RECHARGE, [hl]
	ld hl, MustRechargeText
	call StdBattleTextbox
	call CantMove
	jp EndTurn

.no_recharge

	ld hl, wBattleMonStatus
	ld a, [hl]
	and SLP_MASK
	jr z, .not_asleep

	dec a
	ld [wBattleMonStatus], a
	and SLP_MASK
	jr z, .woke_up

	xor a
	ld [wNumHits], a
	ld de, ANIM_SLP
	call FarPlayBattleAnimation
	jr .fast_asleep

.woke_up
	ld hl, WokeUpText
	call StdBattleTextbox
	call CantMove
	call UpdateBattleMonInParty
	ld hl, UpdatePlayerHUD
	call CallBattleCore
	ld a, $1
	ldh [hBGMapMode], a
	ld hl, wPlayerSubStatus1
	res SUBSTATUS_NIGHTMARE, [hl]
	jr .not_asleep

.fast_asleep
	ld hl, FastAsleepText
	call StdBattleTextbox

	; Snore and Sleep Talk bypass sleep.
	ld a, [wCurPlayerMove]
	ld hl, .sleep_bypass_moves
	call CheckMoveInList
	jr c, .not_asleep
	call CantMove
	jp EndTurn

.sleep_bypass_moves
	dw SNORE
	dw SLEEP_TALK
	dw -1

.not_asleep

	ld hl, wBattleMonStatus
	bit FRZ, [hl]
	jr z, .not_frozen

	; Flame Wheel and Sacred Fire thaw the user.
	ld a, [wCurPlayerMove]
	ld hl, .thawing_moves
	call CheckMoveInList
	jr c, .not_frozen

	ld hl, FrozenSolidText
	call StdBattleTextbox

	call CantMove
	jp EndTurn

.thawing_moves
	dw FLAME_WHEEL
	dw SACRED_FIRE
	dw -1

.not_frozen

	ld hl, wPlayerSubStatus3
	bit SUBSTATUS_FLINCHED, [hl]
	jr z, .not_flinched

	res SUBSTATUS_FLINCHED, [hl]
	ld hl, FlinchedText
	call StdBattleTextbox

	call CantMove
	jp EndTurn

.not_flinched

	ld hl, wPlayerDisableCount
	ld a, [hl]
	and a
	jr z, .not_disabled

	dec a
	ld [hl], a
	and $f
	jr nz, .not_disabled

	ld [hl], a
	ld [wDisabledMove], a
	ld hl, DisabledNoMoreText
	call StdBattleTextbox

.not_disabled

	ld a, [wPlayerSubStatus3]
	add a
	jr nc, .not_confused
	ld hl, wPlayerConfuseCount
	dec [hl]
	jr nz, .confused

	ld hl, wPlayerSubStatus3
	res SUBSTATUS_CONFUSED, [hl]
	ld hl, ConfusedNoMoreText
	call StdBattleTextbox
	jr .not_confused

.confused
	ld hl, IsConfusedText
	call StdBattleTextbox
	xor a
	ld [wNumHits], a
	ld de, ANIM_CONFUSED
	call FarPlayBattleAnimation

	; 50% chance of hitting itself
	call BattleRandom
	cp 50 percent + 1
	jr nc, .not_confused

	; clear confusion-dependent substatus
	ld hl, wPlayerSubStatus3
	ld a, [hl]
	and 1 << SUBSTATUS_CONFUSED
	ld [hl], a

	call HitConfusion
	call CantMove
	jp EndTurn

.not_confused

	ld a, [wPlayerSubStatus1]
	add a ; bit SUBSTATUS_ATTRACT
	jr nc, .not_infatuated

	ld hl, InLoveWithText
	call StdBattleTextbox
	xor a
	ld [wNumHits], a
	ld de, ANIM_IN_LOVE
	call FarPlayBattleAnimation

	; 50% chance of infatuation
	call BattleRandom
	cp 50 percent + 1
	jr c, .not_infatuated

	ld hl, InfatuationText
	call StdBattleTextbox
	call CantMove
	jp EndTurn

.not_infatuated

	; We can't disable a move that doesn't exist.
	ld a, [wDisabledMove]
	and a
	jr z, .no_disabled_move

	; Are we using the disabled move?
	ld hl, wCurPlayerMove
	cp [hl]
	jr nz, .no_disabled_move

	call MoveDisabled
	call CantMove
	jp EndTurn

.no_disabled_move

	ld hl, wBattleMonStatus
	bit PAR, [hl]
	ret z

	; 25% chance to be fully paralyzed
	call BattleRandom
	cp 25 percent
	ret nc

	ld hl, FullyParalyzedText
	call StdBattleTextbox
	call CantMove
	jp EndTurn

CantMove:
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res SUBSTATUS_ROLLOUT, [hl]

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	ld a, [hl]
	and ~(1 << SUBSTATUS_BIDE | 1 << SUBSTATUS_RAMPAGE | 1 << SUBSTATUS_CHARGED)
	ld [hl], a

	call ResetFuryCutterCount

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	push hl
	ld hl, .fly_dig_moves
	call CheckMoveInList
	pop hl
	ret nc

	res SUBSTATUS_UNDERGROUND, [hl]
	res SUBSTATUS_FLYING, [hl]
	jp AppearUserRaiseSub

.fly_dig_moves
	dw FLY
	dw DIG
	dw -1

OpponentCantMove:
	call BattleCommand_SwitchTurn
	call CantMove
	jp BattleCommand_SwitchTurn

CheckEnemyTurn:
	ld hl, wEnemySubStatus4
	bit SUBSTATUS_RECHARGE, [hl]
	jr z, .no_recharge

	res SUBSTATUS_RECHARGE, [hl]
	ld hl, MustRechargeText
	call StdBattleTextbox
	call CantMove
	jp EndTurn

.no_recharge

	ld hl, wEnemyMonStatus
	ld a, [hl]
	and SLP_MASK
	jr z, .not_asleep

	dec a
	ld [wEnemyMonStatus], a
	and a
	jr z, .woke_up

	ld hl, FastAsleepText
	call StdBattleTextbox
	xor a
	ld [wNumHits], a
	ld de, ANIM_SLP
	call FarPlayBattleAnimation
	jr .fast_asleep

.woke_up
	ld hl, WokeUpText
	call StdBattleTextbox
	call CantMove
	call UpdateEnemyMonInParty
	ld hl, UpdateEnemyHUD
	call CallBattleCore
	ld a, $1
	ldh [hBGMapMode], a
	ld hl, wEnemySubStatus1
	res SUBSTATUS_NIGHTMARE, [hl]
	jr .not_asleep

.fast_asleep
	; Snore and Sleep Talk bypass sleep.
	ld a, [wCurEnemyMove]
	ld hl, .sleep_bypass_moves
	call CheckMoveInList
	jr c, .not_asleep
	call CantMove
	jp EndTurn

.sleep_bypass_moves
	dw SNORE
	dw SLEEP_TALK
	dw -1

.not_asleep

	ld hl, wEnemyMonStatus
	bit FRZ, [hl]
	jr z, .not_frozen

	; Flame Wheel and Sacred Fire thaw the user.
	ld a, [wCurEnemyMove]
	ld hl, .thawing_moves
	call CheckMoveInList
	jr c, .not_frozen

	ld hl, FrozenSolidText
	call StdBattleTextbox
	call CantMove
	jp EndTurn

.thawing_moves
	dw FLAME_WHEEL
	dw SACRED_FIRE
	dw -1

.not_frozen

	ld hl, wEnemySubStatus3
	bit SUBSTATUS_FLINCHED, [hl]
	jr z, .not_flinched

	res SUBSTATUS_FLINCHED, [hl]
	ld hl, FlinchedText
	call StdBattleTextbox

	call CantMove
	jp EndTurn

.not_flinched

	ld hl, wEnemyDisableCount
	ld a, [hl]
	and a
	jr z, .not_disabled

	dec a
	ld [hl], a
	and $f
	jr nz, .not_disabled

	ld [hl], a
	ld [wEnemyDisabledMove], a

	ld hl, DisabledNoMoreText
	call StdBattleTextbox

.not_disabled

	ld a, [wEnemySubStatus3]
	add a ; bit SUBSTATUS_CONFUSED
	jr nc, .not_confused

	ld hl, wEnemyConfuseCount
	dec [hl]
	jr nz, .confused

	ld hl, wEnemySubStatus3
	res SUBSTATUS_CONFUSED, [hl]
	ld hl, ConfusedNoMoreText
	call StdBattleTextbox
	jr .not_confused

.confused
	ld hl, IsConfusedText
	call StdBattleTextbox

	xor a
	ld [wNumHits], a
	ld de, ANIM_CONFUSED
	call FarPlayBattleAnimation

	; 50% chance of hitting itself
	call BattleRandom
	cp 50 percent + 1
	jr nc, .not_confused

	; clear confusion-dependent substatus
	ld hl, wEnemySubStatus3
	ld a, [hl]
	and 1 << SUBSTATUS_CONFUSED
	ld [hl], a

	ld hl, HurtItselfText
	call StdBattleTextbox

	call HitSelfInConfusion
	call BattleCommand_DamageCalc
	call BattleCommand_LowerSub

	xor a
	ld [wNumHits], a

	; Flicker the monster pic unless flying or underground.
	ld de, ANIM_HIT_CONFUSION
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	call z, PlayFXAnimID

	ld c, TRUE
	call DoEnemyDamage
	call BattleCommand_RaiseSub
	call CantMove
	jp EndTurn

.not_confused

	ld a, [wEnemySubStatus1]
	add a ; bit SUBSTATUS_ATTRACT
	jr nc, .not_infatuated

	ld hl, InLoveWithText
	call StdBattleTextbox
	xor a
	ld [wNumHits], a
	ld de, ANIM_IN_LOVE
	call FarPlayBattleAnimation

	; 50% chance of infatuation
	call BattleRandom
	cp 50 percent + 1
	jr c, .not_infatuated

	ld hl, InfatuationText
	call StdBattleTextbox
	call CantMove
	jp EndTurn

.not_infatuated

	; We can't disable a move that doesn't exist.
	ld a, [wEnemyDisabledMove]
	and a
	jr z, .no_disabled_move

	; Are we using the disabled move?
	ld hl, wCurEnemyMove
	cp [hl]
	jr nz, .no_disabled_move

	call MoveDisabled

	call CantMove
	jp EndTurn

.no_disabled_move

	ld hl, wEnemyMonStatus
	bit PAR, [hl]
	ret z

	; 25% chance to be fully paralyzed
	call BattleRandom
	cp 25 percent
	ret nc

	ld hl, FullyParalyzedText
	call StdBattleTextbox
	call CantMove

	; fallthrough

EndTurn:
	ld a, $1
	ld [wTurnEnded], a
	jp ResetDamage

MoveDisabled:
	; Make sure any charged moves fail
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_CHARGED, [hl]

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld [wNamedObjectIndex], a
	call GetMoveName

	ld hl, DisabledMoveText
	jp StdBattleTextbox

HitConfusion:
	ld hl, HurtItselfText
	call StdBattleTextbox

	xor a
	ld [wCriticalHit], a

	call HitSelfInConfusion
	call BattleCommand_DamageCalc
	call BattleCommand_LowerSub

	xor a
	ld [wNumHits], a

	; Flicker the monster pic unless flying or underground.
	ld de, ANIM_HIT_CONFUSION
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	call z, PlayFXAnimID

	ld hl, UpdatePlayerHUD
	call CallBattleCore
	ld a, $1
	ldh [hBGMapMode], a
	ld c, TRUE
	call DoPlayerDamage
	jp BattleCommand_RaiseSub

BattleCommand_CheckObedience:
	; Enemy can't disobey
	ldh a, [hBattleTurn]
	and a
	ret nz

	call CheckUserIsCharging
	ret nz

	; If we've already checked this turn
	ld a, [wAlreadyDisobeyed]
	and a
	ret nz

	xor a
	ld [wAlreadyDisobeyed], a

	; No obedience in link battles
	; (since no handling exists for enemy)
	ld a, [wLinkMode]
	and a
	ret nz

	ld a, [wInBattleTowerBattle]
	and a
	ret nz

	; If the monster's id doesn't match the player's,
	; some conditions need to be met.
	ld a, MON_ID
	call BattlePartyAttr

	ld a, [wPlayerID]
	cp [hl]
	jr nz, .obeylevel
	inc hl
	ld a, [wPlayerID + 1]
	cp [hl]
	ret z

.obeylevel
	; The maximum obedience level is constrained by owned badges:
	ld hl, wJohtoBadges

	; risingbadge
	bit RISINGBADGE, [hl]
	ld a, MAX_LEVEL + 1
	jr nz, .getlevel

	; stormbadge
	bit STORMBADGE, [hl]
	ld a, 70
	jr nz, .getlevel

	; fogbadge
	bit FOGBADGE, [hl]
	ld a, 50
	jr nz, .getlevel

	; hivebadge
	bit HIVEBADGE, [hl]
	ld a, 30
	jr nz, .getlevel

	; no badges
	ld a, 10

.getlevel
; c = obedience level
; d = monster level
; b = c + d

	ld b, a
	ld c, a

	ld a, [wBattleMonLevel]
	ld d, a

	add b
	ld b, a

; No overflow (this should never happen)
	jr nc, .checklevel
	ld b, $ff

.checklevel
; If the monster's level is lower than the obedience level, it will obey.
	ld a, c
	cp d
	ret nc

; Random number from 0 to obedience level + monster level
.rand1
	call BattleRandom
	swap a
	cp b
	jr nc, .rand1

; The higher above the obedience level the monster is,
; the more likely it is to disobey.
	cp c
	ret c

; Sleep-only moves have separate handling, and a higher chance of
; being ignored. Lazy monsters like their sleep.
	call IgnoreSleepOnly
	ret c

; Another random number from 0 to obedience level + monster level
.rand2
	call BattleRandom
	cp b
	jr nc, .rand2

; A second chance.
	cp c
	jr c, .UseInstead

; No hope of using a move now.

; b = number of levels the monster is above the obedience level
	ld a, d
	sub c
	ld b, a

; The chance of napping is the difference out of 256.
	call BattleRandom
	swap a
	sub b
	jr c, .Nap

; The chance of not hitting itself is the same.
	cp b
	jr nc, .DoNothing

	ld hl, WontObeyText
	call StdBattleTextbox
	call HitConfusion
	jp .EndDisobedience

.Nap:
	call BattleRandom
	add a
	swap a
	and SLP_MASK
	jr z, .Nap

	ld [wBattleMonStatus], a

	ld hl, BeganToNapText
	jr .Print

.DoNothing:
	; 4 random choices
	call BattleRandom
	and %11

	ld hl, LoafingAroundText
	and a ; 0
	jr z, .Print

	ld hl, WontObeyText
	dec a ; 1
	jr z, .Print

	ld hl, TurnedAwayText
	dec a ; 2
	jr z, .Print

	ld hl, IgnoredOrdersText

.Print:
	call StdBattleTextbox
	jp .EndDisobedience

.UseInstead:
; Can't use another move if the monster only has one!
	ld a, [wBattleMonMoves + 1]
	and a
	jr z, .DoNothing

; Don't bother trying to handle Disable.
	ld a, [wDisabledMove]
	and a
	jr nz, .DoNothing

	ld hl, wBattleMonPP
	ld de, wBattleMonMoves
	ld b, 0
	ld c, NUM_MOVES

.GetTotalPP:
	ld a, [hli]
	and PP_MASK
	add b
	ld b, a

	dec c
	jr z, .CheckMovePP

; Stop at undefined moves.
	inc de
	ld a, [de]
	and a
	jr nz, .GetTotalPP

.CheckMovePP:
	ld hl, wBattleMonPP
	ld a, [wCurMoveNum]
	ld e, a
	ld d, 0
	add hl, de

; Can't use another move if only one move has PP.
	ld a, [hl]
	and PP_MASK
	cp b
	jr z, .DoNothing

; Make sure we can actually use the move once we get there.
	ld a, 1
	ld [wAlreadyDisobeyed], a

	ld a, [w2DMenuNumRows]
	ld b, a

; Save the move we originally picked for afterward.
	ld a, [wCurMoveNum]
	ld c, a
	push af

.RandomMove:
	call BattleRandom
	maskbits NUM_MOVES

	cp b
	jr nc, .RandomMove

; Not the move we were trying to use.
	cp c
	jr z, .RandomMove

; Make sure it has PP.
	ld [wCurMoveNum], a
	ld hl, wBattleMonPP
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	and PP_MASK
	jr z, .RandomMove

; Use it.
	ld a, [wCurMoveNum]
	ld c, a
	ld b, 0
	ld hl, wBattleMonMoves
	add hl, bc
	ld a, [hl]
	ld [wCurPlayerMove], a

	call SetPlayerTurn
	call UpdateMoveData
	call DoMove

; Restore original move choice.
	pop af
	ld [wCurMoveNum], a

.EndDisobedience:
	xor a
	ld [wLastPlayerMove], a
	ld [wLastPlayerCounterMove], a

	; Break Encore too.
	ld hl, wPlayerSubStatus5
	res SUBSTATUS_ENCORED, [hl]
	xor a
	ld [wPlayerEncoreCount], a

	jp EndMoveEffect

IgnoreSleepOnly:
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar

	; Snore and Sleep Talk bypass sleep.
	ld hl, .sleep_moves
	call CheckMoveInList
	ret nc

	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP_MASK
	ret z

; 'ignored orders…sleeping!'
	ld hl, IgnoredSleepingText
	call StdBattleTextbox

	call EndMoveEffect

	scf
	ret

.sleep_moves
	dw SNORE
	dw SLEEP_TALK
	dw -1

BattleCommand_UsedMoveText:
	farcall DisplayUsedMoveText
	ret

CheckUserIsCharging:
	ldh a, [hBattleTurn]
	and a
	ld a, [wPlayerCharging] ; player
	jr z, .end
	ld a, [wEnemyCharging] ; enemy
.end
	and a
	ret

BattleCommand_DoTurn:
	call CheckUserIsCharging
	ret nz

	ld hl, wBattleMonPP
	ld de, wPlayerSubStatus3
	ld bc, wPlayerTurnsTaken

	ldh a, [hBattleTurn]
	and a
	jr z, .proceed

	ld hl, wEnemyMonPP
	ld de, wEnemySubStatus3
	ld bc, wEnemyTurnsTaken

.proceed

; If we've gotten this far, this counts as a turn.
	ld a, [bc]
	inc a
	ld [bc], a

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld bc, STRUGGLE
	call CompareMove
	ret z

	ld a, [de]
	and 1 << SUBSTATUS_IN_LOOP | 1 << SUBSTATUS_RAMPAGE | 1 << SUBSTATUS_BIDE
	ret nz

	call .consume_pp
	ld a, b
	and a
	jp nz, EndMoveEffect

	; SubStatus5
	inc de
	inc de

	ld a, [de]
	bit SUBSTATUS_TRANSFORMED, a
	ret nz

	ldh a, [hBattleTurn]
	and a

	ld hl, wPartyMon1PP
	ld a, [wCurBattleMon]
	jr z, .player

; mimic this part entirely if wildbattle
	ld a, [wBattleMode]
	dec a
	jr z, .wild

	ld hl, wOTPartyMon1PP
	ld a, [wCurOTMon]

.player
	call GetPartyLocation
	push hl
	call CheckMimicUsed
	pop hl
	ret c

.consume_pp
	ldh a, [hBattleTurn]
	and a
	ld a, [wCurMoveNum]
	jr z, .okay
	ld a, [wCurEnemyMoveNum]

.okay
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	and PP_MASK
	jr z, .out_of_pp
	dec [hl]
	ld b, 0
	ret

.wild
	ld hl, wEnemyMonMoves
	ld a, [wCurEnemyMoveNum]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	ld bc, MIMIC
	call CompareMove
	jr z, .mimic
	ld hl, wWildMonMoves
	add hl, de
	ld a, [hl]
	call CompareMove
	ret z

.mimic
	ld hl, wWildMonPP
	call .consume_pp
	ret

.out_of_pp
	call BattleCommand_MoveDelay
; get move effect
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
; continuous?
	ld hl, .continuousmoves
	ld de, 1
	call IsInArray

; 'has no pp left for [move]'
	ld hl, HasNoPPLeftText
	jr c, .print
; 'but no pp is left for the move'
	ld hl, NoPPLeftText
.print
	call StdBattleTextbox
	ld b, 1
	ret

.continuousmoves
	db EFFECT_RAZOR_WIND
	db EFFECT_SKY_ATTACK
	db EFFECT_SKULL_BASH
	db EFFECT_SOLARBEAM
	db EFFECT_FLY
	db EFFECT_ROLLOUT
	db EFFECT_BIDE
	db EFFECT_RAMPAGE
	db -1

CheckMimicUsed:
	ldh a, [hBattleTurn]
	and a
	ld a, [wCurMoveNum]
	jr z, .player
	ld a, [wCurEnemyMoveNum]

.player
	ld c, a
	ld a, MON_MOVES
	call UserPartyAttr

	ld b, 0
	add hl, bc
	ld a, [hl]
	ld bc, MIMIC
	call CompareMove
	jr nz, .mimic

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	call CompareMove
	jr z, .mimic

	scf
	ret

.mimic
	and a
	ret

BattleCommand_Critical:
; Determine whether this attack's hit will be critical.

	xor a
	ld [wCriticalHit], a

	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVar
	and a
	ret z

	ldh a, [hBattleTurn]
	and a
	ld hl, wEnemyMonItem
	ld a, [wEnemyMonSpecies]
	jr nz, .Item
	ld hl, wBattleMonItem
	ld a, [wBattleMonSpecies]

.Item:
	ld c, 0
	ld b, [hl]
	call GetPokemonIndexFromID

	ld a, l
	sub LOW(CHANSEY)
	if HIGH(CHANSEY) == 0
		or h
	else
		jr nz, .Farfetchd
		if HIGH(CHANSEY) == 1
			dec h
		else
			ld a, h
			cp HIGH(CHANSEY)
		endc
	endc
	jr nz, .Farfetchd
	ld a, b
	cp LUCKY_PUNCH
	jr nz, .FocusEnergy

; +2 critical level
	ld c, 2
	jr .Tally

.Farfetchd:
	ld a, l
	sub LOW(FARFETCH_D)
	if HIGH(FARFETCH_D) == 0
		or h
	else
		jr nz, .FocusEnergy
		if HIGH(FARFETCH_D) == 1
			dec h
		else
			ld a, h
			cp HIGH(FARFETCH_D)
		endc
	endc
	jr nz, .FocusEnergy
	ld a, b
	cp STICK
	jr nz, .FocusEnergy

; +2 critical level
	ld c, 2
	jr .Tally

.FocusEnergy:
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_FOCUS_ENERGY, a
	jr z, .CheckCritical

; +1 critical level
	inc c

.CheckCritical:
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	call GetMoveIndexFromID
	ld de, 2
	ld hl, CriticalHitMoves
	push bc
	ld b, h
	ld c, l
	call IsInWordArray
	pop bc
	jr nc, .ScopeLens

; +2 critical level
	inc c
	inc c

.ScopeLens:
	push bc
	call GetUserItem
	ld a, b
	cp HELD_CRITICAL_UP ; Increased critical chance. Only Scope Lens has this.
	pop bc
	jr nz, .Tally

; +1 critical level
	inc c

.Tally:
	ld hl, CriticalHitChances
	ld b, 0
	add hl, bc
	call BattleRandom
	cp [hl]
	ret nc
	ld a, 1
	ld [wCriticalHit], a
	ret

INCLUDE "data/moves/critical_hit_moves.asm"

INCLUDE "data/battle/critical_hit_chances.asm"

INCLUDE "engine/battle/move_effects/triple_kick.asm"

BattleCommand_Stab:
; STAB = Same Type Attack Bonus
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	and TYPE_MASK
	ld bc, STRUGGLE
	call CompareMove
	ret z

	ld hl, wBattleMonType1
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wEnemyMonType1
	ld a, [hli]
	ld d, a
	ld e, [hl]

	ldh a, [hBattleTurn]
	and a
	jr z, .go ; Who Attacks and who Defends

	ld hl, wEnemyMonType1
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wBattleMonType1
	ld a, [hli]
	ld d, a
	ld e, [hl]

.go
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	and TYPE_MASK
	ld [wCurType], a

	push hl
	push de
	push bc
	farcall DoWeatherModifiers
	pop bc
	pop de
	pop hl

	push de
	push bc
	farcall DoBadgeTypeBoosts
	pop bc
	pop de

	ld a, [wCurType]
	cp b
	jr z, .stab
	cp c
	jr z, .stab

	jr .SkipStab

.stab
	ld hl, wCurDamage + 1
	ld a, [hld]
	ld h, [hl]
	ld l, a

	ld b, h
	ld c, l
	srl b
	rr c
	add hl, bc

	ld a, h
	ld [wCurDamage], a
	ld a, l
	ld [wCurDamage + 1], a

	ld hl, wTypeModifier
	set 7, [hl]

.SkipStab:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	ld b, a
	ld hl, TypeMatchups

.TypesLoop:
	ld a, [hli]

	cp -1
	jr z, .end

	; foresight
	cp -2
	jr nz, .SkipForesightCheck
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_IDENTIFIED, a
	jr nz, .end

	jr .TypesLoop

.SkipForesightCheck:
	cp b
	jr nz, .SkipType
	ld a, [hl]
	cp d
	jr z, .GotMatchup
	cp e
	jr z, .GotMatchup
	jr .SkipType

.GotMatchup:
	push hl
	push bc
	inc hl
	ld a, [wTypeModifier]
	and %10000000
	ld b, a
; If the target is immune to the move, treat it as a miss and calculate the damage as 0
	ld a, [hl]
	and a
	jr nz, .NotImmune
	inc a
	ld [wAttackMissed], a
	xor a
.NotImmune:
	ldh [hMultiplier], a
	add b
	ld [wTypeModifier], a

	xor a
	ldh [hMultiplicand + 0], a

	ld hl, wCurDamage
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hld]
	ldh [hMultiplicand + 2], a

	call Multiply

	ldh a, [hProduct + 1]
	ld b, a
	ldh a, [hProduct + 2]
	or b
	ld b, a
	ldh a, [hProduct + 3]
	or b
	jr z, .ok ; This is a very convoluted way to get back that we've essentially dealt no damage.

; Take the product and divide it by 10.
	ld a, 10
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ldh a, [hQuotient + 2]
	ld b, a
	ldh a, [hQuotient + 3]
	or b
	jr nz, .ok

	ld a, 1
	ldh [hMultiplicand + 2], a

.ok
	ldh a, [hMultiplicand + 1]
	ld [hli], a
	ldh a, [hMultiplicand + 2]
	ld [hl], a
	pop bc
	pop hl

.SkipType:
	inc hl
	inc hl
	jr .TypesLoop

.end
	call BattleCheckTypeMatchup
	ld a, [wTypeMatchup]
	ld b, a
	ld a, [wTypeModifier]
	and %10000000
	or b
	ld [wTypeModifier], a
	ret

BattleCheckTypeMatchup:
	ld hl, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, CheckTypeMatchup
	ld hl, wBattleMonType1
	; fallthrough
CheckTypeMatchup:
; BUG: AI makes a false assumption about CheckTypeMatchup (see docs/bugs_and_glitches.md)
	push hl
	push de
	push bc
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	ld d, a
	ld b, [hl]
	inc hl
	ld c, [hl]
	ld a, EFFECTIVE
	ld [wTypeMatchup], a
	ld hl, TypeMatchups
.TypesLoop:
	ld a, [hli]
	cp -1
	jr z, .End
	cp -2
	jr nz, .Next
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_IDENTIFIED, a
	jr nz, .End
	jr .TypesLoop

.Next:
	cp d
	jr nz, .Nope
	ld a, [hli]
	cp b
	jr z, .Yup
	cp c
	jr z, .Yup
	jr .Nope2

.Nope:
	inc hl
.Nope2:
	inc hl
	jr .TypesLoop

.Yup:
	xor a
	ldh [hDividend + 0], a
	ldh [hMultiplicand + 0], a
	ldh [hMultiplicand + 1], a
	ld a, [hli]
	ldh [hMultiplicand + 2], a
	ld a, [wTypeMatchup]
	ldh [hMultiplier], a
	call Multiply
	ld a, 10
	ldh [hDivisor], a
	push bc
	ld b, 4
	call Divide
	pop bc
	ldh a, [hQuotient + 3]
	ld [wTypeMatchup], a
	jr .TypesLoop

.End:
	pop bc
	pop de
	pop hl
	ret

BattleCommand_ResetTypeMatchup:
; Reset the type matchup multiplier to 1.0, if the type matchup is not 0.
; If there is immunity in play, the move automatically misses.
	call BattleCheckTypeMatchup
	ld a, [wTypeMatchup]
	and a
	ld a, EFFECTIVE
	jr nz, .reset
	call ResetDamage
	xor a
	ld [wTypeModifier], a
	inc a
	ld [wAttackMissed], a
	ret

.reset
	ld [wTypeMatchup], a
	ret

INCLUDE "engine/battle/ai/switch.asm"

INCLUDE "data/types/type_matchups.asm"

BattleCommand_DamageVariation:
; Modify the damage spread between 85% and 100%.

; Because of the method of division the probability distribution
; is not consistent. This makes the highest damage multipliers
; rarer than normal.

; No point in reducing 1 or 0 damage.
	ld hl, wCurDamage
	ld a, [hli]
	and a
	jr nz, .go
	ld a, [hl]
	cp 2
	ret c

.go
; Start with the maximum damage.
	xor a
	ldh [hMultiplicand + 0], a
	dec hl
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hl]
	ldh [hMultiplicand + 2], a

; Multiply by 85-100%...
.loop
	call BattleRandom
	rrca
	cp 85 percent + 1
	jr c, .loop

	ldh [hMultiplier], a
	call Multiply

; ...divide by 100%...
	ld a, 100 percent
	ldh [hDivisor], a
	ld b, $4
	call Divide

; ...to get .85-1.00x damage.
	ldh a, [hQuotient + 2]
	ld hl, wCurDamage
	ld [hli], a
	ldh a, [hQuotient + 3]
	ld [hl], a
	ret

BattleCommand_CheckHit:
	call .DreamEater
	jp z, .Miss

	call .Protect
	jp nz, .Miss

	call .DrainSub
	jp z, .Miss

	call .LockOn
	ret nz

	call .FlyDigMoves
	jp nz, .Miss

	call .ThunderRain
	ret z

	call .XAccuracy
	ret nz

	; Perfect-accuracy moves
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_ALWAYS_HIT
	ret z

	call .StatModifiers

	ld a, [wPlayerMoveStruct + MOVE_ACC]
	ld b, a
	ldh a, [hBattleTurn]
	and a
	jr z, .BrightPowder
	ld a, [wEnemyMoveStruct + MOVE_ACC]
	ld b, a

.BrightPowder:
	push bc
	call GetOpponentItem
	ld a, b
	cp HELD_BRIGHTPOWDER
	ld a, c ; % miss
	pop bc
	jr nz, .skip_brightpowder

	ld c, a
	ld a, b
	sub c
	ld b, a
	jr nc, .skip_brightpowder
	ld b, 0

.skip_brightpowder
	ld a, b
	cp -1
	jr z, .Hit

	call BattleRandom
	cp b
	jr nc, .Miss

.Hit:
	ret

.Miss:
; Keep the damage value intact if we're using (Hi) Jump Kick.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_JUMP_KICK
	jr z, .Missed
	call ResetDamage

.Missed:
	ld a, 1
	ld [wAttackMissed], a
	ret

.DreamEater:
; Return z if we're trying to eat the dream of
; a monster that isn't sleeping.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_DREAM_EATER
	ret nz

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and SLP_MASK
	ret

.Protect:
; Return nz if the opponent is protected.
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_PROTECT, a
	ret z

	ld c, 40
	call DelayFrames

; 'protecting itself!'
	ld hl, ProtectingItselfText
	call StdBattleTextbox

	ld c, 40
	call DelayFrames

	ld a, 1
	and a
	ret

.LockOn:
; Return nz if we are locked-on and aren't trying to use Earthquake,
; Fissure or Magnitude on a monster that is flying.
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_LOCK_ON, [hl]
	res SUBSTATUS_LOCK_ON, [hl]
	ret z

	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	bit SUBSTATUS_FLYING, a
	ld hl, .DigMoves
	jr nz, .check_move_in_list
	ld a, 1
	and a
	ret

.DrainSub:
; Return z if using an HP drain move on a substitute.
	call CheckSubstituteOpp
	jr z, .not_draining_sub

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar

	cp EFFECT_LEECH_HIT
	ret z
	cp EFFECT_DREAM_EATER
	ret z

.not_draining_sub
	ld a, 1
	and a
	ret

.FlyDigMoves:
; Check for moves that can hit underground/flying opponents.
; Return z if the current move can hit the opponent.

	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret z

	bit SUBSTATUS_FLYING, a
	ld hl, .FlyMoves
	jr z, .check_move_in_list
	ld hl, .DigMoves
.check_move_in_list
	; returns z (and a = 0) if the current move is in a given list, or nz (and a = 1) if not
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	call CheckMoveInList
	sbc a
	inc a
	ret

.FlyMoves:
	dw GUST
	dw WHIRLWIND
	dw THUNDER
	dw TWISTER
	dw -1

.DigMoves:
	dw EARTHQUAKE
	dw FISSURE
	dw MAGNITUDE
	dw -1

.ThunderRain:
; Return z if the current move always hits in rain, and it is raining.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_THUNDER
	ret nz

	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	ret

.XAccuracy:
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_X_ACCURACY, a
	ret

.StatModifiers:
	ldh a, [hBattleTurn]
	and a

	; load the user's accuracy into b and the opponent's evasion into c.
	ld hl, wPlayerMoveStruct + MOVE_ACC
	ld a, [wPlayerAccLevel]
	ld b, a
	ld a, [wEnemyEvaLevel]
	ld c, a

	jr z, .got_acc_eva

	ld hl, wEnemyMoveStruct + MOVE_ACC
	ld a, [wEnemyAccLevel]
	ld b, a
	ld a, [wPlayerEvaLevel]
	ld c, a

.got_acc_eva
	cp b
	jr c, .skip_foresight_check

	; if the target's evasion is greater than the user's accuracy,
	; check the target's foresight status
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_IDENTIFIED, a
	ret nz

.skip_foresight_check
	; subtract evasion from 14
	ld a, MAX_STAT_LEVEL + 1
	sub c
	ld c, a
	; store the base move accuracy for math ops
	xor a
	ldh [hMultiplicand + 0], a
	ldh [hMultiplicand + 1], a
	ld a, [hl]
	ldh [hMultiplicand + 2], a
	push hl
	ld d, 2 ; do this twice, once for the user's accuracy and once for the target's evasion

.accuracy_loop
	; look up the multiplier from the table
	push bc
	ld hl, AccuracyLevelMultipliers
	dec b
	sla b
	ld c, b
	ld b, 0
	add hl, bc
	pop bc
	; multiply by the first byte in that row...
	ld a, [hli]
	ldh [hMultiplier], a
	call Multiply
	; ... and divide by the second byte
	ld a, [hl]
	ldh [hDivisor], a
	ld b, 4
	call Divide
	; minimum accuracy is $0001
	ldh a, [hQuotient + 3]
	ld b, a
	ldh a, [hQuotient + 2]
	or b
	jr nz, .min_accuracy
	ldh [hQuotient + 2], a
	ld a, 1
	ldh [hQuotient + 3], a

.min_accuracy
	; do the same thing to the target's evasion
	ld b, c
	dec d
	jr nz, .accuracy_loop

	; if the result is more than 2 bytes, max out at 100%
	ldh a, [hQuotient + 2]
	and a
	ldh a, [hQuotient + 3]
	jr z, .finish_accuracy
	ld a, $ff

.finish_accuracy
	pop hl
	ld [hl], a
	ret

INCLUDE "data/battle/accuracy_multipliers.asm"

BattleCommand_EffectChance:
	xor a
	ld [wEffectFailed], a
	call CheckSubstituteOpp
	jr nz, .failed

	push hl
	ld hl, wPlayerMoveStruct + MOVE_CHANCE
	ldh a, [hBattleTurn]
	and a
	jr z, .got_move_chance
	ld hl, wEnemyMoveStruct + MOVE_CHANCE
.got_move_chance
; BUG: Moves with a 100% secondary effect chance will not trigger it in 1/256 uses (see docs/bugs_and_glitches.md)
	call BattleRandom
	cp [hl]
	pop hl
	ret c

.failed
	ld a, 1
	ld [wEffectFailed], a
	and a
	ret

BattleCommand_LowerSub:
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret z

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	bit SUBSTATUS_CHARGED, a
	jr nz, .already_charged

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_RAZOR_WIND
	jr z, .charge_turn
	cp EFFECT_SKY_ATTACK
	jr z, .charge_turn
	cp EFFECT_SKULL_BASH
	jr z, .charge_turn
	cp EFFECT_SOLARBEAM
	jr z, .charge_turn
	cp EFFECT_FLY
	jr z, .charge_turn

.already_charged
	call .Rampage
	jr z, .charge_turn

	call CheckUserIsCharging
	ret nz

.charge_turn
	call _CheckBattleScene
	jr c, .mimic_anims

	xor a
	ld [wNumHits], a
	inc a
	ld [wBattleAnimParam], a
	ld hl, SUBSTITUTE
	call GetMoveIDFromIndex
	jp LoadAnim

.mimic_anims
	call BattleCommand_LowerSubNoAnim
	jp BattleCommand_MoveDelay

.Rampage:
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_ROLLOUT
	jr z, .rollout_rampage
	cp EFFECT_RAMPAGE
	jr z, .rollout_rampage

	ld a, 1
	and a
	ret

.rollout_rampage
	ld a, [wSomeoneIsRampaging]
	and a
	ld a, 0
	ld [wSomeoneIsRampaging], a
	ret

BattleCommand_MoveAnim:
	call BattleCommand_LowerSub
	call BattleCommand_MoveAnimNoSub
	jp BattleCommand_RaiseSub

BattleCommand_MoveAnimNoSub:
	ld a, [wAttackMissed]
	and a
	jp nz, BattleCommand_MoveDelay

	ldh a, [hBattleTurn]
	and a
	ld de, wPlayerRolloutCount
	ld a, BATTLEANIM_ENEMY_DAMAGE
	jr z, .got_rollout_count
	ld de, wEnemyRolloutCount
	ld a, BATTLEANIM_PLAYER_DAMAGE

.got_rollout_count
	ld [wNumHits], a
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_MULTI_HIT
	jr z, .alternate_anim
	cp EFFECT_CONVERSION
	jr z, .alternate_anim
	cp EFFECT_DOUBLE_HIT
	jr z, .alternate_anim
	cp EFFECT_POISON_MULTI_HIT
	jr z, .alternate_anim
	cp EFFECT_TRIPLE_KICK
	jr z, .triplekick
	xor a
	ld [wBattleAnimParam], a

.triplekick
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	call SetMoveAnimationID
	call PlaySelectedFXAnim

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld hl, .fly_dig_moves
	call CheckMoveInList
	ret nc
	jp AppearUserLowerSub

.fly_dig_moves
	dw FLY
	dw DIG
	dw -1

.alternate_anim
	ld a, [wBattleAnimParam]
	and 1
	xor 1
	ld [wBattleAnimParam], a
	ld a, [de]
	cp 1
	push af
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	call SetMoveAnimationID
	pop af
	jr z, .play_anim
	xor a
	ld [wNumHits], a
.play_anim
	jp PlaySelectedFXAnim

BattleCommand_StatUpAnim:
	ld a, [wAttackMissed]
	and a
	jp nz, BattleCommand_MoveDelay

	xor a
	jr BattleCommand_StatUpDownAnim

BattleCommand_StatDownAnim:
	ld a, [wAttackMissed]
	and a
	jp nz, BattleCommand_MoveDelay

	ldh a, [hBattleTurn]
	and a
	ld a, BATTLEANIM_ENEMY_STAT_DOWN
	jr z, BattleCommand_StatUpDownAnim
	ld a, BATTLEANIM_WOBBLE

	; fallthrough

BattleCommand_StatUpDownAnim:
	ld [wNumHits], a
	xor a
	ld [wBattleAnimParam], a
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	call SetMoveAnimationID
	jp PlaySelectedFXAnim

BattleCommand_SwitchTurn:
	ldh a, [hBattleTurn]
	xor 1
	ldh [hBattleTurn], a
	ret

BattleCommand_RaiseSub:
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret z

	call _CheckBattleScene
	jp c, BattleCommand_RaiseSubNoAnim

	xor a
	ld [wNumHits], a
	ld a, $2
	ld [wBattleAnimParam], a
	ld hl, SUBSTITUTE
	call GetMoveIDFromIndex
	jp LoadAnim

BattleCommand_FailureText:
; If the move missed or failed, load the appropriate
; text, and end the effects of multi-turn or multi-
; hit moves.
	ld a, [wAttackMissed]
	and a
	ret z

	call GetFailureResultText
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr

	push hl
	ld hl, .fly_dig_moves
	call CheckMoveInList
	pop hl
	jr c, .fly_dig

; Move effect:
	inc hl
	ld a, [hl]

; BUG: Beat Up may fail to raise Substitute (see docs/bugs_and_glitches.md)
	cp EFFECT_MULTI_HIT
	jr z, .multihit
	cp EFFECT_DOUBLE_HIT
	jr z, .multihit
	cp EFFECT_POISON_MULTI_HIT
	jr z, .multihit
	jp EndMoveEffect

.multihit
	call BattleCommand_RaiseSub
	jp EndMoveEffect

.fly_dig
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_UNDERGROUND, [hl]
	res SUBSTATUS_FLYING, [hl]
	call AppearUserRaiseSub
	jp EndMoveEffect

.fly_dig_moves
	dw FLY
	dw DIG
	dw -1

BattleCommand_ApplyDamage:
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_ENDURE, a
	jr z, .focus_band

	call BattleCommand_FalseSwipe
	ld b, 0
	jr nc, .damage
	ld b, 1
	jr .damage

.focus_band
	call GetOpponentItem
	ld a, b
	cp HELD_FOCUS_BAND
	ld b, 0
	jr nz, .damage

	call BattleRandom
	cp c
	jr nc, .damage
	call BattleCommand_FalseSwipe
	ld b, 0
	jr nc, .damage
	ld b, 2

.damage
	push bc
	call .update_damage_taken
	ld c, FALSE
	ldh a, [hBattleTurn]
	and a
	jr nz, .damage_player
	call DoEnemyDamage
	jr .done_damage

.damage_player
	call DoPlayerDamage

.done_damage
	pop bc
	ld a, b
	and a
	ret z

	dec a
	jr nz, .focus_band_text
	ld hl, EnduredText
	jp StdBattleTextbox

.focus_band_text
	call GetOpponentItem
	ld a, [hl]
	ld [wNamedObjectIndex], a
	call GetItemName
	ld hl, HungOnText
	jp StdBattleTextbox

.update_damage_taken
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret nz

	ld de, wPlayerDamageTaken + 1
	ldh a, [hBattleTurn]
	and a
	jr nz, .got_damage_taken
	ld de, wEnemyDamageTaken + 1

.got_damage_taken
	ld a, [wCurDamage + 1]
	ld b, a
	ld a, [de]
	add b
	ld [de], a
	dec de
	ld a, [wCurDamage]
	ld b, a
	ld a, [de]
	adc b
	ld [de], a
	ret nc
	ld a, $ff
	ld [de], a
	inc de
	ld [de], a
	ret

GetFailureResultText:
	ld hl, DoesntAffectText
	ld de, DoesntAffectText
	ld a, [wTypeModifier]
	and $7f
	jr z, .got_text
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_FUTURE_SIGHT
	ld hl, ButItFailedText
	ld de, ItFailedText
	jr z, .got_text
	ld hl, AttackMissedText
	ld de, AttackMissed2Text
	ld a, [wCriticalHit]
	cp -1
	jr nz, .got_text
	ld hl, UnaffectedText
.got_text
	call FailText_CheckOpponentProtect
	xor a
	ld [wCriticalHit], a

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_JUMP_KICK
	ret nz

	ld a, [wTypeModifier]
	and $7f
	ret z

	ld hl, wCurDamage
	ld a, [hli]
	ld b, [hl]
rept 3
	srl a
	rr b
endr
	ld [hl], b
	dec hl
	ld [hli], a
	or b
	jr nz, .do_at_least_1_damage
	inc a
	ld [hl], a
.do_at_least_1_damage
	ld hl, CrashedText
	call StdBattleTextbox
	ld a, $1
	ld [wBattleAnimParam], a
	call LoadMoveAnim
	ld c, TRUE
	ldh a, [hBattleTurn]
	and a
	jp nz, DoEnemyDamage
	jp DoPlayerDamage

FailText_CheckOpponentProtect:
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_PROTECT, a
	jr z, .not_protected
	ld h, d
	ld l, e
.not_protected
	jp StdBattleTextbox

BattleCommand_BideFailText:
	ld a, [wAttackMissed]
	and a
	ret z

	ld a, [wTypeModifier]
	and $7f
	jp z, PrintDoesntAffect
	jp PrintButItFailed

BattleCommand_CriticalText:
; Prints the message for critical hits or one-hit KOs.

; If there is no message to be printed, wait 20 frames.
	ld a, [wCriticalHit]
	and a
	jr z, .wait

	dec a
	add a
	ld hl, .texts
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call StdBattleTextbox

	xor a
	ld [wCriticalHit], a

.wait
	ld c, 20
	jp DelayFrames

.texts
	dw CriticalHitText
	dw OneHitKOText

BattleCommand_StartLoop:
	ld hl, wPlayerRolloutCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyRolloutCount
.ok
	xor a
	ld [hl], a
	ret

BattleCommand_SuperEffectiveLoopText:
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	bit SUBSTATUS_IN_LOOP, a
	ret nz

	; fallthrough

BattleCommand_SuperEffectiveText:
	ld a, [wTypeModifier]
	and $7f
	cp EFFECTIVE
	ret z
	ld hl, SuperEffectiveText
	jr nc, .print
	ld hl, NotVeryEffectiveText
.print
	jp StdBattleTextbox

BattleCommand_CheckFaint:
; Faint the opponent if its HP reached zero
;  and faint the user along with it if it used Destiny Bond.
; Ends the move effect if the opponent faints.

	ld hl, wEnemyMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wBattleMonHP

.got_hp
	ld a, [hli]
	or [hl]
	ret nz

	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVar
	bit SUBSTATUS_DESTINY_BOND, a
	jr z, .no_dbond

	ld hl, TookDownWithItText
	call StdBattleTextbox

	ldh a, [hBattleTurn]
	and a
	ld hl, wEnemyMonMaxHP + 1
	bccoord 2, 2 ; hp bar
	ld a, 0
	jr nz, .got_max_hp
	ld hl, wBattleMonMaxHP + 1
	bccoord 10, 9 ; hp bar
	ld a, 1

.got_max_hp
	ld [wWhichHPBar], a
	ld a, [hld]
	ld [wHPBuffer1], a
	ld a, [hld]
	ld [wHPBuffer1 + 1], a
	ld a, [hl]
	ld [wHPBuffer2], a
	xor a
	ld [hld], a
	ld a, [hl]
	ld [wHPBuffer2 + 1], a
	xor a
	ld [hl], a
	ld [wHPBuffer3], a
	ld [wHPBuffer3 + 1], a
	ld h, b
	ld l, c
	predef AnimateHPBar
	call RefreshBattleHuds

	call BattleCommand_SwitchTurn
	xor a
	ld [wNumHits], a
	inc a
	ld [wBattleAnimParam], a
	ld hl, DESTINY_BOND
	call GetMoveIDFromIndex
	call LoadAnim
	call BattleCommand_SwitchTurn

	jr .finish

.no_dbond
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_MULTI_HIT
	jr z, .multiple_hit_raise_sub
	cp EFFECT_DOUBLE_HIT
	jr z, .multiple_hit_raise_sub
	cp EFFECT_POISON_MULTI_HIT
	jr z, .multiple_hit_raise_sub
	cp EFFECT_TRIPLE_KICK
	jr z, .multiple_hit_raise_sub
	cp EFFECT_BEAT_UP
	jr nz, .finish

.multiple_hit_raise_sub
	call BattleCommand_RaiseSub

.finish
	jp EndMoveEffect

BattleCommand_BuildOpponentRage:
	jp .start

.start
	ld a, [wAttackMissed]
	and a
	ret nz

	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_RAGE, a
	ret z

	ld de, wEnemyRageCounter
	ldh a, [hBattleTurn]
	and a
	jr z, .player
	ld de, wPlayerRageCounter
.player
	ld a, [de]
	inc a
	ret z
	ld [de], a

	call BattleCommand_SwitchTurn
	ld hl, RageBuildingText
	call StdBattleTextbox
	jp BattleCommand_SwitchTurn

BattleCommand_RageDamage:
	ld a, [wCurDamage]
	ld h, a
	ld b, a
	ld a, [wCurDamage + 1]
	ld l, a
	ld c, a
	ldh a, [hBattleTurn]
	and a
	ld a, [wPlayerRageCounter]
	jr z, .rage_loop
	ld a, [wEnemyRageCounter]
.rage_loop
	and a
	jr z, .done
	dec a
	add hl, bc
	jr nc, .rage_loop
	ld hl, $ffff
.done
	ld a, h
	ld [wCurDamage], a
	ld a, l
	ld [wCurDamage + 1], a
	ret

EndMoveEffect:
	ld a, [wBattleScriptBufferAddress]
	ld l, a
	ld a, [wBattleScriptBufferAddress + 1]
	ld h, a
	ld a, endmove_command
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

DittoMetalPowder:
	ld a, MON_SPECIES
	call BattlePartyAttr
	ldh a, [hBattleTurn]
	and a
	ld a, [hl]
	jr nz, .got_species
	ld a, [wTempEnemyMonSpecies]

.got_species
	push hl
	call GetPokemonIndexFromID
	ld a, l
	sub LOW(DITTO)
	if HIGH(DITTO) == 0
		or h
		pop hl
	else
		ld a, h
		pop hl
		ret nz
		if HIGH(DITTO) == 1
			dec a
		else
			cp HIGH(DITTO)
		endc
	endc
	ret nz

	push bc
	call GetOpponentItem
	ld a, [hl]
	cp METAL_POWDER
	pop bc
	ret nz

; BUG: Metal Powder can increase damage taken with boosted (Special) Defense (see docs/bugs_and_glitches.md)
	ld a, c
	srl a
	add c
	ld c, a
	ret nc

	srl b
	ld a, b
	and a
	jr nz, .done
	inc b
.done
	scf
	rr c
	ret

BattleCommand_DamageStats:
	ldh a, [hBattleTurn]
	and a
	jp nz, EnemyAttackDamage

	; fallthrough

PlayerAttackDamage:
; Return move power d, player level e, enemy defense c and player attack b.

	call ResetDamage

	ld hl, wPlayerMoveStructPower
	ld a, [hli]
	and a
	ld d, a
	ret z

	ld a, [hl]
	cp SPECIAL
	jr nc, .special

; physical
	ld hl, wEnemyMonDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]

	ld a, [wEnemyScreens]
	bit SCREENS_REFLECT, a
	jr z, .physicalcrit
	sla c
	rl b

.physicalcrit
	ld hl, wBattleMonAttack
	call CheckDamageStatsCritical
	jr c, .thickclub

	ld hl, wEnemyDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wPlayerAttack
	jr .thickclub

.special
	ld hl, wEnemyMonSpclDef
	ld a, [hli]
	ld b, a
	ld c, [hl]

	ld a, [wEnemyScreens]
	bit SCREENS_LIGHT_SCREEN, a
	jr z, .specialcrit
	sla c
	rl b

.specialcrit
	ld hl, wBattleMonSpclAtk
	call CheckDamageStatsCritical
	jr c, .lightball

	ld hl, wEnemySpDef
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wPlayerSpAtk

.lightball
; Note: Returns player special attack at hl in hl.
	call LightBallBoost
	jr .done

.thickclub
; Note: Returns player attack at hl in hl.
	call ThickClubBoost

.done
	call TruncateHL_BC

	ld a, [wBattleMonLevel]
	ld e, a
	call DittoMetalPowder

	ld a, 1
	and a
	ret

TruncateHL_BC:
.loop
; Truncate 16-bit values hl and bc to 8-bit values b and c respectively.
; b = hl, c = bc

	ld a, h
	or b
	jr z, .finish

	srl b
	rr c
	srl b
	rr c

	ld a, c
	or b
	jr nz, .done_bc
	inc c

.done_bc
	srl h
	rr l
	srl h
	rr l

	ld a, l
	or h
	jr nz, .finish
	inc l

.finish
; BUG: Reflect and Light Screen can make (Special) Defense wrap around above 1024 (see docs/bugs_and_glitches.md)
	ld a, [wLinkMode]
	cp LINK_COLOSSEUM
	jr z, .done
; If we go back to the loop point,
; it's the same as doing this exact
; same check twice.
	ld a, h
	or b
	jr nz, .loop

.done
	ld b, l
	ret

CheckDamageStatsCritical:
; Return carry if boosted stats should be used in damage calculations.
; Unboosted stats should be used if the attack is a critical hit,
;  and the stage of the opponent's defense is higher than the user's attack.

	ld a, [wCriticalHit]
	and a
	scf
	ret z

	push hl
	push bc
	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy
	ld a, [wPlayerMoveStructType]
	cp SPECIAL
; special
	ld a, [wPlayerSAtkLevel]
	ld b, a
	ld a, [wEnemySDefLevel]
	jr nc, .end
; physical
	ld a, [wPlayerAtkLevel]
	ld b, a
	ld a, [wEnemyDefLevel]
	jr .end

.enemy
	ld a, [wEnemyMoveStructType]
	cp SPECIAL
; special
	ld a, [wEnemySAtkLevel]
	ld b, a
	ld a, [wPlayerSDefLevel]
	jr nc, .end
; physical
	ld a, [wEnemyAtkLevel]
	ld b, a
	ld a, [wPlayerDefLevel]
.end
	cp b
	pop bc
	pop hl
	ret

ThickClubBoost:
; Return in hl the stat value at hl.

; If the attacking monster is Cubone or Marowak and
; it's holding a Thick Club, double it.
	push bc
	push de
	ld bc, CUBONE
	ld d, THICK_CLUB
	call SpeciesItemBoost
	if MAROWAK == (CUBONE + 1)
		inc bc
	else
		ld bc, MAROWAK
	endc
	call DoubleStatIfSpeciesHoldingItem
	pop de
	pop bc
	ret

LightBallBoost:
; Return in hl the stat value at hl.

; If the attacking monster is Pikachu and it's
; holding a Light Ball, double it.
	push bc
	push de
	ld bc, PIKACHU
	ld d, LIGHT_BALL
	call SpeciesItemBoost
	pop de
	pop bc
	ret

SpeciesItemBoost:
; Return in hl the stat value at hl.

; If the attacking monster is species bc and
; it's holding item d, double it.

	ld a, [hli]
	ld l, [hl]
	ld h, a
	; fallthrough

DoubleStatIfSpeciesHoldingItem:
; If the attacking monster is species bc and
; it's holding item d, double the stat in hl.

	push hl
	ld a, MON_SPECIES
	call BattlePartyAttr

	ldh a, [hBattleTurn]
	and a
	ld a, [hl]
	jr z, .CompareSpecies
	ld a, [wTempEnemyMonSpecies]
.CompareSpecies:

	call GetPokemonIndexFromID
	ld a, h
	cp b
	ld a, l
	pop hl
	ret nz
	cp c
	ret nz

	push hl
	call GetUserItem
	ld a, [hl]
	pop hl
	cp d
	ret nz

; Double the stat
; BUG: Thick Club and Light Ball can make (Special) Attack wrap around above 1024 (see docs/bugs_and_glitches.md)
	sla l
	rl h
	ret

EnemyAttackDamage:
	call ResetDamage

; No damage dealt with 0 power.
	ld hl, wEnemyMoveStructPower
	ld a, [hli] ; hl = wEnemyMoveStructType
	ld d, a
	and a
	ret z

	ld a, [hl]
	cp SPECIAL
	jr nc, .special

; physical
	ld hl, wBattleMonDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]

	ld a, [wPlayerScreens]
	bit SCREENS_REFLECT, a
	jr z, .physicalcrit
	sla c
	rl b

.physicalcrit
	ld hl, wEnemyMonAttack
	call CheckDamageStatsCritical
	jr c, .thickclub

	ld hl, wPlayerDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wEnemyAttack
	jr .thickclub

.special
	ld hl, wBattleMonSpclDef
	ld a, [hli]
	ld b, a
	ld c, [hl]

	ld a, [wPlayerScreens]
	bit SCREENS_LIGHT_SCREEN, a
	jr z, .specialcrit
	sla c
	rl b

.specialcrit
	ld hl, wEnemyMonSpclAtk
	call CheckDamageStatsCritical
	jr c, .lightball
	ld hl, wPlayerSpDef
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wEnemySpAtk

.lightball
	call LightBallBoost
	jr .done

.thickclub
	call ThickClubBoost

.done
	call TruncateHL_BC

	ld a, [wEnemyMonLevel]
	ld e, a
	call DittoMetalPowder

	ld a, 1
	and a
	ret

INCLUDE "engine/battle/move_effects/beat_up.asm"

BattleCommand_ClearMissDamage:
	ld a, [wAttackMissed]
	and a
	ret z

	jp ResetDamage

HitSelfInConfusion:
	call ResetDamage
	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonDefense
	ld de, wPlayerScreens
	ld a, [wBattleMonLevel]
	jr z, .got_it

	ld hl, wEnemyMonDefense
	ld de, wEnemyScreens
	ld a, [wEnemyMonLevel]
.got_it
	push af
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld a, [de]
	bit SCREENS_REFLECT, a
	jr z, .mimic_screen

	sla c
	rl b
.mimic_screen
	dec hl
	dec hl
	dec hl
	ld a, [hli]
	ld l, [hl]
	ld h, a
	call TruncateHL_BC
	ld d, 40
	pop af
	ld e, a
	ret

BattleCommand_DamageCalc:
; Return a damage value for move power d, player level e, enemy defense c and player attack b.
; BUG: Confusion damage is affected by type-boosting items and Explosion/Self-Destruct doubling (see docs/bugs_and_glitches.md)

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	and TYPE_MASK

; Selfdestruct and Explosion halve defense.
	cp EFFECT_SELFDESTRUCT
	jr nz, .dont_selfdestruct

	srl c
	jr nz, .dont_selfdestruct
	inc c

.dont_selfdestruct

; Variable-hit moves and Conversion can have a power of 0.
	cp EFFECT_MULTI_HIT
	jr z, .skip_zero_damage_check

	cp EFFECT_CONVERSION
	jr z, .skip_zero_damage_check

; No damage if move power is 0.
	ld a, d
	and a
	ret z

.skip_zero_damage_check
; Minimum defense value is 1.
	ld a, c
	and a
	jr nz, .not_dividing_by_zero
	ld c, 1
.not_dividing_by_zero

	xor a
	ld hl, hDividend
	ld [hli], a
	ld [hli], a
	ld [hl], a

; Level * 2
	ld a, e
	add a
	jr nc, .level_not_overflowing
	ld [hl], 1
.level_not_overflowing
	inc hl
	ld [hli], a

; / 5
	ld a, 5
	ld [hld], a
	push bc
	ld b, 4
	call Divide
	pop bc

; + 2
	inc [hl]
	inc [hl]

; * bp
	inc hl
	ld [hl], d
	call Multiply

; * Attack
	ld [hl], b
	call Multiply

; / Defense
	ld [hl], c
	ld b, 4
	call Divide

; / 50
	ld [hl], 50
	ld b, $4
	call Divide

; Item boosts
	call GetUserItem

	ld a, b
	and a
	jr z, .DoneItem

	ld hl, TypeBoostItems

.NextItem:
	ld a, [hli]
	cp -1
	jr z, .DoneItem

; Item effect
	cp b
	ld a, [hli]
	jr nz, .NextItem

; Type
	ld b, a
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	cp b
	jr nz, .DoneItem

; * 100 + item effect amount
	ld a, c
	add 100
	ldh [hMultiplier], a
	call Multiply

; / 100
	ld a, 100
	ldh [hDivisor], a
	ld b, 4
	call Divide

.DoneItem:
; Critical hits
	call .CriticalMultiplier

; Update wCurDamage. Max 999 (capped at 997, then add 2).
DEF MAX_DAMAGE EQU 999
DEF MIN_DAMAGE EQU 2
DEF DAMAGE_CAP EQU MAX_DAMAGE - MIN_DAMAGE

	ld hl, wCurDamage
	ld b, [hl]
	ldh a, [hQuotient + 3]
	add b
	ldh [hQuotient + 3], a
	jr nc, .dont_cap_1

	ldh a, [hQuotient + 2]
	inc a
	ldh [hQuotient + 2], a
	and a
	jr z, .Cap

.dont_cap_1
	ldh a, [hQuotient]
	ld b, a
	ldh a, [hQuotient + 1]
	or a
	jr nz, .Cap

	ldh a, [hQuotient + 2]
	cp HIGH(DAMAGE_CAP + 1)
	jr c, .dont_cap_2

	cp HIGH(DAMAGE_CAP + 1) + 1
	jr nc, .Cap

	ldh a, [hQuotient + 3]
	cp LOW(DAMAGE_CAP + 1)
	jr nc, .Cap

.dont_cap_2
	inc hl

	ldh a, [hQuotient + 3]
	ld b, [hl]
	add b
	ld [hld], a

	ldh a, [hQuotient + 2]
	ld b, [hl]
	adc b
	ld [hl], a
	jr c, .Cap

	ld a, [hl]
	cp HIGH(DAMAGE_CAP + 1)
	jr c, .dont_cap_3

	cp HIGH(DAMAGE_CAP + 1) + 1
	jr nc, .Cap

	inc hl
	ld a, [hld]
	cp LOW(DAMAGE_CAP + 1)
	jr c, .dont_cap_3

.Cap:
	ld a, HIGH(DAMAGE_CAP)
	ld [hli], a
	ld a, LOW(DAMAGE_CAP)
	ld [hld], a

.dont_cap_3
; Add back MIN_DAMAGE (capping at 999).
	inc hl
	ld a, [hl]
	add MIN_DAMAGE
	ld [hld], a
	jr nc, .dont_floor
	inc [hl]
.dont_floor

; Returns nz and nc.
	ld a, 1
	and a
	ret

.CriticalMultiplier:
	ld a, [wCriticalHit]
	and a
	ret z

; x2
	ldh a, [hQuotient + 3]
	add a
	ldh [hQuotient + 3], a

	ldh a, [hQuotient + 2]
	rl a
	ldh [hQuotient + 2], a

; Cap at $ffff.
	ret nc

	ld a, $ff
	ldh [hQuotient + 2], a
	ldh [hQuotient + 3], a

	ret

INCLUDE "data/types/type_boost_items.asm"

BattleCommand_ConstantDamage:
	ld hl, wBattleMonLevel
	ldh a, [hBattleTurn]
	and a
	jr z, .got_turn
	ld hl, wEnemyMonLevel

.got_turn
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_LEVEL_DAMAGE
	ld b, [hl]
	ld a, 0
	jr z, .got_power

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_PSYWAVE
	jr z, .psywave

	cp EFFECT_SUPER_FANG
	jr z, .super_fang

	cp EFFECT_REVERSAL
	jr z, .reversal

	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVar
	ld b, a
	ld a, $0
	jr .got_power

.psywave
	ld a, b
	srl a
	add b
	ld b, a
.psywave_loop
	call BattleRandom
	and a
	jr z, .psywave_loop
	cp b
	jr nc, .psywave_loop
	ld b, a
	ld a, 0
	jr .got_power

.super_fang
	ld hl, wEnemyMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wBattleMonHP
.got_hp
	ld a, [hli]
	srl a
	ld b, a
	ld a, [hl]
	rr a
	push af
	ld a, b
	pop bc
	and a
	jr nz, .got_power
	or b
	ld a, 0
	jr nz, .got_power
	ld b, 1
	jr .got_power

.got_power
	ld hl, wCurDamage
	ld [hli], a
	ld [hl], b
	ret

.reversal
	ld hl, wBattleMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .reversal_got_hp
	ld hl, wEnemyMonHP
.reversal_got_hp
	xor a
	ldh [hDividend], a
	ldh [hMultiplicand + 0], a
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hli]
	ldh [hMultiplicand + 2], a
	ld a, 48
	ldh [hMultiplier], a
	call Multiply
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ldh [hDivisor], a
	ld a, b
	and a
	jr z, .skip_to_divide

	ldh a, [hProduct + 4]
	srl b
	rr a
	srl b
	rr a
	ldh [hDivisor], a
	ldh a, [hProduct + 2]
	ld b, a
	srl b
	ldh a, [hProduct + 3]
	rr a
	srl b
	rr a
	ldh [hDividend + 3], a
	ld a, b
	ldh [hDividend + 2], a

.skip_to_divide
	ld b, 4
	call Divide
	ldh a, [hQuotient + 3]
	ld b, a
	ld hl, FlailReversalPower

.reversal_loop
	ld a, [hli]
	cp b
	jr nc, .break_loop
	inc hl
	jr .reversal_loop

.break_loop
	ldh a, [hBattleTurn]
	and a
	ld a, [hl]
	jr nz, .notPlayersTurn

	ld hl, wPlayerMoveStructPower
	ld [hl], a
	push hl
	call PlayerAttackDamage
	jr .notEnemysTurn

.notPlayersTurn
	ld hl, wEnemyMoveStructPower
	ld [hl], a
	push hl
	call EnemyAttackDamage

.notEnemysTurn
	call BattleCommand_DamageCalc
	pop hl
	ld [hl], 1
	ret

INCLUDE "data/moves/flail_reversal_power.asm"

INCLUDE "engine/battle/move_effects/counter.asm"

INCLUDE "engine/battle/move_effects/encore.asm"

INCLUDE "engine/battle/move_effects/pain_split.asm"

INCLUDE "engine/battle/move_effects/snore.asm"

INCLUDE "engine/battle/move_effects/conversion2.asm"

INCLUDE "engine/battle/move_effects/lock_on.asm"

INCLUDE "engine/battle/move_effects/sketch.asm"

BattleCommand_DefrostOpponent:
; Thaw the opponent if frozen, and
; raise the user's Attack one stage.

	call AnimateCurrentMove

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	call Defrost

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVarAddr
	ld a, [hl]
	push hl
	push af

	ld a, EFFECT_ATTACK_UP
	ld [hl], a
	call BattleCommand_StatUp

	pop af
	pop hl
	ld [hl], a
	ret

INCLUDE "engine/battle/move_effects/sleep_talk.asm"

INCLUDE "engine/battle/move_effects/destiny_bond.asm"

INCLUDE "engine/battle/move_effects/spite.asm"

INCLUDE "engine/battle/move_effects/false_swipe.asm"

INCLUDE "engine/battle/move_effects/heal_bell.asm"

