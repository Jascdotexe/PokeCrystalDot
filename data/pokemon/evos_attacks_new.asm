SECTION "Evolutions and Attacks 3", ROMX

EvosAttacksPointers3::
	dw ArceusEvosAttacks
	dw SylveonEvosAttacks
	dw TogekissEvosAttacks
	dw AzurillEvosAttacks
	dw PorygonZEvosAttacks
    dw HonchkrowEvosAttacks
    dw MamoswineEvosAttacks
    dw ElectivireEvosAttacks
    dw MagmortarEvosAttacks
    dw WeavileEvosAttacks
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
	dbw 1, ASTONISH
	; dbw 1, SUCKER_PUNCH
	; dbw 1, NIGHT_SLASH
	; dbw 1, QUASH
	; dbw 25, SWAGGER
	; dbw 35, NASTY_PLOT
	; dbw 45, FOUL_PLAY
	; dbw 55, DARK_PULSE
	; dbw 65, COMEUPPANCE
    db 0 ; no more level-up moves

MamoswineEvosAttacks:
    db 0 ; no more evolutions
    ; dbw 1, DOUBLE_HIT
	dbw 1, TACKLE
	dbw 1, MUD_SLAP
	dbw 1, POWDER_SNOW
	dbw 1, FLAIL
	dbw 1, ANCIENTPOWER
	dbw 1, ICE_FANG ; EVOMOVE
	dbw 15, ICE_SHARD
	dbw 20, MIST
	dbw 25, ENDURE
	dbw 30, ICY_WIND
	dbw 37, AMNESIA
	dbw 44, TAKE_DOWN
	dbw 51, EARTHQUAKE
	dbw 58, BLIZZARD
	dbw 65, THRASH
	db 0 ; no more level-up moves

ElectivireEvosAttacks:
    db 0 ; no more evolutions
    dbw 1, QUICK_ATTACK
	dbw 1, LEER
	dbw 1, THUNDERSHOCK
	; dbw 1, CHARGE
	dbw 12, SWIFT
	; dbw 16, SHOCK_WAVE
	dbw 20, THUNDER_WAVE
	dbw 24, SCREECH
	dbw 28, THUNDERPUNCH
	; dbw 34, DISCHARGE
	dbw 40, LOW_KICK
	dbw 46, THUNDERBOLT
	dbw 52, LIGHT_SCREEN
	dbw 58, THUNDER
	; dbw 64, GIGA_IMPACT
    db 0 ; no more level-up moves

MagmortarEvosAttacks:
    db 0 ; no more evolutions
    dbw 1, EMBER
	dbw 1, LEER
	dbw 1, SMOG
	dbw 1, SMOKESCREEN
	; dbw 12, CLEAR_SMOG
	dbw 16, FLAME_WHEEL
	dbw 20, CONFUSE_RAY
	dbw 24, SCARY_FACE
	dbw 28, FIRE_PUNCH
	dbw 34, LAVA_PLUME
	dbw 40, LOW_KICK
	dbw 46, FLAMETHROWER
	dbw 52, SUNNY_DAY
	dbw 58, FIRE_BLAST
	dbw 64, HYPER_BEAM
	db 0 ; no more level-up moves

WeavileEvosAttacks:
    db 0 ; no more evolutions
    dbw 1, SCRATCH
	dbw 1, LEER
    dbw 1, AGILITY
    ; dbw 1, ASSURANCE
    ; dbw 1, TAUNT
    dbw 1, SLASH
    dbw 1, BEAT_UP
    dbw 1, ICE_SHARD
	dbw 1, QUICK_ATTACK
	dbw 18, METAL_CLAW
	dbw 24, ICY_WIND
	dbw 25, FAINT_ATTACK ; REMOVE
	dbw 30, FURY_SWIPES
	; dbw 36, HONE_CLAW
	; dbw 42, FLING
	; dbw 48, NASTY_PLOT
	dbw 54, SCREECH
	; dbw 60, NIGHT_SLASH
    ; dbw 66, DARK_PULSE
	db 0 ; no more level-up moves
