BattleCommand_CheckSuckerPunch:
; Sucker Punch only works if the target is about to use a damaging move
; For simplicity, we'll check if the target's move has non-zero power

	call CheckOpponentWentFirst
	jr z, .failed

	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVar
	and a
	ret nz

.failed
; Opponent didn't go first or is using a status move
	ld hl, ButItFailedText
	call StdBattleTextbox
	jp EndMoveEffect
