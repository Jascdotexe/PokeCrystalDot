SECTION "Evolutions and Attacks 3", ROMX

EvosAttacksPointers3::
	dw ArceusEvosAttacks
	dw SylveonEvosAttacks
	dw TogekissEvosAttacks
	dw AzurillEvosAttacks
	dw PorygonZEvosAttacks
    dw HonchkrowEvosAttacks
.IndirectEnd::



ArceusEvosAttacks:
	db 0 ; na
	dbw 1, TACKLE
	db 0 ; no more moves.

SylveonEvosAttacks:
	db 0 ; na
	dbw 1, TACKLE
	dbw 1, BATON_PASS
	dbw 1, TAKE_DOWN
	dbw 1, DOUBLE_EDGE
	dbw 1, TAIL_WHIP
	dbw 1, BITE
	dbw 1, GROWL
	dbw 1, CHARM
	; dbw 1, DISARMING_VOICE
	; dbw 1, COPYCAT
	; dbw 1, COVET
	; dbw 1, HELPING_HAND
	dbw 9, SAND_ATTACK
	dbw 10, QUICK_ATTACK
	; dbw 15, BABY_DOLL_EYES
	dbw 20, SWIFT
	dbw 25, LIGHT_SCREEN
	dbw 30, DRAINING_KISS
	; dbw 35, MISTY_TERRAIN
	; dbw 40, SKILL_SWAP
	dbw 45, PSYCH_UP
	dbw 50, MOONBLAST
	; dbw 55, LAST_RESORT
	db 0 ; no more moves.

TogekissEvosAttacks:
	db 0 ; no more evolutions
	; dbw 1, AIR_SLASH ; EVOMOVE
	dbw 1, FAIRY_WIND
	dbw 1, SKY_ATTACK
	dbw 1, EXTREMESPEED
	dbw 1, TRI_ATTACK
	dbw 1, CHARM
	dbw 1, ANCIENTPOWER
	dbw 1, DOUBLE_EDGE
	dbw 1, SAFEGUARD
	dbw 1, GROWL
	dbw 1, POUND
	dbw 1, BATON_PASS
	; dbw 1, FOLLOW_ME
	; dbw 1, LAST_RESORT
	; dbw 1, WISH
	; dbw 1, SWEET_KISS
	; dbw 1, LIFE_DEW
	db 0 ; no more level-up moves

AzurillEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, MARILL
	db 0 ; no more evolutions
	dbw 1, TAIL_WHIP
	dbw 2, SPLASH
	dbw 3, WATER_GUN
	; dbw 3, HELPING_HAND
	dbw 6, BUBBLEBEAM
	dbw 9, CHARM
	dbw 12, SLAM
	; ldbw 15, BOUNCE
	db 0 ; no more level-up moves

PorygonZEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONVERSION
	dbw 1, DEFENSE_CURL
	dbw 1, TACKLE
	; dbw 1, NASTY_PLOT
	; dbw 1, MAGNET_RISE
	; dbw 1, RECYCLE
	; dbw 1, TRICK_ROOM
	dbw 15, THUNDERSHOCK
	dbw 20, PSYBEAM
	dbw 25, CONVERSION2
	dbw 30, AGILITY
	dbw 35, RECOVER
	; dbw 40, DISCHARGE
	dbw 45, TRI_ATTACK
	dbw 50, DOUBLE_EDGE
	dbw 55, LOCK_ON
	dbw 60, ZAP_CANNON
	dbw 65, HYPER_BEAM
	db 0 ; no more level-up moves

HonchkrowEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WING_ATTACK
	dbw 1, HAZE
	; dbw 1, ASTONISH
	; dbw 1, SUCKER_PUNCH
	; dbw 1, NIGHT_SLASH
	; dbw 1, QUASH
	; dbw 25, SWAGGER
	; dbw 35, NASTY_PLOT
	; dbw 45, FOUL_PLAY
	; dbw 55, DARK_PULSE
	; dbw 65, COMEUPPANCE
    db 0 ; no more level-up moves
