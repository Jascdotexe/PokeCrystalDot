BattleCommand_ForcePlayerSwitch:
	ldh a, [hBattleTurn]
	and a
	jp nz, .Enemy

; Player's turn
; Need something to switch to
	call CheckAnyOtherAlivePartyMons
	ret z

	call UpdateBattleMonInParty

	ld c, 20
	call DelayFrames

; Transition into switchmon menu
	call LoadStandardMenuHeader
	farcall SetUpBattlePartyMenu

	farcall ForcePickSwitchMonInBattle

; Return to battle scene
	call ClearPalettes
	farcall _LoadBattleFontsHPBar
	call CloseWindow
	call ClearSprites
	hlcoord 1, 0
	lb bc, 4, 10
	call ClearBox
	ld b, SCGB_BATTLE_COLORS
	call GetSGBLayout
	call SetPalettes
	call UTurn_LinkPlayerSwitch

	farcall CheckMobileBattleError
	jp c, EndMoveEffect

	ld hl, PassedBattleMonEntrance
	call CallBattleCore
	ret

.Enemy:
; Enemy's turn - wild mons don't switch
	ld a, [wBattleMode]
	dec a ; WILDMON
	ret z

	call CheckAnyOtherAliveEnemyMons
	ret z

	call UpdateEnemyMonInParty
	call UTurn_LinkEnemySwitch

	farcall CheckMobileBattleError
	jp c, EndMoveEffect

; Enemy switch
	xor a
	ld [wEnemySwitchMonIndex], a
	ld hl, EnemySwitch_SetMode
	call CallBattleCore
	ld hl, ResetBattleParticipants
	call CallBattleCore
	ld a, TRUE
	ld [wApplyStatLevelMultipliersToEnemy], a
	ld hl, ApplyStatLevelMultiplierOnAllStats
	call CallBattleCore

	ld hl, SpikesDamage
	call CallBattleCore
	ret

UTurn_LinkPlayerSwitch:
	ld a, [wLinkMode]
	and a
	ret z

	ld a, BATTLEPLAYERACTION_USEITEM
	ld [wBattlePlayerAction], a

	call LoadStandardMenuHeader
	ld hl, LinkBattleSendReceiveAction
	call CallBattleCore
	call CloseWindow

	xor a ; BATTLEPLAYERACTION_USEMOVE
	ld [wBattlePlayerAction], a
	ret

UTurn_LinkEnemySwitch:
	ld a, [wLinkMode]
	and a
	ret z

	call LoadStandardMenuHeader
	ld hl, LinkBattleSendReceiveAction
	call CallBattleCore

	ld a, [wOTPartyCount]
	add BATTLEACTION_SWITCH1
	ld b, a
	ld a, [wBattleAction]
	cp BATTLEACTION_SWITCH1
	jr c, .u_turn
	cp b
	jr c, .switch

.u_turn
	ld a, [wCurOTMon]
	add BATTLEACTION_SWITCH1
	ld [wBattleAction], a
.switch
	jp CloseWindow
