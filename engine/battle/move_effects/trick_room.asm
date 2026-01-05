BattleCommand_SetTrickRoom:
; Check if trick room is already active
	ld a, [wTrickRoom]
	and a
	jr z, .set_trick_room

; Trick room is active, turn it off
	xor a
	ld [wTrickRoom], a
	call AnimateCurrentMove
	ld hl, TrickRoomEndText
	jp StdBattleTextbox

.set_trick_room
; Activate trick room for 5 turns
	ld a, 5
	ld [wTrickRoom], a
	call AnimateCurrentMove
	ld hl, TrickRoomStartText
	jp StdBattleTextbox
