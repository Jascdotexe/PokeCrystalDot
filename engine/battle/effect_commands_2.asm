FarPlayBattleAnimation:
; play animation de

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret nz

	; fallthrough

PlayFXAnimID:
	ld a, e
	ld [wFXAnimID], a
	ld a, d
	ld [wFXAnimID + 1], a
PlaySelectedFXAnim:
	ld c, 3
	call DelayFrames
	callfar PlayBattleAnim
	ret

DoEnemyDamage:
	ld hl, wCurDamage
	ld a, [hli]
	ld b, a
	ld a, [hl]
	or b
	jr z, .did_no_damage

	ld a, c
	and a
	jr nz, .ignore_substitute
	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	jp nz, DoSubstituteDamage

.ignore_substitute
	; Subtract wCurDamage from wEnemyMonHP.
	;  store original HP in little endian wHPBuffer2
	ld a, [hld]
	ld b, a
	ld a, [wEnemyMonHP + 1]
	ld [wHPBuffer2], a
	sub b
	ld [wEnemyMonHP + 1], a
	ld a, [hl]
	ld b, a
	ld a, [wEnemyMonHP]
	ld [wHPBuffer2 + 1], a
	sbc b
	ld [wEnemyMonHP], a
if DEF(_DEBUG)
	push af
	ld a, BANK(sSkipBattle)
	call OpenSRAM
	ld a, [sSkipBattle]
	call CloseSRAM
	or a
	; If [sSkipBattle] is nonzero, skip the "jr nc, .no_underflow" check,
	; so any attack deals maximum damage to the enemy.
	jr nz, .debug_skip
	pop af
	jr nc, .no_underflow
	push af
.debug_skip
	pop af
else
	jr nc, .no_underflow
endc

	ld a, [wHPBuffer2 + 1]
	ld [hli], a
	ld a, [wHPBuffer2]
	ld [hl], a
	xor a
	ld hl, wEnemyMonHP
	ld [hli], a
	ld [hl], a

.no_underflow
	ld hl, wEnemyMonMaxHP
	ld a, [hli]
	ld [wHPBuffer1 + 1], a
	ld a, [hl]
	ld [wHPBuffer1], a
	ld hl, wEnemyMonHP
	ld a, [hli]
	ld [wHPBuffer3 + 1], a
	ld a, [hl]
	ld [wHPBuffer3], a

	hlcoord 2, 2
	xor a
	ld [wWhichHPBar], a
	predef AnimateHPBar
.did_no_damage
	jp RefreshBattleHuds

DoPlayerDamage:
	ld hl, wCurDamage
	ld a, [hli]
	ld b, a
	ld a, [hl]
	or b
	jr z, .did_no_damage

	ld a, c
	and a
	jr nz, .ignore_substitute
	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	jp nz, DoSubstituteDamage

.ignore_substitute
	; Subtract wCurDamage from wBattleMonHP.
	;  store original HP in little endian wHPBuffer2
	;  store new HP in little endian wHPBuffer3
	ld a, [hld]
	ld b, a
	ld a, [wBattleMonHP + 1]
	ld [wHPBuffer2], a
	sub b
	ld [wBattleMonHP + 1], a
	ld [wHPBuffer3], a
	ld b, [hl]
	ld a, [wBattleMonHP]
	ld [wHPBuffer2 + 1], a
	sbc b
	ld [wBattleMonHP], a
	ld [wHPBuffer3 + 1], a
	jr nc, .no_underflow

	ld a, [wHPBuffer2 + 1]
	ld [hli], a
	ld a, [wHPBuffer2]
	ld [hl], a
	xor a
	ld hl, wBattleMonHP
	ld [hli], a
	ld [hl], a
	ld hl, wHPBuffer3
	ld [hli], a
	ld [hl], a

.no_underflow
	ld hl, wBattleMonMaxHP
	ld a, [hli]
	ld [wHPBuffer1 + 1], a
	ld a, [hl]
	ld [wHPBuffer1], a

	hlcoord 10, 9
	ld a, 1
	ld [wWhichHPBar], a
	predef AnimateHPBar
.did_no_damage
	jp RefreshBattleHuds

DoSubstituteDamage:
	ld hl, SubTookDamageText
	call StdBattleTextbox

	ld de, wEnemySubstituteHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld de, wPlayerSubstituteHP
.got_hp

	ld hl, wCurDamage
	ld a, [hli]
	and a
	jr nz, .broke

	ld a, [de]
	sub [hl]
	ld [de], a
	jr z, .broke
	jr nc, .done

.broke
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVarAddr
	res SUBSTATUS_SUBSTITUTE, [hl]

	ld hl, SubFadedText
	call StdBattleTextbox

	call BattleCommand_SwitchTurn
	call BattleCommand_LowerSubNoAnim
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	call z, AppearUserLowerSub
	call BattleCommand_SwitchTurn

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVarAddr
	cp EFFECT_MULTI_HIT
	jr z, .ok
	cp EFFECT_DOUBLE_HIT
	jr z, .ok
	cp EFFECT_POISON_MULTI_HIT
	jr z, .ok
	cp EFFECT_TRIPLE_KICK
	jr z, .ok
	cp EFFECT_BEAT_UP
	jr z, .ok
	xor a
	ld [hl], a
.ok
	call RefreshBattleHuds
.done
	jp ResetDamage

UpdateMoveData:
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr
	ld d, h
	ld e, l

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld [wCurSpecies], a
	ld [wNamedObjectIndex], a

	call GetMoveData
	call GetMoveName
	jp CopyName1

BattleCommand_SleepTarget:
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_SLEEP
	jr nz, .not_protected_by_item

	ld a, [hl]
	ld [wNamedObjectIndex], a
	call GetItemName
	ld hl, ProtectedByText
	jr .fail

.not_protected_by_item
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	ld d, h
	ld e, l
	ld a, [de]
	and SLP_MASK
	ld hl, AlreadyAsleepText
	jr nz, .fail

	ld a, [wAttackMissed]
	and a
	jp nz, PrintDidntAffect2

	ld hl, DidntAffect1Text
	call .CheckAIRandomFail
	jr c, .fail

	ld a, [de]
	and a
	jr nz, .fail

	call CheckSubstituteOpp
	jr nz, .fail

	call AnimateCurrentMove
	ld b, SLP_MASK
	ld a, [wInBattleTowerBattle]
	and a
	jr z, .random_loop
	ld b, %011

.random_loop
	call BattleRandom
	and b
	jr z, .random_loop
	cp SLP_MASK
	jr z, .random_loop
	inc a
	ld [de], a
	call UpdateOpponentInParty
	call RefreshBattleHuds

	ld hl, FellAsleepText
	call StdBattleTextbox

	farcall UseHeldStatusHealingItem

	jp z, OpponentCantMove
	ret

.fail
	push hl
	call AnimateFailedMove
	pop hl
	jp StdBattleTextbox

.CheckAIRandomFail:
	; Enemy turn
	ldh a, [hBattleTurn]
	and a
	jr z, .dont_fail

	; Not in link battle
	ld a, [wLinkMode]
	and a
	jr nz, .dont_fail

	ld a, [wInBattleTowerBattle]
	and a
	jr nz, .dont_fail

	; Not locked-on by the enemy
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	jr nz, .dont_fail

	call BattleRandom
	cp 25 percent + 1 ; 25% chance AI fails
	ret c

.dont_fail
	xor a
	ret

BattleCommand_PoisonTarget:
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	ret nz
	ld a, [wTypeModifier]
	and $7f
	ret z
	call CheckIfTargetIsPoisonType
	ret z
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_POISON
	ret z
	ld a, [wEffectFailed]
	and a
	ret nz
	call SafeCheckSafeguard
	ret nz

	call PoisonOpponent
	ld de, ANIM_PSN
	call PlayOpponentBattleAnim
	call RefreshBattleHuds

	ld hl, WasPoisonedText
	call StdBattleTextbox

	farcall UseHeldStatusHealingItem
	ret

BattleCommand_Poison:
	ld hl, DoesntAffectText
	ld a, [wTypeModifier]
	and $7f
	jp z, .failed

	call CheckIfTargetIsPoisonType
	jp z, .failed

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	ld b, a
	ld hl, AlreadyPoisonedText
	and 1 << PSN
	jp nz, .failed

	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_POISON
	jr nz, .do_poison
	ld a, [hl]
	ld [wNamedObjectIndex], a
	call GetItemName
	ld hl, ProtectedByText
	jr .failed

.do_poison
	ld hl, DidntAffect1Text
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and a
	jr nz, .failed

	ldh a, [hBattleTurn]
	and a
	jr z, .dont_sample_failure

	ld a, [wLinkMode]
	and a
	jr nz, .dont_sample_failure

	ld a, [wInBattleTowerBattle]
	and a
	jr nz, .dont_sample_failure

	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	jr nz, .dont_sample_failure

	call BattleRandom
	cp 25 percent + 1 ; 25% chance AI fails
	jr c, .failed

.dont_sample_failure
	call CheckSubstituteOpp
	jr nz, .failed
	ld a, [wAttackMissed]
	and a
	jr nz, .failed
	call .check_toxic
	jr z, .toxic

	call .apply_poison
	ld hl, WasPoisonedText
	call StdBattleTextbox
	jr .finished

.toxic
	set SUBSTATUS_TOXIC, [hl]
	xor a
	ld [de], a
	call .apply_poison

	ld hl, BadlyPoisonedText
	call StdBattleTextbox

.finished
	farcall UseHeldStatusHealingItem
	ret

.failed
	push hl
	call AnimateFailedMove
	pop hl
	jp StdBattleTextbox

.apply_poison
	call AnimateCurrentMove
	call PoisonOpponent
	jp RefreshBattleHuds

.check_toxic
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	ldh a, [hBattleTurn]
	and a
	ld de, wEnemyToxicCount
	jr z, .ok
	ld de, wPlayerToxicCount
.ok
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_TOXIC
	ret

CheckIfTargetIsPoisonType:
	ld de, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wBattleMonType1
.ok
	ld a, [de]
	inc de
	cp POISON
	ret z
	ld a, [de]
	cp POISON
	ret

PoisonOpponent:
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set PSN, [hl]
	jp UpdateOpponentInParty

BattleCommand_DrainTarget:
	call SapHealth
	ld hl, SuckedHealthText
	jp StdBattleTextbox

BattleCommand_EatDream:
	call SapHealth
	ld hl, DreamEatenText
	jp StdBattleTextbox

SapHealth:
	; Divide damage by 2, store it in hDividend
	ld hl, wCurDamage
	ld a, [hli]
	srl a
	ldh [hDividend], a
	ld b, a
	ld a, [hl]
	rr a
	ldh [hDividend + 1], a
	or b
	jr nz, .at_least_one
	ld a, 1
	ldh [hDividend + 1], a
.at_least_one

	ld hl, wBattleMonHP
	ld de, wBattleMonMaxHP
	ldh a, [hBattleTurn]
	and a
	jr z, .battlemonhp
	ld hl, wEnemyMonHP
	ld de, wEnemyMonMaxHP
.battlemonhp

	; Store current HP in little endian wHPBuffer2
	ld bc, wHPBuffer2 + 1
	ld a, [hli]
	ld [bc], a
	ld a, [hl]
	dec bc
	ld [bc], a

	; Store max HP in little endian wHPBuffer1
	ld a, [de]
	dec bc
	ld [bc], a
	inc de
	ld a, [de]
	dec bc
	ld [bc], a

	; Add hDividend to current HP and copy it to little endian wHPBuffer3
	ldh a, [hDividend + 1]
	ld b, [hl]
	add b
	ld [hld], a
	ld [wHPBuffer3], a
	ldh a, [hDividend]
	ld b, [hl]
	adc b
	ld [hli], a
	ld [wHPBuffer3 + 1], a
	jr c, .max_hp

	; Subtract current HP from max HP (to see if we have more than max HP)
	ld a, [hld]
	ld b, a
	ld a, [de]
	dec de
	sub b
	ld a, [hli]
	ld b, a
	ld a, [de]
	inc de
	sbc b
	jr nc, .finish

.max_hp
	; Load max HP into current HP and copy it to little endian wHPBuffer3
	ld a, [de]
	ld [hld], a
	ld [wHPBuffer3], a
	dec de
	ld a, [de]
	ld [hli], a
	ld [wHPBuffer3 + 1], a
	inc de

.finish
	ldh a, [hBattleTurn]
	and a
	hlcoord 10, 9
	ld a, $1
	jr z, .hp_bar
	hlcoord 2, 2
	xor a
.hp_bar
	ld [wWhichHPBar], a
	predef AnimateHPBar
	call RefreshBattleHuds
	jp UpdateBattleMonInParty

BattleCommand_BurnTarget:
	xor a
	ld [wNumHits], a
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	jp nz, Defrost
	ld a, [wTypeModifier]
	and $7f
	ret z
	call CheckMoveTypeMatchesTarget ; Don't burn a Fire-type
	ret z
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_BURN
	ret z
	ld a, [wEffectFailed]
	and a
	ret nz
	call SafeCheckSafeguard
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set BRN, [hl]
	call UpdateOpponentInParty
	ld hl, ApplyBrnEffectOnAttack
	call CallBattleCore
	ld de, ANIM_BRN
	call PlayOpponentBattleAnim
	call RefreshBattleHuds

	ld hl, WasBurnedText
	call StdBattleTextbox

	farcall UseHeldStatusHealingItem
	ret

Defrost:
	ld a, [hl]
	and 1 << FRZ
	ret z

	xor a
	ld [hl], a

	ldh a, [hBattleTurn]
	and a
	ld a, [wCurOTMon]
	ld hl, wOTPartyMon1Status
	jr z, .ok
	ld hl, wPartyMon1Status
	ld a, [wCurBattleMon]
.ok

	call GetPartyLocation
	xor a
	ld [hl], a
	call UpdateOpponentInParty

	ld hl, DefrostedOpponentText
	jp StdBattleTextbox

BattleCommand_FreezeTarget:
	xor a
	ld [wNumHits], a
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	ret nz
	ld a, [wTypeModifier]
	and $7f
	ret z
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	ret z
	call CheckMoveTypeMatchesTarget ; Don't freeze an Ice-type
	ret z
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_FREEZE
	ret z
	ld a, [wEffectFailed]
	and a
	ret nz
	call SafeCheckSafeguard
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set FRZ, [hl]
	call UpdateOpponentInParty
	ld de, ANIM_FRZ
	call PlayOpponentBattleAnim
	call RefreshBattleHuds

	ld hl, WasFrozenText
	call StdBattleTextbox

	farcall UseHeldStatusHealingItem
	ret nz

	call OpponentCantMove
	call EndRechargeOpp
	ld hl, wEnemyJustGotFrozen
	ldh a, [hBattleTurn]
	and a
	jr z, .finish
	ld hl, wPlayerJustGotFrozen
.finish
	ld [hl], $1
	ret

BattleCommand_ParalyzeTarget:
	xor a
	ld [wNumHits], a
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	ret nz
	ld a, [wTypeModifier]
	and $7f
	ret z
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_PARALYZE
	ret z
	ld a, [wEffectFailed]
	and a
	ret nz
	call SafeCheckSafeguard
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set PAR, [hl]
	call UpdateOpponentInParty
	ld hl, ApplyPrzEffectOnSpeed
	call CallBattleCore
	ld de, ANIM_PAR
	call PlayOpponentBattleAnim
	call RefreshBattleHuds
	call PrintParalyze
	ld hl, UseHeldStatusHealingItem
	jp CallBattleCore

BattleCommand_AttackUp:
	ld b, ATTACK
	jr BattleCommand_StatUp

BattleCommand_DefenseUp:
	ld b, DEFENSE
	jr BattleCommand_StatUp

BattleCommand_SpeedUp:
	ld b, SPEED
	jr BattleCommand_StatUp

BattleCommand_SpecialAttackUp:
	ld b, SP_ATTACK
	jr BattleCommand_StatUp

BattleCommand_SpecialDefenseUp:
	ld b, SP_DEFENSE
	jr BattleCommand_StatUp

BattleCommand_AccuracyUp:
	ld b, ACCURACY
	jr BattleCommand_StatUp

BattleCommand_EvasionUp:
	ld b, EVASION
	jr BattleCommand_StatUp

BattleCommand_AttackUp2:
	ld b, $10 | ATTACK
	jr BattleCommand_StatUp

BattleCommand_DefenseUp2:
	ld b, $10 | DEFENSE
	jr BattleCommand_StatUp

BattleCommand_SpeedUp2:
	ld b, $10 | SPEED
	jr BattleCommand_StatUp

BattleCommand_SpecialAttackUp2:
	ld b, $10 | SP_ATTACK
	jr BattleCommand_StatUp

BattleCommand_SpecialDefenseUp2:
	ld b, $10 | SP_DEFENSE
	jr BattleCommand_StatUp

BattleCommand_AccuracyUp2:
	ld b, $10 | ACCURACY
	jr BattleCommand_StatUp

BattleCommand_EvasionUp2:
	ld b, $10 | EVASION
	jr BattleCommand_StatUp

BattleCommand_StatUp:
	call RaiseStat
	ld a, [wFailedMessage]
	and a
	ret nz
	jp MinimizeDropSub

RaiseStat:
	ld a, b
	ld [wLoweredStat], a
	ld hl, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .got_stat_levels
	ld hl, wEnemyStatLevels
.got_stat_levels
	ld a, [wAttackMissed]
	and a
	jp nz, .stat_raise_failed
	ld a, [wEffectFailed]
	and a
	jp nz, .stat_raise_failed
	ld a, [wLoweredStat]
	and $f
	ld c, a
	ld b, 0
	add hl, bc
	ld b, [hl]
	inc b
	ld a, MAX_STAT_LEVEL
	cp b
	jp c, .cant_raise_stat
	ld a, [wLoweredStat]
	and $f0
	jr z, .got_num_stages
	inc b
	ld a, MAX_STAT_LEVEL
	cp b
	jr nc, .got_num_stages
	ld b, a
.got_num_stages
	ld [hl], b
	push hl
	ld a, c
	cp ACCURACY
	jr nc, .done_calcing_stats
	ld hl, wBattleMonStats + 1
	ld de, wPlayerStats
	ldh a, [hBattleTurn]
	and a
	jr z, .got_stats_pointer
	ld hl, wEnemyMonStats + 1
	ld de, wEnemyStats
.got_stats_pointer
	push bc
	sla c
	ld b, 0
	add hl, bc
	ld a, c
	add e
	ld e, a
	jr nc, .no_carry
	inc d
.no_carry
	pop bc
	ld a, [hld]
	sub LOW(MAX_STAT_VALUE)
	jr nz, .not_already_max
	ld a, [hl]
	sbc HIGH(MAX_STAT_VALUE)
	jp z, .stats_already_max
.not_already_max
	ldh a, [hBattleTurn]
	and a
	jr z, .calc_player_stats
	call CalcEnemyStats
	jr .done_calcing_stats

.calc_player_stats
	call CalcPlayerStats
.done_calcing_stats
	pop hl
	xor a
	ld [wFailedMessage], a
	ret

.stats_already_max
	pop hl
	dec [hl]
	; fallthrough

.cant_raise_stat
	ld a, $2
	ld [wFailedMessage], a
	ld a, $1
	ld [wAttackMissed], a
	ret

.stat_raise_failed
	ld a, $1
	ld [wFailedMessage], a
	ret

MinimizeDropSub:
; Lower the substitute if we're minimizing

	ld de, wPlayerMinimized
	ld hl, DropPlayerSub
	ldh a, [hBattleTurn]
	and a
	jr z, .do_player
	ld de, wEnemyMinimized
	ld hl, DropEnemySub
.do_player
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld bc, MINIMIZE
	call CompareMove
	ret nz

	ld a, $1
	ld [de], a
	call _CheckBattleScene
	ret nc

	xor a
	ldh [hBGMapMode], a
	call CallBattleCore
	call WaitBGMap
	jp BattleCommand_MoveDelay

BattleCommand_AttackDown:
	ld a, ATTACK
	jr BattleCommand_StatDown

BattleCommand_DefenseDown:
	ld a, DEFENSE
	jr BattleCommand_StatDown

BattleCommand_SpeedDown:
	ld a, SPEED
	jr BattleCommand_StatDown

BattleCommand_SpecialAttackDown:
	ld a, SP_ATTACK
	jr BattleCommand_StatDown

BattleCommand_SpecialDefenseDown:
	ld a, SP_DEFENSE
	jr BattleCommand_StatDown

BattleCommand_AccuracyDown:
	ld a, ACCURACY
	jr BattleCommand_StatDown

BattleCommand_EvasionDown:
	ld a, EVASION
	jr BattleCommand_StatDown

BattleCommand_AttackDown2:
	ld a, $10 | ATTACK
	jr BattleCommand_StatDown

BattleCommand_DefenseDown2:
	ld a, $10 | DEFENSE
	jr BattleCommand_StatDown

BattleCommand_SpeedDown2:
	ld a, $10 | SPEED
	jr BattleCommand_StatDown

BattleCommand_SpecialAttackDown2:
	ld a, $10 | SP_ATTACK
	jr BattleCommand_StatDown

BattleCommand_SpecialDefenseDown2:
	ld a, $10 | SP_DEFENSE
	jr BattleCommand_StatDown

BattleCommand_AccuracyDown2:
	ld a, $10 | ACCURACY
	jr BattleCommand_StatDown

BattleCommand_EvasionDown2:
	ld a, $10 | EVASION

BattleCommand_StatDown:
	ld [wLoweredStat], a

	call CheckMist
	jp nz, .Mist

	ld hl, wEnemyStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .GetStatLevel
	ld hl, wPlayerStatLevels

.GetStatLevel:
; Attempt to lower the stat.
	ld a, [wLoweredStat]
	and $f
	ld c, a
	ld b, 0
	add hl, bc
	ld b, [hl]
	dec b
	jp z, .CantLower

; Sharply lower the stat if applicable.
	ld a, [wLoweredStat]
	and $f0
	jr z, .ComputerMiss
	dec b
	jr nz, .ComputerMiss
	inc b

.ComputerMiss:
; Computer opponents have a 25% chance of failing.
	ldh a, [hBattleTurn]
	and a
	jr z, .DidntMiss

	ld a, [wLinkMode]
	and a
	jr nz, .DidntMiss

	ld a, [wInBattleTowerBattle]
	and a
	jr nz, .DidntMiss

; Lock-On still always works.
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	jr nz, .DidntMiss

; Attacking moves that also lower accuracy are unaffected.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_ACCURACY_DOWN_HIT
	jr z, .DidntMiss

	call BattleRandom
	cp 25 percent + 1 ; 25% chance AI fails
	jr c, .Failed

.DidntMiss:
	call CheckSubstituteOpp
	jr nz, .Failed

	ld a, [wAttackMissed]
	and a
	jr nz, .Failed

	ld a, [wEffectFailed]
	and a
	jr nz, .Failed

	call CheckHiddenOpponent
	jr nz, .Failed

; Accuracy/Evasion reduction don't involve stats.
	ld [hl], b
	ld a, c
	cp ACCURACY
	jr nc, .Hit

	push hl
	ld hl, wEnemyMonAttack + 1
	ld de, wEnemyStats
	ldh a, [hBattleTurn]
	and a
	jr z, .do_enemy
	ld hl, wBattleMonAttack + 1
	ld de, wPlayerStats
.do_enemy
	call TryLowerStat
	pop hl
	jr z, .CouldntLower

.Hit:
	xor a
	ld [wFailedMessage], a
	ret

.CouldntLower:
	inc [hl]
.CantLower:
	ld a, 3
	ld [wFailedMessage], a
	ld a, 1
	ld [wAttackMissed], a
	ret

.Failed:
	ld a, 1
	ld [wFailedMessage], a
	ld [wAttackMissed], a
	ret

.Mist:
	ld a, 2
	ld [wFailedMessage], a
	ld a, 1
	ld [wAttackMissed], a
	ret

CheckMist:
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_ATTACK_DOWN
	jr c, .dont_check_mist
	cp EFFECT_EVASION_DOWN + 1
	jr c, .check_mist
	cp EFFECT_ATTACK_DOWN_2
	jr c, .dont_check_mist
	cp EFFECT_EVASION_DOWN_2 + 1
	jr c, .check_mist
	cp EFFECT_ATTACK_DOWN_HIT
	jr c, .dont_check_mist
	cp EFFECT_EVASION_DOWN_HIT + 1
	jr c, .check_mist
.dont_check_mist
	xor a
	ret

.check_mist
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_MIST, a
	ret

BattleCommand_StatUpMessage:
	ld a, [wFailedMessage]
	and a
	ret nz
	ld a, [wLoweredStat]
	and $f
	ld b, a
	inc b
	call GetStatName
	ld hl, .stat
	jp BattleTextbox

.stat
	text_far Text_BattleEffectActivate
	text_asm
	ld hl, .BattleStatWentUpText
	ld a, [wLoweredStat]
	and $f0
	ret z
	ld hl, .BattleStatWentWayUpText
	ret

.BattleStatWentWayUpText:
	text_far _BattleStatWentWayUpText
	text_end

.BattleStatWentUpText:
	text_far _BattleStatWentUpText
	text_end

BattleCommand_StatDownMessage:
	ld a, [wFailedMessage]
	and a
	ret nz
	ld a, [wLoweredStat]
	and $f
	ld b, a
	inc b
	call GetStatName
	ld hl, .stat
	jp BattleTextbox

.stat
	text_far Text_BattleFoeEffectActivate
	text_asm
	ld hl, .BattleStatFellText
	ld a, [wLoweredStat]
	and $f0
	ret z
	ld hl, .BattleStatSharplyFellText
	ret

.BattleStatSharplyFellText:
	text_far _BattleStatSharplyFellText
	text_end

.BattleStatFellText:
	text_far _BattleStatFellText
	text_end

TryLowerStat:
; Lower stat c from stat struct hl (buffer de).

	push bc
	sla c
	ld b, 0
	add hl, bc
	; add de, c
	ld a, c
	add e
	ld e, a
	jr nc, .no_carry
	inc d
.no_carry
	pop bc

; The lowest possible stat is 1.
	ld a, [hld]
	sub 1
	jr nz, .not_min
	ld a, [hl]
	and a
	ret z

.not_min
	ldh a, [hBattleTurn]
	and a
	jr z, .Player

	call BattleCommand_SwitchTurn
	call CalcPlayerStats
	call BattleCommand_SwitchTurn
	jr .end

.Player:
	call BattleCommand_SwitchTurn
	call CalcEnemyStats
	call BattleCommand_SwitchTurn
.end
	ld a, 1
	and a
	ret

BattleCommand_StatUpFailText:
	ld a, [wFailedMessage]
	and a
	ret z
	push af
	call BattleCommand_MoveDelay
	pop af
	dec a
	jp z, TryPrintButItFailed
	ld a, [wLoweredStat]
	and $f
	ld b, a
	inc b
	call GetStatName
	ld hl, WontRiseAnymoreText
	jp StdBattleTextbox

BattleCommand_StatDownFailText:
	ld a, [wFailedMessage]
	and a
	ret z
	push af
	call BattleCommand_MoveDelay
	pop af
	dec a
	jp z, TryPrintButItFailed
	dec a
	ld hl, ProtectedByMistText
	jp z, StdBattleTextbox
	ld a, [wLoweredStat]
	and $f
	ld b, a
	inc b
	call GetStatName
	ld hl, WontDropAnymoreText
	jp StdBattleTextbox

GetStatName:
	ld hl, StatNames
	ld c, CHARVAL("@")
.CheckName:
	dec b
	jr z, .Copy
.GetName:
	ld a, [hli]
	cp c
	jr z, .CheckName
	jr .GetName

.Copy:
	ld de, wStringBuffer2
	ld bc, STRING_BUFFER_LENGTH
	jp CopyBytes

INCLUDE "data/battle/stat_names.asm"

INCLUDE "data/battle/stat_multipliers.asm"

BattleCommand_AllStatsUp:
; Attack
	call ResetMiss
	call BattleCommand_AttackUp
	call BattleCommand_StatUpMessage

; Defense
	call ResetMiss
	call BattleCommand_DefenseUp
	call BattleCommand_StatUpMessage

; Speed
	call ResetMiss
	call BattleCommand_SpeedUp
	call BattleCommand_StatUpMessage

; Special Attack
	call ResetMiss
	call BattleCommand_SpecialAttackUp
	call BattleCommand_StatUpMessage

; Special Defense
	call ResetMiss
	call BattleCommand_SpecialDefenseUp
	jp   BattleCommand_StatUpMessage

ResetMiss:
	xor a
	ld [wAttackMissed], a
	ret

LowerStat:
	ld [wLoweredStat], a

	ld hl, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .got_target
	ld hl, wEnemyStatLevels

.got_target
	ld a, [wLoweredStat]
	and $f
	ld c, a
	ld b, 0
	add hl, bc
	ld b, [hl]
	dec b
	jr z, .cant_lower_anymore

	ld a, [wLoweredStat]
	and $f0
	jr z, .got_num_stages
	dec b
	jr nz, .got_num_stages
	inc b

.got_num_stages
	ld [hl], b
	ld a, c
	cp ACCURACY
	jr nc, .accuracy_evasion

	push hl
	ld hl, wBattleMonStats + 1
	ld de, wPlayerStats
	ldh a, [hBattleTurn]
	and a
	jr z, .got_target_2
	ld hl, wEnemyMonStats + 1
	ld de, wEnemyStats

.got_target_2
	call TryLowerStat
	pop hl
	jr z, .failed

.accuracy_evasion
	ldh a, [hBattleTurn]
	and a
	jr z, .player

	call CalcEnemyStats

	jr .finish

.player
	call CalcPlayerStats

.finish
	xor a
	ld [wFailedMessage], a
	ret

.failed
	inc [hl]

.cant_lower_anymore
	ld a, 2
	ld [wFailedMessage], a
	ret

BattleCommand_TriStatusChance:
	call BattleCommand_EffectChance
.loop
	; 1/3 chance of each status
	call BattleRandom
	swap a
	and %11
	jr z, .loop
	dec a
	ld hl, .StatusCommands
	rst JumpTable
	ret

.StatusCommands:
	dw BattleCommand_ParalyzeTarget ; paralyze
	dw BattleCommand_FreezeTarget ; freeze
	dw BattleCommand_BurnTarget ; burn

BattleCommand_Curl:
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVarAddr
	set SUBSTATUS_CURLED, [hl]
	ret

BattleCommand_RaiseSubNoAnim:
	ld hl, GetBattleMonBackpic
	ldh a, [hBattleTurn]
	and a
	jr z, .PlayerTurn
	ld hl, GetEnemyMonFrontpic
.PlayerTurn:
	xor a
	ldh [hBGMapMode], a
	call CallBattleCore
	jp WaitBGMap

BattleCommand_LowerSubNoAnim:
	ld hl, DropPlayerSub
	ldh a, [hBattleTurn]
	and a
	jr z, .PlayerTurn
	ld hl, DropEnemySub
.PlayerTurn:
	xor a
	ldh [hBGMapMode], a
	call CallBattleCore
	jp WaitBGMap

CalcPlayerStats:
	ld hl, wPlayerAtkLevel
	ld de, wPlayerStats
	ld bc, wBattleMonAttack

	ld a, NUM_BATTLE_STATS
	call CalcBattleStats

	ld hl, BadgeStatBoosts
	call CallBattleCore

	call BattleCommand_SwitchTurn

	ld hl, ApplyPrzEffectOnSpeed
	call CallBattleCore

	ld hl, ApplyBrnEffectOnAttack
	call CallBattleCore

	jp BattleCommand_SwitchTurn

CalcEnemyStats:
	ld hl, wEnemyAtkLevel
	ld de, wEnemyStats
	ld bc, wEnemyMonAttack

	ld a, NUM_BATTLE_STATS
	call CalcBattleStats

	call BattleCommand_SwitchTurn

	ld hl, ApplyPrzEffectOnSpeed
	call CallBattleCore

	ld hl, ApplyBrnEffectOnAttack
	call CallBattleCore

	jp BattleCommand_SwitchTurn

CalcBattleStats:
.loop
	push af
	ld a, [hli]
	push hl
	push bc

	ld c, a
	dec c
	ld b, 0
	ld hl, StatLevelMultipliers
	add hl, bc
	add hl, bc

	xor a
	ldh [hMultiplicand + 0], a
	ld a, [de]
	ldh [hMultiplicand + 1], a
	inc de
	ld a, [de]
	ldh [hMultiplicand + 2], a
	inc de

	ld a, [hli]
	ldh [hMultiplier], a
	call Multiply

	ld a, [hl]
	ldh [hDivisor], a
	ld b, 4
	call Divide

	ldh a, [hQuotient + 2]
	ld b, a
	ldh a, [hQuotient + 3]
	or b
	jr nz, .check_maxed_out

	ld a, 1
	ldh [hQuotient + 3], a
	jr .not_maxed_out

.check_maxed_out
	ldh a, [hQuotient + 3]
	cp LOW(MAX_STAT_VALUE)
	ld a, b
	sbc HIGH(MAX_STAT_VALUE)
	jr c, .not_maxed_out

	ld a, LOW(MAX_STAT_VALUE)
	ldh [hQuotient + 3], a
	ld a, HIGH(MAX_STAT_VALUE)
	ldh [hQuotient + 2], a

.not_maxed_out
	pop bc
	ldh a, [hQuotient + 2]
	ld [bc], a
	inc bc
	ldh a, [hQuotient + 3]
	ld [bc], a
	inc bc
	pop hl
	pop af
	dec a
	jr nz, .loop

	ret

INCLUDE "engine/battle/move_effects/bide.asm"

BattleCommand_CheckRampage:
	ld de, wPlayerRolloutCount
	ldh a, [hBattleTurn]
	and a
	jr z, .player
	ld de, wEnemyRolloutCount
.player
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	bit SUBSTATUS_RAMPAGE, [hl]
	ret z
	ld a, [de]
	dec a
	ld [de], a
	jr nz, .continue_rampage

	res SUBSTATUS_RAMPAGE, [hl]
	call BattleCommand_SwitchTurn
	call SafeCheckSafeguard
	push af
	call BattleCommand_SwitchTurn
	pop af
	jr nz, .continue_rampage

	set SUBSTATUS_CONFUSED, [hl]
	call BattleRandom
	and %00000001
	inc a
	inc a
	inc de ; ConfuseCount
	ld [de], a
.continue_rampage
	ld b, rampage_command
	jp SkipToBattleCommand

BattleCommand_Rampage:
; No rampage during Sleep Talk.
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP_MASK
	ret nz

	ld de, wPlayerRolloutCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wEnemyRolloutCount
.ok
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	set SUBSTATUS_RAMPAGE, [hl]
; Rampage for 1 or 2 more turns
	call BattleRandom
	and %00000001
	inc a
	ld [de], a
	ld a, 1
	ld [wSomeoneIsRampaging], a
	ret

INCLUDE "engine/battle/move_effects/teleport.asm"

SetBattleDraw:
	ld a, [wBattleResult]
	and BATTLERESULT_BITMASK
	or DRAW
	ld [wBattleResult], a
	ret

BattleCommand_ForceSwitch:
	ld a, [wBattleType]
	cp BATTLETYPE_FORCESHINY
	jp z, .fail
	cp BATTLETYPE_TRAP
	jp z, .fail
	cp BATTLETYPE_CELEBI
	jp z, .fail
	cp BATTLETYPE_SUICUNE
	jp z, .fail
	ldh a, [hBattleTurn]
	and a
	jp nz, .force_player_switch
	ld a, [wAttackMissed]
	and a
	jr nz, .missed
	ld a, [wBattleMode]
	dec a
	jr nz, .trainer
	ld a, [wCurPartyLevel]
	ld b, a
	ld a, [wBattleMonLevel]
	cp b
	jr nc, .wild_force_flee
	add b
	ld c, a
	inc c
.random_loop_wild
	call BattleRandom
	cp c
	jr nc, .random_loop_wild
	srl b
	srl b
	cp b
	jr nc, .wild_force_flee
.missed
	jp .fail

.wild_force_flee
	call UpdateBattleMonInParty
	xor a
	ld [wNumHits], a
	inc a ; TRUE
	ld [wForcedSwitch], a
	call SetBattleDraw
	ld a, [wPlayerMoveStructAnimation]
	jp .succeed

.trainer
	call FindAliveEnemyMons
	jr c, .switch_fail
	ld a, [wEnemyGoesFirst]
	and a
	jr z, .switch_fail
	call UpdateEnemyMonInParty
	ld a, $1
	ld [wBattleAnimParam], a
	call AnimateCurrentMove
	ld c, $14
	call DelayFrames
	hlcoord 1, 0
	lb bc, 4, 10
	call ClearBox
	ld c, 20
	call DelayFrames
	ld a, [wOTPartyCount]
	ld b, a
	ld a, [wCurOTMon]
	ld c, a
; select a random enemy mon to switch to
.random_loop_trainer
	call BattleRandom
	and $7
	cp b
	jr nc, .random_loop_trainer
	cp c
	jr z, .random_loop_trainer
	push af
	push bc
	ld hl, wOTPartyMon1HP
	call GetPartyLocation
	ld a, [hli]
	or [hl]
	pop bc
	pop de
	jr z, .random_loop_trainer
	ld a, d
	inc a
	ld [wEnemySwitchMonIndex], a
	callfar ForceEnemySwitch

	ld hl, DraggedOutText
	call StdBattleTextbox

	ld hl, SpikesDamage
	jp CallBattleCore

.switch_fail
	jp .fail

.force_player_switch
	ld a, [wAttackMissed]
	and a
	jr nz, .player_miss

	ld a, [wBattleMode]
	dec a
	jr nz, .vs_trainer

	ld a, [wBattleMonLevel]
	ld b, a
	ld a, [wCurPartyLevel]
	cp b
	jr nc, .wild_succeed_playeristarget

	add b
	ld c, a
	inc c
.wild_random_loop_playeristarget
	call BattleRandom
	cp c
	jr nc, .wild_random_loop_playeristarget

	srl b
	srl b
	cp b
	jr nc, .wild_succeed_playeristarget

.player_miss
	jr .fail

.wild_succeed_playeristarget
	call UpdateBattleMonInParty
	xor a
	ld [wNumHits], a
	inc a ; TRUE
	ld [wForcedSwitch], a
	call SetBattleDraw
	ld a, [wEnemyMoveStructAnimation]
	jr .succeed

.vs_trainer
	call CheckPlayerHasMonToSwitchTo
	jr c, .fail

	ld a, [wEnemyGoesFirst]
	cp $1
	jr z, .switch_fail

	call UpdateBattleMonInParty
	ld a, $1
	ld [wBattleAnimParam], a
	call AnimateCurrentMove
	ld c, 20
	call DelayFrames
	hlcoord 9, 7
	lb bc, 5, 11
	call ClearBox
	ld c, 20
	call DelayFrames
	ld a, [wPartyCount]
	ld b, a
	ld a, [wCurBattleMon]
	ld c, a
.random_loop_trainer_playeristarget
	call BattleRandom
	and $7
	cp b
	jr nc, .random_loop_trainer_playeristarget

	cp c
	jr z, .random_loop_trainer_playeristarget

	push af
	push bc
	ld hl, wPartyMon1HP
	call GetPartyLocation
	ld a, [hli]
	or [hl]
	pop bc
	pop de
	jr z, .random_loop_trainer_playeristarget

	ld a, d
	ld [wCurPartyMon], a
	ld hl, SwitchPlayerMon
	call CallBattleCore

	ld hl, DraggedOutText
	call StdBattleTextbox

	ld hl, SpikesDamage
	jp CallBattleCore

.fail
	call BattleCommand_LowerSub
	call BattleCommand_MoveDelay
	call BattleCommand_RaiseSub
	jp PrintButItFailed

.succeed
	push af
	call SetBattleDraw
	ld a, $1
	ld [wBattleAnimParam], a
	call AnimateCurrentMove
	ld c, 20
	call DelayFrames
	pop af

	ld hl, FledInFearText
	ld bc, ROAR
	call CompareMove
	jr z, .do_text
	ld hl, BlownAwayText
.do_text
	jp StdBattleTextbox

CheckPlayerHasMonToSwitchTo:
	ld a, [wPartyCount]
	ld d, a
	ld e, 0
	ld bc, PARTYMON_STRUCT_LENGTH
.loop
	ld a, [wCurBattleMon]
	cp e
	jr z, .next

	ld a, e
	ld hl, wPartyMon1HP
	call AddNTimes
	ld a, [hli]
	or [hl]
	jr nz, .not_fainted

.next
	inc e
	dec d
	jr nz, .loop

	scf
	ret

.not_fainted
	and a
	ret

BattleCommand_EndLoop:
; Loop back to 'critical'.

	ld de, wPlayerRolloutCount
	ld bc, wPlayerDamageTaken
	ldh a, [hBattleTurn]
	and a
	jr z, .got_addrs
	ld de, wEnemyRolloutCount
	ld bc, wEnemyDamageTaken
.got_addrs

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	bit SUBSTATUS_IN_LOOP, [hl]
	jp nz, .in_loop
	set SUBSTATUS_IN_LOOP, [hl]
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVarAddr
	ld a, [hl]
	cp EFFECT_POISON_MULTI_HIT
	jr z, .twineedle
	cp EFFECT_DOUBLE_HIT
	ld a, 1
	jr z, .double_hit
	ld a, [hl]
	cp EFFECT_BEAT_UP
	jr z, .beat_up
	cp EFFECT_TRIPLE_KICK
	jr nz, .not_triple_kick
.reject_triple_kick_sample
	call BattleRandom
	and $3
	jr z, .reject_triple_kick_sample
	dec a
	jr nz, .double_hit
	ld a, 1
	ld [bc], a
	jr .done_loop

.beat_up
	ldh a, [hBattleTurn]
	and a
	jr nz, .check_ot_beat_up
	ld a, [wPartyCount]
	cp 1
	jp z, .only_one_beatup
	dec a
	jr .double_hit

.check_ot_beat_up
	ld a, [wBattleMode]
	cp WILD_BATTLE
	jp z, .only_one_beatup
	ld a, [wOTPartyCount]
	cp 1
	jp z, .only_one_beatup
	dec a
	jr .double_hit

.only_one_beatup
; BUG: Beat Up works incorrectly with only one Pokémon in the party (see docs/bugs_and_glitches.md)
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_IN_LOOP, [hl]
	call BattleCommand_BeatUpFailText
	jp EndMoveEffect

.not_triple_kick
	call BattleRandom
	and $3
	cp 2
	jr c, .got_number_hits
	call BattleRandom
	and $3
.got_number_hits
	inc a
.double_hit
	ld [de], a
	inc a
	ld [bc], a
	jr .loop_back_to_critical

.twineedle
	ld a, 1
	jr .double_hit

.in_loop
	ld a, [de]
	dec a
	ld [de], a
	jr nz, .loop_back_to_critical
.done_loop
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_IN_LOOP, [hl]

	ld hl, PlayerHitTimesText
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hit_n_times_text
	ld hl, EnemyHitTimesText
.got_hit_n_times_text

	push bc
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_BEAT_UP
	jr z, .beat_up_2
	call StdBattleTextbox
.beat_up_2

	pop bc
	xor a
	ld [bc], a
	ret

.loop_back_to_critical
	ld a, [wBattleScriptBufferAddress + 1]
	ld h, a
	ld a, [wBattleScriptBufferAddress]
	ld l, a
.not_critical
	ld a, [hld]
	cp critical_command
	jr nz, .not_critical
	inc hl
	ld a, h
	ld [wBattleScriptBufferAddress + 1], a
	ld a, l
	ld [wBattleScriptBufferAddress], a
	ret

BattleCommand_FakeOut:
	ld a, [wAttackMissed]
	and a
	ret nz

	call CheckSubstituteOpp
	jr nz, .fail

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and 1 << FRZ | SLP_MASK
	jr nz, .fail

	call CheckOpponentWentFirst
	jr z, FlinchTarget

.fail
	ld a, 1
	ld [wAttackMissed], a
	ret

BattleCommand_FlinchTarget:
	call CheckSubstituteOpp
	ret nz

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and 1 << FRZ | SLP_MASK
	ret nz

	call CheckOpponentWentFirst
	ret nz

	ld a, [wEffectFailed]
	and a
	ret nz

	; fallthrough

FlinchTarget:
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarAddr
	set SUBSTATUS_FLINCHED, [hl]
	jp EndRechargeOpp

CheckOpponentWentFirst:
; Returns a=0, z if user went first
; Returns a=1, nz if opponent went first
	push bc
	ld a, [wEnemyGoesFirst] ; 0 if player went first
	ld b, a
	ldh a, [hBattleTurn] ; 0 if it's the player's turn
	xor b ; 1 if opponent went first
	pop bc
	ret

BattleCommand_HeldFlinch:
; kingsrock

	ld a, [wAttackMissed]
	and a
	ret nz

	call GetUserItem
	ld a, b
	cp HELD_FLINCH
	ret nz

	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVarAddr
	ld d, h
	ld e, l
	call GetUserItem
	call BattleRandom
	cp c
	ret nc
	call EndRechargeOpp
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarAddr
	set SUBSTATUS_FLINCHED, [hl]
	ret

BattleCommand_OHKO:
	call ResetDamage
	ld a, [wTypeModifier]
	and $7f
	jr z, .no_effect
	ld hl, wEnemyMonLevel
	ld de, wBattleMonLevel
	ld bc, wPlayerMoveStruct + MOVE_ACC
	ldh a, [hBattleTurn]
	and a
	jr z, .got_move_accuracy
	push hl
	ld h, d
	ld l, e
	pop de
	ld bc, wEnemyMoveStruct + MOVE_ACC
.got_move_accuracy
	ld a, [de]
	sub [hl]
	jr c, .no_effect
	add a
	ld e, a
	ld a, [bc]
	add e
	jr nc, .finish_ohko
	ld a, $ff
.finish_ohko
	ld [bc], a
	call BattleCommand_CheckHit
	ld hl, wCurDamage
	ld a, $ff
	ld [hli], a
	ld [hl], a
	ld a, $2
	ld [wCriticalHit], a
	ret

.no_effect
	ld a, $ff
	ld [wCriticalHit], a
	ld a, $1
	ld [wAttackMissed], a
	ret

BattleCommand_CheckCharge:
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	bit SUBSTATUS_CHARGED, [hl]
	ret z
	res SUBSTATUS_CHARGED, [hl]
	res SUBSTATUS_UNDERGROUND, [hl]
	res SUBSTATUS_FLYING, [hl]
	ld b, charge_command
	jp SkipToBattleCommand

BattleCommand_Charge:
	call BattleCommand_ClearText
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP_MASK
	jr z, .awake

	call BattleCommand_MoveDelay
	call BattleCommand_RaiseSub
	call PrintButItFailed
	jp EndMoveEffect

.awake
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	set SUBSTATUS_CHARGED, [hl]

	ld hl, IgnoredOrders2Text
	ld a, [wAlreadyDisobeyed]
	and a
	call nz, StdBattleTextbox

	call BattleCommand_LowerSub
	xor a
	ld [wNumHits], a
	inc a
	ld [wBattleAnimParam], a
	call LoadMoveAnim
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld h, a
	ld bc, FLY
	call CompareMove
	ld a, 1 << SUBSTATUS_FLYING
	jr z, .got_move_type
	if HIGH(FLY) != HIGH(DIG)
		ld bc, DIG
	else
		ld c, LOW(DIG)
	endc
	ld a, h
	call CompareMove
	ld a, 1 << SUBSTATUS_UNDERGROUND
	jr z, .got_move_type
	call BattleCommand_RaiseSub
	xor a

.got_move_type
	; a will contain the substatus 3 bit to set (1 << bit), or 0 if none (not flying/digging underground)
	and a
	ld l, a
	push hl
	call nz, DisappearUser
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	pop bc
	ld a, c
	or [hl]
	ld [hl], a
	call CheckUserIsCharging
	jr nz, .mimic
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE
	call GetBattleVarAddr
	ld [hl], b
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	ld [hl], b

.mimic
	call ResetDamage

	ld hl, .UsedText
	call BattleTextbox

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_SKULL_BASH
	ld b, endturn_command
	jp z, SkipToBattleCommand
	jp EndMoveEffect

.UsedText:
	text_far Text_BattleUser ; "<USER>"
	text_asm
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	push bc
	call GetMoveIndexFromID
	ld b, h
	ld c, l
	ld de, 4
	ld hl, .move_messages
	call IsInWordArray ; hl will point to the low byte of the found item
	jr c, .found_text
	ld hl, .move_messages
.found_text
	inc hl
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop bc
	ret

.move_messages
	dw RAZOR_WIND, .BattleMadeWhirlwindText
	dw SOLARBEAM,  .BattleTookSunlightText
	dw SKULL_BASH, .BattleLoweredHeadText
	dw SKY_ATTACK, .BattleGlowingText
	dw FLY,        .BattleFlewText
	dw DIG,        .BattleDugText
	dw -1

.BattleMadeWhirlwindText:
	text_far _BattleMadeWhirlwindText
	text_end

.BattleTookSunlightText:
	text_far _BattleTookSunlightText
	text_end

.BattleLoweredHeadText:
	text_far _BattleLoweredHeadText
	text_end

.BattleGlowingText:
	text_far _BattleGlowingText
	text_end

.BattleFlewText:
	text_far _BattleFlewText
	text_end

.BattleDugText:
	text_far _BattleDugText
	text_end

BattleCommand_Unused3C:
; effect0x3c
	ret

BattleCommand_TrapTarget:
	ld a, [wAttackMissed]
	and a
	ret nz
	ld hl, wEnemyWrapCount
	ld de, wEnemyTrappingMove
	ldh a, [hBattleTurn]
	and a
	jr z, .got_trap
	ld hl, wPlayerWrapCount
	ld de, wPlayerTrappingMove

.got_trap
	ld a, [hl]
	and a
	ret nz
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret nz
	call BattleRandom
	; trapped for 2-5 turns
	and %11
	inc a
	inc a
	inc a
	ld [hl], a
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld [de], a
	call GetMoveIndexFromID
	ld b, h
	ld c, l
	ld hl, .Traps

.find_trap_text
	ld a, [hli]
	cp c
	ld a, [hli]
	jr nz, .next_trap_text
	cp b
	jr z, .found_trap_text
.next_trap_text
	inc hl
	inc hl
	jr .find_trap_text

.found_trap_text
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp StdBattleTextbox

.Traps:
	dw BIND,      UsedBindText      ; 'used BIND on'
	dw WRAP,      WrappedByText     ; 'was WRAPPED by'
	dw FIRE_SPIN, FireSpinTrapText  ; 'was trapped!'
	dw CLAMP,     ClampedByText     ; 'was CLAMPED by'
	dw WHIRLPOOL, WhirlpoolTrapText ; 'was trapped!'

INCLUDE "engine/battle/move_effects/mist.asm"

INCLUDE "engine/battle/move_effects/focus_energy.asm"

BattleCommand_CheckPowder:
; Checks if the move is powder/spore-based and 
; if the opponent is Grass-type
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld hl, PowderMoves
	call IsInByteArray
	ret nc

; If the opponent is Grass-type, the move fails.
	ld hl, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .CheckGrassType
	ld hl, wBattleMonType1

.CheckGrassType:
	ld a, [hli]
	cp GRASS
	jr z, .Immune
	ld a, [hl]
	cp GRASS
	ret nz
	;fallthrough
.Immune:
	ld a, 1
	ld [wAttackMissed], a
	ret

BattleCommand_Recoil:
	ld hl, wBattleMonMaxHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wEnemyMonMaxHP
.got_hp
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld d, a
; get 1/4 damage or 1 HP, whichever is higher
	ld a, [wCurDamage]
	ld b, a
	ld a, [wCurDamage + 1]
	ld c, a
	srl b
	rr c
	srl b
	rr c
	ld a, b
	or c
	jr nz, .min_damage
	inc c
.min_damage
	ld a, [hli]
	ld [wHPBuffer1 + 1], a
	ld a, [hl]
	ld [wHPBuffer1], a
	dec hl
	dec hl
	ld a, [hl]
	ld [wHPBuffer2], a
	sub c
	ld [hld], a
	ld [wHPBuffer3], a
	ld a, [hl]
	ld [wHPBuffer2 + 1], a
	sbc b
	ld [hl], a
	ld [wHPBuffer3 + 1], a
	jr nc, .dont_ko
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, wHPBuffer3
	ld [hli], a
	ld [hl], a
.dont_ko
	hlcoord 10, 9
	ldh a, [hBattleTurn]
	and a
	ld a, 1
	jr z, .animate_hp_bar
	hlcoord 2, 2
	xor a
.animate_hp_bar
	ld [wWhichHPBar], a
	predef AnimateHPBar
	call RefreshBattleHuds
	ld hl, RecoilText
	jp StdBattleTextbox

BattleCommand_ConfuseTarget:
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_CONFUSE
	ret z
	ld a, [wEffectFailed]
	and a
	ret nz
	call SafeCheckSafeguard
	ret nz
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_CONFUSED, [hl]
	ret nz
	jr BattleCommand_FinishConfusingTarget

BattleCommand_Confuse:
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_CONFUSE
	jr nz, .no_item_protection
	ld a, [hl]
	ld [wNamedObjectIndex], a
	call GetItemName
	call AnimateFailedMove
	ld hl, ProtectedByText
	jp StdBattleTextbox

.no_item_protection
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_CONFUSED, [hl]
	jr z, .not_already_confused
	call AnimateFailedMove
	ld hl, AlreadyConfusedText
	jp StdBattleTextbox

.not_already_confused
	call CheckSubstituteOpp
	jr nz, BattleCommand_Confuse_CheckSnore_Swagger_ConfuseHit
	ld a, [wAttackMissed]
	and a
	jr nz, BattleCommand_Confuse_CheckSnore_Swagger_ConfuseHit
BattleCommand_FinishConfusingTarget:
	ld bc, wEnemyConfuseCount
	ldh a, [hBattleTurn]
	and a
	jr z, .got_confuse_count
	ld bc, wPlayerConfuseCount

.got_confuse_count
	set SUBSTATUS_CONFUSED, [hl]
	; confused for 2-5 turns
	call BattleRandom
	and %11
	inc a
	inc a
	ld [bc], a

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_CONFUSE_HIT
	jr z, .got_effect
	cp EFFECT_SNORE
	jr z, .got_effect
	cp EFFECT_SWAGGER
	jr z, .got_effect
	call AnimateCurrentMove

.got_effect
	ld de, ANIM_CONFUSED
	call PlayOpponentBattleAnim

	ld hl, BecameConfusedText
	call StdBattleTextbox

	call GetOpponentItem
	ld a, b
	cp HELD_HEAL_STATUS
	jr z, .heal_confusion
	cp HELD_HEAL_CONFUSION
	ret nz
.heal_confusion
	ld hl, UseConfusionHealingItem
	jp CallBattleCore

BattleCommand_Confuse_CheckSnore_Swagger_ConfuseHit:
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_CONFUSE_HIT
	ret z
	cp EFFECT_SNORE
	ret z
	cp EFFECT_SWAGGER
	ret z
	jp PrintDidntAffect2

BattleCommand_Paralyze:
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	bit PAR, a
	jr nz, .paralyzed
	ld a, [wTypeModifier]
	and $7f
	jr z, .didnt_affect
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_PARALYZE
	jr nz, .no_item_protection
	ld a, [hl]
	ld [wNamedObjectIndex], a
	call GetItemName
	call AnimateFailedMove
	ld hl, ProtectedByText
	jp StdBattleTextbox

.no_item_protection
	ldh a, [hBattleTurn]
	and a
	jr z, .dont_sample_failure

	ld a, [wLinkMode]
	and a
	jr nz, .dont_sample_failure

	ld a, [wInBattleTowerBattle]
	and a
	jr nz, .dont_sample_failure

	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	jr nz, .dont_sample_failure

	call BattleRandom
	cp 25 percent + 1 ; 25% chance AI fails
	jr c, .failed

.dont_sample_failure
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	jr nz, .failed
	ld a, [wAttackMissed]
	and a
	jr nz, .failed
	call CheckSubstituteOpp
	jr nz, .failed
	ld c, 30
	call DelayFrames
	call AnimateCurrentMove
	ld a, $1
	ldh [hBGMapMode], a
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set PAR, [hl]
	call UpdateOpponentInParty
	ld hl, ApplyPrzEffectOnSpeed
	call CallBattleCore
	call UpdateBattleHuds
	call PrintParalyze
	ld hl, UseHeldStatusHealingItem
	jp CallBattleCore

.paralyzed
	call AnimateFailedMove
	ld hl, AlreadyParalyzedText
	jp StdBattleTextbox

.failed
	jp PrintDidntAffect2

.didnt_affect
	call AnimateFailedMove
	jp PrintDoesntAffect

CheckMoveTypeMatchesTarget:
; Compare move type to opponent type.
; Return z if matching the opponent type,
; unless the move is Normal (Tri Attack).

	push hl

	ld hl, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wBattleMonType1
.ok

	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp NORMAL
	jr z, .normal

	cp [hl]
	jr z, .return

	inc hl
	cp [hl]

.return
	pop hl
	ret

.normal
	ld a, 1
	and a
	pop hl
	ret

INCLUDE "engine/battle/move_effects/substitute.asm"

BattleCommand_RechargeNextTurn:
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	set SUBSTATUS_RECHARGE, [hl]
	ret

EndRechargeOpp:
	push hl
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVarAddr
	res SUBSTATUS_RECHARGE, [hl]
	pop hl
	ret

INCLUDE "engine/battle/move_effects/rage.asm"

BattleCommand_DoubleFlyingDamage:
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	bit SUBSTATUS_FLYING, a
	ret z
	jr DoubleDamage

BattleCommand_DoubleUndergroundDamage:
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	bit SUBSTATUS_UNDERGROUND, a
	ret z

	; fallthrough

DoubleDamage:
	ld hl, wCurDamage + 1
	sla [hl]
	dec hl
	rl [hl]
	jr nc, .quit

	ld a, $ff
	ld [hli], a
	ld [hl], a
.quit
	ret

INCLUDE "engine/battle/move_effects/mimic.asm"

INCLUDE "engine/battle/move_effects/leech_seed.asm"

INCLUDE "engine/battle/move_effects/splash.asm"

INCLUDE "engine/battle/move_effects/disable.asm"

INCLUDE "engine/battle/move_effects/pay_day.asm"

INCLUDE "engine/battle/move_effects/conversion.asm"

BattleCommand_ResetStats:
	ld a, BASE_STAT_LEVEL
	ld hl, wPlayerStatLevels
	call .Fill
	ld hl, wEnemyStatLevels
	call .Fill

	ldh a, [hBattleTurn]
	push af

	call SetPlayerTurn
	call CalcPlayerStats
	call SetEnemyTurn
	call CalcEnemyStats

	pop af
	ldh [hBattleTurn], a

	call AnimateCurrentMove

	ld hl, EliminatedStatsText
	jp StdBattleTextbox

.Fill:
	ld b, NUM_LEVEL_STATS
.next
	ld [hli], a
	dec b
	jr nz, .next
	ret

BattleCommand_Heal:
	ld de, wBattleMonHP
	ld hl, wBattleMonMaxHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld de, wEnemyMonHP
	ld hl, wEnemyMonMaxHP
.got_hp
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld b, a
	push hl
	push de
	push bc
	ld c, 2
	call CompareBytes
	pop bc
	pop de
	pop hl
	jp z, .hp_full
	ld a, b
	ld bc, REST
	call CompareMove
	jr nz, .not_rest

	push hl
	push de
	push af
	call BattleCommand_MoveDelay
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	res SUBSTATUS_TOXIC, [hl]
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	ld a, [hl]
	and a
	ld [hl], REST_SLEEP_TURNS + 1
	ld hl, WentToSleepText
	jr z, .no_status_to_heal
	ld hl, RestedText
.no_status_to_heal
	call StdBattleTextbox
	ldh a, [hBattleTurn]
	and a
	jr nz, .calc_enemy_stats
	call CalcPlayerStats
	jr .got_stats

.calc_enemy_stats
	call CalcEnemyStats
.got_stats
	pop af
	pop de
	pop hl

.not_rest
	jr z, .restore_full_hp
	ld hl, GetHalfMaxHP
	call CallBattleCore
	jr .finish

.restore_full_hp
	ld hl, GetMaxHP
	call CallBattleCore
.finish
	call AnimateCurrentMove
	call BattleCommand_SwitchTurn
	ld hl, RestoreHP
	call CallBattleCore
	call BattleCommand_SwitchTurn
	call UpdateUserInParty
	call RefreshBattleHuds
	ld hl, RegainedHealthText
	jp StdBattleTextbox

.hp_full
	call AnimateFailedMove
	ld hl, HPIsFullText
	jp StdBattleTextbox

INCLUDE "engine/battle/move_effects/transform.asm"

BattleEffect_ButItFailed:
	call AnimateFailedMove
	jp PrintButItFailed

ClearLastMove:
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE
	call GetBattleVarAddr
	xor a
	ld [hl], a

	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	xor a
	ld [hl], a
	ret

ResetActorDisable:
	ldh a, [hBattleTurn]
	and a
	jr z, .player

	xor a
	ld [wEnemyDisableCount], a
	ld [wEnemyDisabledMove], a
	ret

.player
	xor a
	ld [wPlayerDisableCount], a
	ld [wDisabledMove], a
	ret

BattleCommand_Screen:
	ld hl, wPlayerScreens
	ld bc, wPlayerLightScreenCount
	ldh a, [hBattleTurn]
	and a
	jr z, .got_screens_pointer
	ld hl, wEnemyScreens
	ld bc, wEnemyLightScreenCount

.got_screens_pointer
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_LIGHT_SCREEN
	jr nz, .Reflect

	bit SCREENS_LIGHT_SCREEN, [hl]
	jr nz, .failed
	set SCREENS_LIGHT_SCREEN, [hl]
	ld a, 5
	ld [bc], a
	ld hl, LightScreenEffectText
	jr .good

.Reflect:
	bit SCREENS_REFLECT, [hl]
	jr nz, .failed
	set SCREENS_REFLECT, [hl]

	; LightScreenCount -> ReflectCount
	inc bc

	ld a, 5
	ld [bc], a
	ld hl, ReflectEffectText

.good
	call AnimateCurrentMove
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed

PrintDoesntAffect:
	ld hl, DoesntAffectText
	jp StdBattleTextbox

PrintNothingHappened:
	ld hl, NothingHappenedText
	jp StdBattleTextbox

TryPrintButItFailed:
	ld a, [wAlreadyFailed]
	and a
	ret nz

	; fallthrough

PrintButItFailed:
	ld hl, ButItFailedText
	jp StdBattleTextbox

FailMove:
	call AnimateFailedMove
	; fallthrough

FailMimic:
	ld hl, ButItFailedText ; 'but it failed!'
	ld de, ItFailedText    ; 'it failed!'
	jp FailText_CheckOpponentProtect

PrintDidntAffect:
	ld hl, DidntAffect1Text
	jp StdBattleTextbox

PrintDidntAffect2:
	call AnimateFailedMove
	ld hl, DidntAffect1Text ; 'it didn't affect'
	ld de, DidntAffect2Text ; 'it didn't affect'
	jp FailText_CheckOpponentProtect

PrintParalyze:
; 'paralyzed! maybe it can't attack!'
	ld hl, ParalyzedText
	jp StdBattleTextbox

CheckSubstituteOpp:
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret

INCLUDE "engine/battle/move_effects/selfdestruct.asm"

INCLUDE "engine/battle/move_effects/mirror_move.asm"

INCLUDE "engine/battle/move_effects/metronome.asm"

CheckUserMove:
; Return z if the user has move a.
	ld b, a
	ld de, wBattleMonMoves
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wEnemyMonMoves
.ok

	ld c, NUM_MOVES
.loop
	ld a, [de]
	inc de
	cp b
	ret z

	dec c
	jr nz, .loop

	ld a, 1
	and a
	ret

ResetTurn:
	ld hl, wPlayerCharging
	ldh a, [hBattleTurn]
	and a
	jr z, .player
	ld hl, wEnemyCharging

.player
	ld [hl], 1
	xor a
	ld [wAlreadyDisobeyed], a
	call DoMove
	jp EndMoveEffect

INCLUDE "engine/battle/move_effects/thief.asm"

BattleCommand_ArenaTrap:
; Doesn't work on an absent opponent.

	call CheckHiddenOpponent
	jr nz, .failed

; Don't trap if the opponent is already trapped.

	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	bit SUBSTATUS_CANT_RUN, [hl]
	jr nz, .failed

; Otherwise trap the opponent.

	set SUBSTATUS_CANT_RUN, [hl]
	call AnimateCurrentMove
	ld hl, CantEscapeNowText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed

INCLUDE "engine/battle/move_effects/nightmare.asm"

BattleCommand_Defrost:
; Thaw the user.

	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	bit FRZ, [hl]
	ret z
	res FRZ, [hl]

; Don't update the enemy's party struct in a wild battle.

	ldh a, [hBattleTurn]
	and a
	jr z, .party

	ld a, [wBattleMode]
	dec a
	jr z, .done

.party
	ld a, MON_STATUS
	call UserPartyAttr
	res FRZ, [hl]

.done
	call RefreshBattleHuds
	ld hl, WasDefrostedText
	jp StdBattleTextbox

INCLUDE "engine/battle/move_effects/curse.asm"

INCLUDE "engine/battle/move_effects/protect.asm"

INCLUDE "engine/battle/move_effects/endure.asm"

INCLUDE "engine/battle/move_effects/spikes.asm"

INCLUDE "engine/battle/move_effects/foresight.asm"

INCLUDE "engine/battle/move_effects/perish_song.asm"

INCLUDE "engine/battle/move_effects/sandstorm.asm"

INCLUDE "engine/battle/move_effects/rollout.asm"

BattleCommand_Unused5D:
; effect0x5d
	ret

INCLUDE "engine/battle/move_effects/fury_cutter.asm"

INCLUDE "engine/battle/move_effects/attract.asm"

INCLUDE "engine/battle/move_effects/return.asm"

INCLUDE "engine/battle/move_effects/present.asm"

INCLUDE "engine/battle/move_effects/frustration.asm"

INCLUDE "engine/battle/move_effects/safeguard.asm"

SafeCheckSafeguard:
	push hl
	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .got_turn
	ld hl, wPlayerScreens

.got_turn
	bit SCREENS_SAFEGUARD, [hl]
	pop hl
	ret

BattleCommand_CheckSafeguard:
	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .got_turn
	ld hl, wPlayerScreens
.got_turn
	bit SCREENS_SAFEGUARD, [hl]
	ret z
	ld a, 1
	ld [wAttackMissed], a
	call BattleCommand_MoveDelay
	ld hl, SafeguardProtectText
	call StdBattleTextbox
	jp EndMoveEffect

INCLUDE "engine/battle/move_effects/magnitude.asm"

INCLUDE "engine/battle/move_effects/baton_pass.asm"

INCLUDE "engine/battle/move_effects/pursuit.asm"

INCLUDE "engine/battle/move_effects/rapid_spin.asm"

INCLUDE "engine/battle/move_effects/timebasedheal.asm"

INCLUDE "engine/battle/move_effects/hidden_power.asm"

INCLUDE "engine/battle/move_effects/rain_dance.asm"

INCLUDE "engine/battle/move_effects/sunny_day.asm"

INCLUDE "engine/battle/move_effects/belly_drum.asm"

INCLUDE "engine/battle/move_effects/psych_up.asm"

INCLUDE "engine/battle/move_effects/mirror_coat.asm"

BattleCommand_DoubleMinimizeDamage:
	ld hl, wEnemyMinimized
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wPlayerMinimized
.ok
	ld a, [hl]
	and a
	ret z
	ld hl, wCurDamage + 1
	sla [hl]
	dec hl
	rl [hl]
	ret nc
	ld a, $ff
	ld [hli], a
	ld [hl], a
	ret

BattleCommand_SkipSunCharge:
; mimicsuncharge
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	ret nz
	ld b, charge_command
	jp SkipToBattleCommand

INCLUDE "engine/battle/move_effects/future_sight.asm"

INCLUDE "engine/battle/move_effects/thunder.asm"

CheckHiddenOpponent:
; BUG: Lock-On and Mind Reader don't always bypass Fly and Dig (see docs/bugs_and_glitches.md)
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret

GetUserItem:
; Return the effect of the user's item in bc, and its id at hl.
	ld hl, wBattleMonItem
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld hl, wEnemyMonItem
.go
	ld b, [hl]
	jp GetItemHeldEffect

GetOpponentItem:
; Return the effect of the opponent's item in bc, and its id at hl.
	ld hl, wEnemyMonItem
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld hl, wBattleMonItem
.go
	ld b, [hl]
	jp GetItemHeldEffect

GetItemHeldEffect:
; Return the effect of item b in bc.
	ld a, b
	and a
	ret z

	push hl
	ld hl, ItemAttributes + ITEMATTR_EFFECT
	dec a
	ld c, a
	ld b, 0
	ld a, ITEMATTR_STRUCT_LENGTH
	call AddNTimes
	ld a, BANK(ItemAttributes)
	call GetFarWord
	ld b, l
	ld c, h
	pop hl
	ret

AnimateCurrentMoveEitherSide:
	push hl
	push de
	push bc
	ld a, [wBattleAnimParam]
	push af
	call BattleCommand_LowerSub
	pop af
	ld [wBattleAnimParam], a
	call PlayDamageAnim
	call BattleCommand_RaiseSub
	pop bc
	pop de
	pop hl
	ret

AnimateCurrentMove:
	push hl
	push de
	push bc
	ld a, [wBattleAnimParam]
	push af
	call BattleCommand_LowerSub
	pop af
	ld [wBattleAnimParam], a
	call LoadMoveAnim
	call BattleCommand_RaiseSub
	pop bc
	pop de
	pop hl
	ret

PlayDamageAnim:
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	and a
	ret z

	call SetMoveAnimationID

	ldh a, [hBattleTurn]
	and a
	ld a, BATTLEANIM_ENEMY_DAMAGE
	jr z, .player
	ld a, BATTLEANIM_PLAYER_DAMAGE

.player
	ld [wNumHits], a

	jp PlayUserBattleAnim

LoadMoveAnim:
	xor a
	ld [wNumHits], a

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	and a
	ret z

	; fallthrough

LoadAnim:
	call SetMoveAnimationID
	; fallthrough

PlayUserBattleAnim:
	push hl
	push de
	push bc
	callfar PlayBattleAnim
	pop bc
	pop de
	pop hl
	ret

SetMoveAnimationID:
	push hl
	call GetMoveIndexFromID
	ld a, l
	ld [wFXAnimID], a
	ld a, h
	ld [wFXAnimID + 1], a
	pop hl
	ret

PlayOpponentBattleAnim:
	ld a, e
	ld [wFXAnimID], a
	ld a, d
	ld [wFXAnimID + 1], a
	xor a
	ld [wNumHits], a

	push hl
	push de
	push bc
	call BattleCommand_SwitchTurn

	callfar PlayBattleAnim

	call BattleCommand_SwitchTurn
	pop bc
	pop de
	pop hl
	ret

CallBattleCore:
	ld a, BANK("Battle Core")
	rst FarCall
	ret

AnimateFailedMove:
	call BattleCommand_LowerSub
	call BattleCommand_MoveDelay
	jp BattleCommand_RaiseSub

BattleCommand_MoveDelay:
; Wait 40 frames.
	ld c, 40
	jp DelayFrames

BattleCommand_ClearText:
; Used in multi-hit moves.
	ld hl, .text
	jp BattleTextbox

.text:
	text_end

SkipToBattleCommand:
; Skip over commands until reaching command b.
	ld a, [wBattleScriptBufferAddress + 1]
	ld h, a
	ld a, [wBattleScriptBufferAddress]
	ld l, a
.loop
	ld a, [hli]
	cp b
	jr nz, .loop

	ld a, h
	ld [wBattleScriptBufferAddress + 1], a
	ld a, l
	ld [wBattleScriptBufferAddress], a
	ret

DisappearUser:
	farcall _DisappearUser
	ret

AppearUserLowerSub:
	farcall _AppearUserLowerSub
	ret

AppearUserRaiseSub:
	farcall _AppearUserRaiseSub
	ret

_CheckBattleScene:
; Checks the options.  Returns carry if battle animations are disabled.
	push hl
	push de
	push bc
	farcall CheckBattleScene
	pop bc
	pop de
	pop hl
	ret

CompareMove:
	; checks if the move ID in a matches the move in bc
	push hl
	call GetMoveIndexFromID
	ld a, h
	cp b
	ld a, l
	pop hl
	ret nz
	cp c
	ret

CheckMoveInList:
	; checks if the move ID in a belongs to a list of moves in hl
	push bc
	push de
	push hl
	call GetMoveIndexFromID
	ld b, h
	ld c, l
	pop hl
	ld de, 2
	call IsInWordArray
	pop de
	pop bc
	ret

INCLUDE "engine/battle/move_effects/stealth_rock.asm"
INCLUDE "engine/battle/move_effects/u_turn.asm"
INCLUDE "engine/battle/move_effects/trick_room.asm"
INCLUDE "engine/battle/move_effects/sucker_punch.asm"
