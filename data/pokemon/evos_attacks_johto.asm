SECTION "Evolutions and Attacks 2", ROMX

EvosAttacksPointers2::
	dw ChikoritaEvosAttacks
	dw BayleefEvosAttacks
	dw MeganiumEvosAttacks
	dw CyndaquilEvosAttacks
	dw QuilavaEvosAttacks
	dw TyphlosionEvosAttacks
	dw TotodileEvosAttacks
	dw CroconawEvosAttacks
	dw FeraligatrEvosAttacks
	dw SentretEvosAttacks
	dw FurretEvosAttacks
	dw HoothootEvosAttacks
	dw NoctowlEvosAttacks
	dw LedybaEvosAttacks
	dw LedianEvosAttacks
	dw SpinarakEvosAttacks
	dw AriadosEvosAttacks
	dw CrobatEvosAttacks
	dw ChinchouEvosAttacks
	dw LanturnEvosAttacks
	dw PichuEvosAttacks
	dw CleffaEvosAttacks
	dw IgglybuffEvosAttacks
	dw TogepiEvosAttacks
	dw TogeticEvosAttacks
	dw NatuEvosAttacks
	dw XatuEvosAttacks
	dw MareepEvosAttacks
	dw FlaaffyEvosAttacks
	dw AmpharosEvosAttacks
	dw BellossomEvosAttacks
	dw MarillEvosAttacks
	dw AzumarillEvosAttacks
	dw SudowoodoEvosAttacks
	dw PolitoedEvosAttacks
	dw HoppipEvosAttacks
	dw SkiploomEvosAttacks
	dw JumpluffEvosAttacks
	dw AipomEvosAttacks
	dw SunkernEvosAttacks
	dw SunfloraEvosAttacks
	dw YanmaEvosAttacks
	dw WooperEvosAttacks
	dw QuagsireEvosAttacks
	dw EspeonEvosAttacks
	dw UmbreonEvosAttacks
	dw MurkrowEvosAttacks
	dw SlowkingEvosAttacks
	dw MisdreavusEvosAttacks
	dw UnownEvosAttacks
	dw WobbuffetEvosAttacks
	dw GirafarigEvosAttacks
	dw PinecoEvosAttacks
	dw ForretressEvosAttacks
	dw DunsparceEvosAttacks
	dw GligarEvosAttacks
	dw SteelixEvosAttacks
	dw SnubbullEvosAttacks
	dw GranbullEvosAttacks
	dw QwilfishEvosAttacks
	dw ScizorEvosAttacks
	dw ShuckleEvosAttacks
	dw HeracrossEvosAttacks
	dw SneaselEvosAttacks
	dw TeddiursaEvosAttacks
	dw UrsaringEvosAttacks
	dw SlugmaEvosAttacks
	dw MagcargoEvosAttacks
	dw SwinubEvosAttacks
	dw PiloswineEvosAttacks
	dw CorsolaEvosAttacks
	dw RemoraidEvosAttacks
	dw OctilleryEvosAttacks
	dw DelibirdEvosAttacks
	dw MantineEvosAttacks
	dw SkarmoryEvosAttacks
	dw HoundourEvosAttacks
	dw HoundoomEvosAttacks
	dw KingdraEvosAttacks
	dw PhanpyEvosAttacks
	dw DonphanEvosAttacks
	dw Porygon2EvosAttacks
	dw StantlerEvosAttacks
	dw SmeargleEvosAttacks
	dw TyrogueEvosAttacks
	dw HitmontopEvosAttacks
	dw SmoochumEvosAttacks
	dw ElekidEvosAttacks
	dw MagbyEvosAttacks
	dw MiltankEvosAttacks
	dw BlisseyEvosAttacks
	dw RaikouEvosAttacks
	dw EnteiEvosAttacks
	dw SuicuneEvosAttacks
	dw LarvitarEvosAttacks
	dw PupitarEvosAttacks
	dw TyranitarEvosAttacks
	dw LugiaEvosAttacks
	dw HoOhEvosAttacks
	dw CelebiEvosAttacks
	dw ArceusEvosAttacks
	dw SylveonEvosAttacks
	dw TogekissEvosAttacks
	dw AzurillEvosAttacks
	dw PorygonZEvosAttacks
	dw HonchkrowEvosAttacks
.IndirectEnd::

ChikoritaEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, BAYLEEF
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 6, RAZOR_LEAF
	dbw 9, POISONPOWDER
	dbw 12, SYNTHESIS
	dbw 17, REFLECT
	dbw 23, LEECH_SEED
	dbw 28, SWEET_SCENT
	dbw 31, LIGHT_SCREEN
	dbw 34, BODY_SLAM
	dbw 39, SAFEGUARD
	dbw 42, GIGA_DRAIN
	dbw 50, SOLARBEAM
	db 0 ; no more level-up moves

BayleefEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, MEGANIUM
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, RAZOR_LEAF
	dbw 1, POISONPOWDER
	dbw 12, SYNTHESIS
	dbw 18, REFLECT
	dbw 26, LEECH_SEED
	dbw 32, SWEET_SCENT
	dbw 36, LIGHT_SCREEN
	dbw 40, BODY_SLAM
	dbw 46, SAFEGUARD
	dbw 50, GIGA_DRAIN
	dbw 54, SOLARBEAM
	db 0 ; no more level-up moves

MeganiumEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, RAZOR_LEAF
	dbw 1, POISONPOWDER
	dbw 12, SYNTHESIS
	dbw 18, REFLECT
	dbw 26, LEECH_SEED
	dbw 34, SWEET_SCENT
	dbw 40, LIGHT_SCREEN
	dbw 46, BODY_SLAM
	dbw 54, SAFEGUARD
	dbw 60, GIGA_DRAIN
	dbw 65, SOLARBEAM
	db 0 ; no more level-up moves

CyndaquilEvosAttacks:
	dbbw EVOLVE_LEVEL, 14, QUILAVA
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 6, SMOKESCREEN
	dbw 10, EMBER
	dbw 13, QUICK_ATTACK
	dbw 19, FLAME_WHEEL
	dbw 22, DEFENSE_CURL
	dbw 28, FLAME_CHARGE
	dbw 31, SWIFT
	dbw 37, LAVA_PLUME
	dbw 40, FLAMETHROWER
	dbw 46, INFERNO
	dbw 49, ROLLOUT
	dbw 55, DOUBLE_EDGE
	db 0 ; no more level-up moves

QuilavaEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, TYPHLOSION
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 1, SMOKESCREEN
	dbw 10, EMBER
	dbw 13, QUICK_ATTACK
	dbw 20, FLAME_WHEEL
	dbw 24, DEFENSE_CURL
	dbw 31, SWIFT
	dbw 35, FLAME_CHARGE
	dbw 42, LAVA_PLUME
	dbw 46, FLAMETHROWER
	dbw 53, INFERNO
	dbw 57, ROLLOUT
	dbw 64, DOUBLE_EDGE
	db 0 ; no more level-up moves

TyphlosionEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 1, SMOKESCREEN
	dbw 1, EMBER
	dbw 1, DOUBLE_EDGE
	dbw 13, QUICK_ATTACK
	dbw 20, FLAME_WHEEL
	dbw 24, DEFENSE_CURL
	dbw 31, SWIFT
	dbw 35, FLAME_CHARGE
	dbw 43, LAVA_PLUME
	dbw 48, FLAMETHROWER
	dbw 56, INFERNO
	dbw 61, ROLLOUT
	dbw 66, DOUBLE_EDGE
	db 0 ; no more level-up moves

TotodileEvosAttacks:
	dbbw EVOLVE_LEVEL, 18, CROCONAW
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, AQUA_TAIL
	dbw 6, WATER_GUN
	dbw 9, BITE
	dbw 13, SCARY_FACE
	dbw 19, ICE_FANG
	dbw 22, FLAIL
	dbw 27, CRUNCH
	dbw 30, SLASH
	dbw 33, SCREECH
	dbw 37, THRASH
	dbw 41, AQUA_TAIL
	dbw 50, HYDRO_PUMP
	db 0 ; no more level-up moves

CroconawEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, FERALIGATR
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, AQUA_TAIL
	dbw 1, WATER_GUN
	dbw 13, BITE
	dbw 15, SCARY_FACE
	dbw 21, ICE_FANG
	dbw 24, FLAIL
	dbw 30, CRUNCH
	dbw 34, SLASH
	dbw 37, SCREECH
	dbw 42, THRASH
	dbw 47, AQUA_TAIL
	dbw 55, HYDRO_PUMP
	db 0 ; no more level-up moves

FeraligatrEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, AQUA_TAIL
	dbw 1, WATER_GUN
	dbw 1, AGILITY
	dbw 13, BITE
	dbw 15, SCARY_FACE
	dbw 21, ICE_FANG
	dbw 24, FLAIL
	dbw 32, CRUNCH
	dbw 37, SLASH
	dbw 44, SCREECH
	dbw 51, THRASH
	dbw 59, AQUA_TAIL
	dbw 70, HYDRO_PUMP
	db 0 ; no more level-up moves

SentretEvosAttacks:
	dbbw EVOLVE_LEVEL, 15, FURRET
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 4, DEFENSE_CURL
	dbw 7, QUICK_ATTACK
	dbw 13, FURY_SWIPES
	dbw 20, SLAM
	dbw 28, REST
	dbw 36, AMNESIA
	dbw 39, BATON_PASS
	dbw 42, DOUBLE_EDGE
	; dbw 47, HYPER_VOICE
	db 0 ; no more level-up moves

FurretEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, DEFENSE_CURL
	dbw 1, QUICK_ATTACK
	dbw 13, FURY_SWIPES
	dbw 21, SLAM
	dbw 32, REST
	dbw 42, AMNESIA
	dbw 46, BATON_PASS
	dbw 50, DOUBLE_EDGE
	; dbw 56, HYPER_VOICE
	db 0 ; no more level-up moves

HoothootEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, NOCTOWL
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, GROWL
	dbw 3, TACKLE
	dbw 6, FORESIGHT ; ECHOED_VOICE
	dbw 9, CONFUSION
	dbw 12, REFLECT
	; dbw 15, DEFOG
	; dbw 18, AIR_SLASH
	dbw 16, HYPNOSIS
	; dbw 22, EXTRASENSORY
	dbw 24, TAKE_DOWN
	; dbw 27, UPROAR
	; dbw 30, ROOST
	dbw 33, MOONBLAST
	dbw 39, DREAM_EATER
	db 0 ; no more level-up moves

NoctowlEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 1, FORESIGHT ; ECHOED_VOICE
	dbw 1, SKY_ATTACK ; EVOMOVE
	dbw 9, CONFUSION
	dbw 12, REFLECT
	; dbw 15, DEFOG
	; dbw 18, AIR_SLASH
	dbw 16, HYPNOSIS
	; dbw 23, EXTRASENSORY
	dbw 28, TAKE_DOWN
	; dbw 33, UPROAR
	; dbw 38, ROOST
	dbw 43, MOONBLAST
	dbw 53, DREAM_EATER
	db 0 ; no more level-up moves

LedybaEvosAttacks:
	dbbw EVOLVE_LEVEL, 18, LEDIAN
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 5, SUPERSONIC
	dbw 8, SWIFT
	dbw 12, LIGHT_SCREEN
	dbw 12, REFLECT
	dbw 12, SAFEGUARD
	dbw 15, COMET_PUNCH
	dbw 18, MACH_PUNCH
	; dbw 19, ROOST
	; dbw 22, STRUGGLE_BUG
	dbw 26, BATON_PASS
	dbw 29, AGILITY
	; dbw 33, BUG_BUZZ
	; dbw 36, AIR_SLASH
	dbw 40, DOUBLE_EDGE
	db 0 ; no more level-up moves

LedianEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SUPERSONIC
	dbw 1, SWIFT
	dbw 12, LIGHT_SCREEN
	dbw 12, REFLECT
	dbw 12, SAFEGUARD
	dbw 15, COMET_PUNCH
	dbw 18, MACH_PUNCH
	; dbw 20, ROOST
	; dbw 24, STRUGGLE_BUG
	dbw 29, BATON_PASS
	dbw 33, AGILITY
	; dbw 38, BUG_BUZZ
	; dbw 42, AIR_SLASH
	dbw 47, DOUBLE_EDGE
	db 0 ; no more level-up moves

SpinarakEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, ARIADOS
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 1, STRING_SHOT
	dbw 5, ABSORB
	dbw 8, CONSTRICT
	; dbw 8, INFESTATION
	dbw 12, SCARY_FACE
	dbw 15, NIGHT_SHADE
	; dbw 19, SHADOW_SNEAK
	dbw 22, FURY_SWIPES
	dbw 26, SPIDER_WEB
	; dbw 26, SUCKER_PUNCH
	dbw 29, LEECH_LIFE
	dbw 33, AGILITY
	dbw 40, PSYCHIC_M
	; dbw 43, POISON_JAB
	; dbw 47, CROSS_POISON
	; dbw 50, STICKY_WEB
	; dbw 54, TOXIC_THREAD
	db 0 ; no more level-up moves

AriadosEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 1, STRING_SHOT
	dbw 1, ABSORB
	dbw 1, CONSTRICT
	dbw 1, FOCUS_ENERGY
	; dbw 8, INFESTATION
	dbw 12, SCARY_FACE
	dbw 15, NIGHT_SHADE
	; dbw 19, SHADOW_SNEAK
	dbw 22, FURY_SWIPES
	dbw 24, SWORDS_DANCE
	dbw 28, SPIDER_WEB
	; dbw 28, SUCKER_PUNCH
	dbw 32, LEECH_LIFE
	dbw 37, AGILITY
	dbw 46, PSYCHIC_M
	; dbw 50, POISON_JAB
	; dbw 55, CROSS_POISON
	; dbw 58, STICKY_WEB
	; dbw 63, TOXIC_THREAD
	db 0 ; no more level-up moves

CrobatEvosAttacks:
	db 0 ; no more evolutions
	; dbw 1, CROSS_POISON
	; dbw 1, TAILWIND
	; dbw 1, ASTONISH
	dbw 1, MEAN_LOOK
	dbw 1, TOXIC
	dbw 1, SCREECH
	dbw 1, ABSORB
	dbw 1, SUPERSONIC
	; dbw 15, POISON_FANG
	; dbw 27, AIR_CUTTER
	dbw 24, WING_ATTACK
	dbw 34, BITE
	dbw 41, HAZE
	; dbw 48, VENOSHOCK
	dbw 55, CONFUSE_RAY
	; dbw 62, AIR_SLASH
	dbw 69, LEECH_LIFE
	db 0 ; no more level-up moves

ChinchouEvosAttacks:
	dbbw EVOLVE_LEVEL, 27, LANTURN
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, SUPERSONIC
	; dbw 4, ELECTRO_BALL
	dbw 8, THUNDER_WAVE
	dbw 12, BUBBLEBEAM
	dbw 16, CONFUSE_RAY
	dbw 20, SPARK
	; dbw 24, CHARGE
	; dbw 28, DISCHARGE
	; dbw 32, AQUA_RING
	dbw 36, FLAIL
	dbw 40, TAKE_DOWN
	dbw 44, HYDRO_PUMP
	db 0 ; no more level-up moves

LanturnEvosAttacks:
	db 0 ; no more evolutions
	; dbw 1, SWALLOW
	; dbw 1, SPIT_UP
	; dbw 1, STOCKPILE
	; dbw 1, EERIE_IMPLUSE
	dbw 1, WATER_GUN
	dbw 1, SUPERSONIC
	; dbw 1, ELECTRO_BALL
	dbw 1, THUNDER_WAVE
	dbw 12, BUBBLEBEAM
	dbw 16, CONFUSE_RAY
	dbw 20, SPARK
	; dbw 24, CHARGE
	; dbw 30, DISCHARGE
	; dbw 36, AQUA_RING
	dbw 42, FLAIL
	dbw 48, TAKE_DOWN
	dbw 54, HYDRO_PUMP
	db 0 ; no more level-up moves

PichuEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, PIKACHU
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, TAIL_WHIP
	; dbw 4, PLAY_NICE
	dbw 8, SWEET_KISS
	; dbw 12, NUZZLE
	; dbw 16, NASTY_PLOT
	dbw 20, CHARM
	db 0 ; no more level-up moves

CleffaEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, CLEFAIRY
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, SPLASH
	; dbw 1, COPYCAT
	dbw 4, SING
	dbw 8, SWEET_KISS
	; dbw 12, DISARMING_VOICE
	dbw 16, ENCORE
	dbw 20, CHARM
	db 0 ; no more level-up moves

IgglybuffEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, JIGGLYPUFF
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, SING
	; dbw 1, COPYCAT
	dbw 4, DEFENSE_CURL
	dbw 8, SWEET_KISS
	; dbw 12, DISARMING_VOICE
	dbw 16, DISABLE
	dbw 20, CHARM
	db 0 ; no more level-up moves

TogepiEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, TOGETIC
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, POUND
	dbw 4, SWEET_KISS
	; dbw 8, LIFE_DEW
	dbw 12, CHARM
	dbw 16, ANCIENTPOWER
	; dbw 20, YAWN
	dbw 24, METRONOME
	dbw 32, DOUBLE_EDGE
	dbw 36, SAFEGUARD
	; dbw 40, FOLLOW_ME
	dbw 44, BATON_PASS
	; dbw 48, LAST_RESORT
	; dbw 52, WISH
	db 0 ; no more level-up moves

TogeticEvosAttacks:
	dbbw EVOLVE_ITEM, SUN_STONE, TOGEKISS
	dbw 1, GROWL
	dbw 1, POUND
	dbw 1, SWEET_KISS
	; dbw 1, LIFE_DEW
	dbw 10, FAIRY_WIND ;EVOMOVE
	dbw 12, CHARM
	dbw 16, ANCIENTPOWER
	; dbw 20, YAWN
	dbw 24, METRONOME
	dbw 32, DOUBLE_EDGE
	dbw 36, SAFEGUARD
	; dbw 40, FOLLOW_ME
	dbw 44, BATON_PASS
	; dbw 48, LAST_RESORT
	; dbw 52, WISH
	db 0 ; no more level-up moves

NatuEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, XATU
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, LEER
	; dbw 5, STORED_POWER
	dbw 10, TELEPORT
	dbw 15, CONFUSE_RAY
	dbw 20, NIGHT_SHADE
	; dbw 26, PSYCHO_SHIFT
	; dbw 30, POWER_SWAP
	; dbw 35, GUARD_SWAP
	dbw 35, PSYCHIC_M
	; dbw 40, WISH
	dbw 45, FUTURE_SIGHT
	db 0 ; no more level-up moves

XatuEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, LEER
	; dbw 1, STORED_POWER
	dbw 1, TELEPORT
	; dbw 1, AIR_SLASH ; EVOMOVE
	dbw 15, CONFUSE_RAY
	dbw 20, NIGHT_SHADE
	; dbw 28, PSYCHO_SHIFT
	; dbw 34, POWER_SWAP
	; dbw 34, GUARD_SWAP
	dbw 41, PSYCHIC_M
	; dbw 40, WISH
	dbw 55, FUTURE_SIGHT
	db 0 ; no more level-up moves

MareepEvosAttacks:
	dbbw EVOLVE_LEVEL, 15, FLAAFFY
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 4, THUNDER_WAVE
	dbw 8, THUNDERSHOCK
	dbw 11, COTTON_SPORE
	; dbw 15, CHARGE
	dbw 18, TAKE_DOWN
	; dbw 22, ELECTRO_BALL
	dbw 25, CONFUSE_RAY
	; dbw 29, POWER_GEM
	; dbw 32, DISCHARGE
	dbw 36, COTTON_SPORE
	; dbw 39, DAZZLING_GLEAM
	dbw 43, LIGHT_SCREEN
	dbw 46, THUNDER
	db 0 ; no more level-up moves

FlaaffyEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, AMPHAROS
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 4, THUNDER_WAVE
	dbw 8, THUNDERSHOCK
	dbw 11, COTTON_SPORE
	; dbw 16, CHARGE
	dbw 20, TAKE_DOWN
	; dbw 25, ELECTRO_BALL
	dbw 29, CONFUSE_RAY
	; dbw 34, POWER_GEM
	; dbw 38, DISCHARGE
	dbw 43, COTTON_SPORE
	; dbw 47, DAZZLING_GLEAM
	dbw 52, LIGHT_SCREEN
	dbw 56, THUNDER
	db 0 ; no more level-up moves

AmpharosEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, THUNDERPUNCH ; EVOMOVE
	dbw 1, FIRE_PUNCH
	dbw 1, DRAGON_PULSE
	; dbw 1, MAGNETIC_FLUX
	dbw 1, ZAP_CANNON ; EVOMOVE
	dbw 4, THUNDER_WAVE
	dbw 8, THUNDERSHOCK
	dbw 11, COTTON_SPORE
	; dbw 16, CHARGE
	dbw 20, TAKE_DOWN
	; dbw 25, ELECTRO_BALL
	dbw 29, CONFUSE_RAY
	dbw 35, DRAGON_PULSE
	; dbw 35, POWER_GEM
	; dbw 40, DISCHARGE
	dbw 46, COTTON_SPORE
	; dbw 51, DAZZLING_GLEAM
	dbw 57, LIGHT_SCREEN
	dbw 62, THUNDER
	db 0 ; no more level-up moves

BellossomEvosAttacks:
	db 0 ; no more evolutions
	; dbw 1, PETAL_BLIZZARD ; EVOMOVE
	dbw 1, ABSORB
	; dbw 1, ACID
	dbw 1, MEGA_DRAIN
	dbw 1, GROWTH
	dbw 1, POISONPOWDER
	dbw 1, SWEET_SCENT
	dbw 1, STUN_SPORE
	dbw 1, PETAL_DANCE
	dbw 1, SLEEP_POWDER
	dbw 1, TOXIC
	dbw 1, GIGA_DRAIN
	dbw 1, MOONLIGHT
	; dbw 1, QUIVER_DANCE
	; dbw 1, GRASSY_TERRAIN
	dbw 1, MOONBLAST
	dbw 1, SOLARBEAM
	db 0 ; no more level-up moves

MarillEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, AZUMARILL
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, DEFENSE_CURL
	dbw 1, TAIL_WHIP
	dbw 1, WATER_GUN
	dbw 1, ROLLOUT
	dbw 6, BUBBLEBEAM
	dbw 9, CHARM
	dbw 12, SLAM
	; dbw 15, BOUNCE
	dbw 19, AQUA_TAIL
	dbw 21, PLAY_ROUGH
	; dbw 24, AQUA_RING
	dbw 27, RAIN_DANCE
	dbw 30, HYDRO_PUMP  
	dbw 33, DOUBLE_EDGE
	; dbw 36, SUPERPOWER
	db 0 ; no more level-up moves

AzumarillEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, DEFENSE_CURL
	dbw 1, TAIL_WHIP
	dbw 1, WATER_GUN
	dbw 1, ROLLOUT
	dbw 6, BUBBLEBEAM
	dbw 9, CHARM
	dbw 12, SLAM
	; dbw 15, BOUNCE
	dbw 21, AQUA_TAIL
	dbw 25, PLAY_ROUGH
	; dbw 30, AQUA_RING
	dbw 35, RAIN_DANCE
	dbw 40, HYDRO_PUMP  
	dbw 45, DOUBLE_EDGE
	; dbw 50l, SUPERPOWER
	db 0 ; no more level-up moves

SudowoodoEvosAttacks:
	db 0 ; no more evolutions
	; dbw 1, WOOD_HAMMER
	; dbw 1, STONE_EDGE
	; dbw 1, COPYCAT
	; dbw 1, HAMMER_ARM
	; dbw 1, FAKE_TEARS
	dbw 1, ROCK_THROW
	dbw 1, FLAIL
	; dbw 12, BLOCK
	dbw 16, MIMIC
	; dbw 20, ROCK_TOMB
	; dbw 24, TEARFUL_LOOK
	; dbw 28, SUCKER_PUNCH
	dbw 32, ROCK_SLIDE
	dbw 36, LOW_KICK
	dbw 40, COUNTER
	dbw 44, DOUBLE_EDGE
	; dbw 48, HEAD_SMASH
	db 0 ; no more level-up moves

PolitoedEvosAttacks:
	db 0 ; no more evolutions
	; dbw 1, BOUNCE ; EVOMOVE
	dbw 1, POUND
	dbw 1, HYDRO_PUMP
	dbw 1, RAIN_DANCE
	; dbw 1, BELLY_DRUM
	dbw 1, WATER_GUN ; REMOVE
	dbw 1, HYPNOSIS ; REMOVE
	dbw 1, DOUBLESLAP ; REMOVE
	dbw 1, PERISH_SONG ; REMOVE
	dbw 35, PERISH_SONG ; REMOVE
	dbw 51, SWAGGER ; REMOVE
	db 0 ; no more level-up moves

HoppipEvosAttacks:
	dbbw EVOLVE_LEVEL, 18, SKIPLOOM
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 1, TACKLE
	dbw 4, TAIL_WHIP
	dbw 6, ABSORB
	dbw 8, FAIRY_WIND
	dbw 10, POISONPOWDER
	dbw 10, STUN_SPORE
	dbw 10, SLEEP_POWDER
	; dbw 12, BULLET_SEED
	dbw 15, SYNTHESIS
	dbw 19, LEECH_SEED
	dbw 22, MEGA_DRAIN
	; dbw 24, ACROBATICS
	dbw 27, COTTON_SPORE
	; dbw 29, U_TURN
	dbw 32, GIGA_DRAIN
	; dbw 35, BOUNCE
	; dbw 38, MEMENTO
	db 0 ; no more level-up moves

SkiploomEvosAttacks:
	dbbw EVOLVE_LEVEL, 27, JUMPLUFF
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 1, ABSORB
	dbw 1, SYNTHESIS
	dbw 10, FAIRY_WIND
	dbw 12, POISONPOWDER
	dbw 12, STUN_SPORE
	dbw 12, SLEEP_POWDER
	; dbw 15, BULLET_SEED
	dbw 20, LEECH_SEED
	dbw 24, MEGA_DRAIN
	; dbw 28, ACROBATICS
	dbw 31, COTTON_SPORE
	; dbw 34, U_TURN
	dbw 37, GIGA_DRAIN
	; dbw 41, BOUNCE
	; dbw 44, MEMENTO
	db 0 ; no more level-up moves

JumpluffEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 1, ABSORB
	dbw 1, SYNTHESIS
	dbw 10, FAIRY_WIND
	dbw 12, POISONPOWDER
	dbw 12, STUN_SPORE
	dbw 12, SLEEP_POWDER
	; dbw 15, BULLET_SEED
	dbw 20, LEECH_SEED
	dbw 24, MEGA_DRAIN
	; dbw 30, ACROBATICS
	dbw 35, COTTON_SPORE
	; dbw 39, U_TURN
	dbw 43, GIGA_DRAIN
	; dbw 49, BOUNCE
	; dbw 55, MEMENTO
	db 0 ; no more level-up moves

AipomEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, TAIL_WHIP
	dbw 4, SAND_ATTACK
	; dbw 8, ASTONISH
	dbw 11, BATON_PASS
	; dbw 15, TICKLE
	dbw 18, FURY_SWIPES
	dbw 22, SWIFT
	dbw 25, SCREECH
	dbw 29, AGILITY
	; dbw 32, DOUBLE_HIT
	; dbw 36, FLING
	; dbw 39, NASTY_PLOT
	; dbw 43, LAST_RESORT
	db 0 ; no more level-up moves

SunkernEvosAttacks:
	dbbw EVOLVE_ITEM, SUN_STONE, SUNFLORA
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWTH
	dbw 7, ABSORB
	dbw 10, MEGA_DRAIN
	dbw 16, RAZOR_LEAF
	; dbw 19, WORRY_SEED
	dbw 22, GIGA_DRAIN
	; dbw 25, ENDEAVOR
	dbw 28, SYNTHESIS
	dbw 31, SOLARBEAM
	dbw 34, DOUBLE_EDGE
	dbw 36, SUNNY_DAY
	; dbw 39, SEED_BOMB
	db 0 ; no more level-up moves

SunfloraEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, TACKLE
	dbw 1, GROWTH
	; dbw 4, INGRAIN
	dbw 7, ABSORB
	dbw 10, MEGA_DRAIN
	dbw 13, LEECH_SEED
	dbw 16, RAZOR_LEAF
	; dbw 19, WORRY_SEED
	dbw 22, GIGA_DRAIN
	; dbw 25, BULLET_SEED
	dbw 28, PETAL_DANCE
	dbw 31, SOLARBEAM
	dbw 34, DOUBLE_EDGE
	dbw 36, SUNNY_DAY
	; dbw 43, LEAF_STORM
	; dbw 50, PETAL_BLIZZARD
	db 0 ; no more level-up moves

YanmaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, FORESIGHT     ;
	dbw 6, QUICK_ATTACK
	dbw 11, DOUBLE_TEAM
	; dbw 14, AIR_CUTTER
	dbw 16, SONICBOOM    ;
	dbw 17, DETECT
	dbw 22, SUPERSONIC
	; dbw 27, UPROAR
	; dbw 30, BUG_BITE
	dbw 33, ANCIENTPOWER
	dbw 38, HYPNOSIS
	dbw 43, WING_ATTACK
	dbw 46, SCREECH
	; dbw 39, U_TURN
	; dbw 54, AIR_SLASH
	; dbw 57, BUG_BUZZ
	db 0 ; no more level-up moves

WooperEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, QUAGSIRE
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, TAIL_WHIP
	dbw 4, RAIN_DANCE
	; dbw 8, MUD_SHOT
	dbw 12, MIST
	dbw 12, HAZE
	dbw 16, SLAM
	; dbw 21, YAWN
	dbw 24, AQUA_TAIL
	; dbw 28, MUDDY_WATER
	dbw 32, AMNESIA
	dbw 36, TOXIC
	dbw 40, EARTHQUAKE
	db 0 ; no more level-up moves

QuagsireEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, TAIL_WHIP
	dbw 1, RAIN_DANCE
	; dbw 1, MUD_SHOT
	dbw 12, MIST
	dbw 12, HAZE
	dbw 16, SLAM
	; dbw 23, YAWN
	dbw 28, AQUA_TAIL
	; dbw 34, MUDDY_WATER
	dbw 40, AMNESIA
	dbw 46, TOXIC
	dbw 52, EARTHQUAKE
	db 0 ; no more level-up moves

EspeonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 1, SAND_ATTACK
	dbw 1, CONFUSION ; EVOMOVE
	dbw 1, TAKE_DOWN
	dbw 1, DOUBLE_EDGE
	dbw 1, BITE
	dbw 1, GROWL
	dbw 1, CHARM
	dbw 1, BATON_PASS
	; dbw 1, COVET
	; dbw 1, COPYCAT
	dbw 10, QUICK_ATTACK
	; dbw 15, BABY_DOLL_EYES
	dbw 20, SWIFT
	dbw 25, PSYBEAM
	dbw 30, MORNING_SUN
	; dbw 35, POWER_SWAP
	dbw 40, PSYCHIC_M
	dbw 45, PSYCH_UP
	dbw 50, FUTURE_SIGHT
	; dbw 55, LAST_RESORT
	db 0 ; no more level-up moves

UmbreonEvosAttacks:
	db 0 ; no more evolutions
	; dbw 1, SNARL
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 1, SAND_ATTACK
	dbw 1, CONFUSION ; EVOMOVE
	dbw 1, TAKE_DOWN
	dbw 1, DOUBLE_EDGE
	dbw 1, BITE
	dbw 1, GROWL
	dbw 1, CHARM
	dbw 1, BATON_PASS
	; dbw 1, COVET
	; dbw 1, COPYCAT
	dbw 10, QUICK_ATTACK
	; dbw 15, BABY_DOLL_EYES
	dbw 16, PURSUIT ; REMOVE
	dbw 20, CONFUSE_RAY
	; dbw 25, ASSURANCE
	dbw 25, FAINT_ATTACK ; REMOVE
	dbw 30, MOONLIGHT
	; dbw 35, GUARD_SWAP
	; dbw 40, DARK_PULSE
	dbw 50, MEAN_LOOK
	dbw 55, SCREECH
	db 0 ; no more level-up moves

MurkrowEvosAttacks:
	dbbw EVOLVE_ITEM, MOON_STONE, HONCHKROW
	dbw 1, PECK
	dbw 11, PURSUIT
	dbw 16, HAZE
	dbw 26, NIGHT_SHADE
	dbw 31, FAINT_ATTACK
	dbw 41, MEAN_LOOK
	db 0 ; no more level-up moves

SlowkingEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CURSE
	dbw 1, TACKLE
	dbw 6, GROWL
	dbw 15, WATER_GUN
	dbw 20, CONFUSION
	dbw 29, DISABLE
	dbw 34, HEADBUTT
	dbw 43, SWAGGER
	dbw 48, PSYCHIC_M
	db 0 ; no more level-up moves

MisdreavusEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, PSYWAVE
	dbw 6, SPITE
	dbw 12, CONFUSE_RAY
	dbw 19, MEAN_LOOK
	dbw 27, PSYBEAM
	dbw 36, PAIN_SPLIT
	dbw 46, PERISH_SONG
	db 0 ; no more level-up moves

UnownEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HIDDEN_POWER
	db 0 ; no more level-up moves

WobbuffetEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, COUNTER
	dbw 1, MIRROR_COAT
	dbw 1, SAFEGUARD
	dbw 1, DESTINY_BOND
	db 0 ; no more level-up moves

GirafarigEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, CONFUSION
	dbw 1, STOMP
	dbw 7, CONFUSION
	dbw 13, STOMP
	dbw 20, AGILITY
	dbw 30, BATON_PASS
	dbw 41, PSYBEAM
	dbw 54, CRUNCH
	db 0 ; no more level-up moves

PinecoEvosAttacks:
	dbbw EVOLVE_LEVEL, 31, FORRETRESS
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, PROTECT
	dbw 8, SELFDESTRUCT
	dbw 15, TAKE_DOWN
	dbw 22, RAPID_SPIN
	dbw 29, BIDE
	dbw 36, EXPLOSION
	dbw 43, SPIKES
	dbw 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

ForretressEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, PROTECT
	dbw 1, SELFDESTRUCT
	dbw 8, SELFDESTRUCT
	dbw 15, TAKE_DOWN
	dbw 22, RAPID_SPIN
	dbw 29, BIDE
	dbw 39, EXPLOSION
	dbw 49, SPIKES
	dbw 59, DOUBLE_EDGE
	db 0 ; no more level-up moves

DunsparceEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, RAGE
	dbw 5, DEFENSE_CURL
	dbw 13, GLARE
	dbw 18, SPITE
	dbw 26, PURSUIT
	dbw 30, SCREECH
	dbw 38, TAKE_DOWN
	db 0 ; no more level-up moves

GligarEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 6, SAND_ATTACK
	dbw 13, HARDEN
	dbw 20, QUICK_ATTACK
	dbw 28, FAINT_ATTACK
	dbw 36, SLASH
	dbw 44, SCREECH
	dbw 52, GUILLOTINE
	db 0 ; no more level-up moves

SteelixEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SCREECH
	dbw 10, BIND
	dbw 14, ROCK_THROW
	dbw 23, HARDEN
	dbw 27, RAGE
	dbw 36, SANDSTORM
	dbw 40, SLAM
	dbw 49, CRUNCH
	db 0 ; no more level-up moves

SnubbullEvosAttacks:
	dbbw EVOLVE_LEVEL, 23, GRANBULL
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SCARY_FACE
	dbw 4, TAIL_WHIP
	dbw 8, CHARM
	dbw 13, BITE
	dbw 19, LICK
	dbw 26, ROAR
	dbw 34, RAGE
	dbw 43, TAKE_DOWN
	db 0 ; no more level-up moves

GranbullEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SCARY_FACE
	dbw 4, TAIL_WHIP
	dbw 8, CHARM
	dbw 13, BITE
	dbw 19, LICK
	dbw 28, ROAR
	dbw 38, RAGE
	dbw 51, TAKE_DOWN
	db 0 ; no more level-up moves

QwilfishEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SPIKES
	dbw 1, TACKLE
	dbw 1, POISON_STING
	dbw 10, HARDEN
	dbw 10, MINIMIZE
	dbw 19, WATER_GUN
	dbw 28, PIN_MISSILE
	dbw 37, TAKE_DOWN
	dbw 46, HYDRO_PUMP
	db 0 ; no more level-up moves

ScizorEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, QUICK_ATTACK
	dbw 1, LEER
	dbw 6, FOCUS_ENERGY
	dbw 12, PURSUIT
	dbw 18, FALSE_SWIPE
	dbw 24, AGILITY
	dbw 30, METAL_CLAW
	dbw 36, SLASH
	dbw 42, SWORDS_DANCE
	dbw 48, DOUBLE_TEAM
	db 0 ; no more level-up moves

ShuckleEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONSTRICT
	dbw 1, WITHDRAW
	dbw 9, WRAP
	dbw 14, ENCORE
	dbw 23, SAFEGUARD
	dbw 28, BIDE
	dbw 37, REST
	db 0 ; no more level-up moves

HeracrossEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 6, HORN_ATTACK
	dbw 12, ENDURE
	dbw 19, FURY_ATTACK
	dbw 27, COUNTER
	dbw 35, TAKE_DOWN
	dbw 44, REVERSAL
	dbw 54, MEGAHORN
	db 0 ; no more level-up moves

SneaselEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 9, QUICK_ATTACK
	dbw 17, SCREECH
	dbw 25, FAINT_ATTACK
	dbw 33, FURY_SWIPES
	dbw 41, AGILITY
	dbw 49, SLASH
	dbw 57, BEAT_UP
	dbw 65, METAL_CLAW
	db 0 ; no more level-up moves

TeddiursaEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, URSARING
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 8, LICK
	dbw 15, FURY_SWIPES
	dbw 22, FAINT_ATTACK
	dbw 29, REST
	dbw 36, SLASH
	dbw 43, SNORE
	dbw 50, THRASH
	db 0 ; no more level-up moves

UrsaringEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 1, LICK
	dbw 1, FURY_SWIPES
	dbw 8, LICK
	dbw 15, FURY_SWIPES
	dbw 22, FAINT_ATTACK
	dbw 29, REST
	dbw 39, SLASH
	dbw 49, SNORE
	dbw 59, THRASH
	db 0 ; no more level-up moves

SlugmaEvosAttacks:
	dbbw EVOLVE_LEVEL, 38, MAGCARGO
	db 0 ; no more evolutions
	dbw 1, SMOG
	dbw 8, EMBER
	dbw 15, ROCK_THROW
	dbw 22, HARDEN
	dbw 29, AMNESIA
	dbw 36, FLAMETHROWER
	dbw 43, ROCK_SLIDE
	dbw 50, BODY_SLAM
	db 0 ; no more level-up moves

MagcargoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SMOG
	dbw 1, EMBER
	dbw 1, ROCK_THROW
	dbw 8, EMBER
	dbw 15, ROCK_THROW
	dbw 22, HARDEN
	dbw 29, AMNESIA
	dbw 36, FLAMETHROWER
	dbw 48, ROCK_SLIDE
	dbw 60, BODY_SLAM
	db 0 ; no more level-up moves

SwinubEvosAttacks:
	dbbw EVOLVE_LEVEL, 33, PILOSWINE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 10, POWDER_SNOW
	dbw 19, ENDURE
	dbw 28, TAKE_DOWN
	dbw 37, MIST
	dbw 46, BLIZZARD
	dbw 55, AMNESIA
	db 0 ; no more level-up moves

PiloswineEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HORN_ATTACK
	dbw 1, POWDER_SNOW
	dbw 1, ENDURE
	dbw 10, POWDER_SNOW
	dbw 19, ENDURE
	dbw 28, TAKE_DOWN
	dbw 33, FURY_ATTACK
	dbw 42, MIST
	dbw 56, BLIZZARD
	dbw 70, AMNESIA
	db 0 ; no more level-up moves

CorsolaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 7, HARDEN
	dbw 13, BUBBLE
	dbw 19, RECOVER
	dbw 25, BUBBLEBEAM
	dbw 31, SPIKE_CANNON
	dbw 37, MIRROR_COAT
	dbw 43, ANCIENTPOWER
	db 0 ; no more level-up moves

RemoraidEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, OCTILLERY
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 11, LOCK_ON
	dbw 22, PSYBEAM
	dbw 22, AURORA_BEAM
	dbw 22, BUBBLEBEAM
	dbw 33, FOCUS_ENERGY
	dbw 44, ICE_BEAM
	dbw 55, HYPER_BEAM
	db 0 ; no more level-up moves

OctilleryEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 11, CONSTRICT
	dbw 22, PSYBEAM
	dbw 22, AURORA_BEAM
	dbw 22, BUBBLEBEAM
	dbw 25, OCTAZOOKA
	dbw 38, FOCUS_ENERGY
	dbw 54, ICE_BEAM
	dbw 70, HYPER_BEAM
	db 0 ; no more level-up moves

DelibirdEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PRESENT
	db 0 ; no more level-up moves

MantineEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, BUBBLE
	dbw 10, SUPERSONIC
	dbw 18, BUBBLEBEAM
	dbw 25, TAKE_DOWN
	dbw 32, AGILITY
	dbw 40, WING_ATTACK
	dbw 49, CONFUSE_RAY
	db 0 ; no more level-up moves

SkarmoryEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, PECK
	dbw 13, SAND_ATTACK
	dbw 19, SWIFT
	dbw 25, AGILITY
	dbw 37, FURY_ATTACK
	dbw 49, STEEL_WING
	db 0 ; no more level-up moves

HoundourEvosAttacks:
	dbbw EVOLVE_LEVEL, 24, HOUNDOOM
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, EMBER
	dbw 7, ROAR
	dbw 13, SMOG
	dbw 20, BITE
	dbw 27, FAINT_ATTACK
	dbw 35, FLAMETHROWER
	dbw 43, CRUNCH
	db 0 ; no more level-up moves

HoundoomEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, EMBER
	dbw 7, ROAR
	dbw 13, SMOG
	dbw 20, BITE
	dbw 30, FAINT_ATTACK
	dbw 41, FLAMETHROWER
	dbw 52, CRUNCH
	db 0 ; no more level-up moves

KingdraEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, SMOKESCREEN
	dbw 1, LEER
	dbw 1, WATER_GUN
	dbw 8, SMOKESCREEN
	dbw 15, LEER
	dbw 22, WATER_GUN
	dbw 29, TWISTER
	dbw 40, AGILITY
	dbw 51, HYDRO_PUMP
	db 0 ; no more level-up moves

PhanpyEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, DONPHAN
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 9, DEFENSE_CURL
	dbw 17, FLAIL
	dbw 25, TAKE_DOWN
	dbw 33, ROLLOUT
	dbw 41, ENDURE
	dbw 49, DOUBLE_EDGE
	db 0 ; no more level-up moves

DonphanEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HORN_ATTACK
	dbw 1, GROWL
	dbw 9, DEFENSE_CURL
	dbw 17, FLAIL
	dbw 25, FURY_ATTACK
	dbw 33, ROLLOUT
	dbw 41, RAPID_SPIN
	dbw 49, EARTHQUAKE
	db 0 ; no more level-up moves

Porygon2EvosAttacks:
	dbbw EVOLVE_ITEM, DUBIOUS_DISC, PORYGONZ
	dbw 1, CONVERSION2
	dbw 1, TACKLE
	dbw 1, CONVERSION
	dbw 9, AGILITY
	dbw 12, PSYBEAM
	dbw 20, RECOVER
	dbw 24, DEFENSE_CURL
	dbw 32, LOCK_ON
	dbw 36, TRI_ATTACK
	dbw 44, ZAP_CANNON
	db 0 ; no more level-up moves

StantlerEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 8, LEER
	dbw 15, HYPNOSIS
	dbw 23, STOMP
	dbw 31, SAND_ATTACK
	dbw 40, TAKE_DOWN
	dbw 49, CONFUSE_RAY
	db 0 ; no more level-up moves

SmeargleEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SKETCH
	dbw 11, SKETCH
	dbw 21, SKETCH
	dbw 31, SKETCH
	dbw 41, SKETCH
	dbw 51, SKETCH
	dbw 61, SKETCH
	dbw 71, SKETCH
	dbw 81, SKETCH
	dbw 91, SKETCH
	db 0 ; no more level-up moves

TyrogueEvosAttacks:
	dbbbw EVOLVE_STAT, 20, ATK_LT_DEF, HITMONCHAN
	dbbbw EVOLVE_STAT, 20, ATK_GT_DEF, HITMONLEE
	dbbbw EVOLVE_STAT, 20, ATK_EQ_DEF, HITMONTOP
	db 0 ; no more evolutions
	dbw 1, TACKLE
	db 0 ; no more level-up moves

HitmontopEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ROLLING_KICK
	dbw 7, FOCUS_ENERGY
	dbw 13, PURSUIT
	dbw 19, QUICK_ATTACK
	dbw 25, RAPID_SPIN
	dbw 31, COUNTER
	dbw 37, AGILITY
	dbw 43, DETECT
	dbw 49, TRIPLE_KICK
	db 0 ; no more level-up moves

SmoochumEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, JYNX
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, LICK
	dbw 9, SWEET_KISS
	dbw 13, POWDER_SNOW
	dbw 21, CONFUSION
	dbw 25, SING
	dbw 33, MEAN_LOOK
	dbw 37, PSYCHIC_M
	dbw 45, PERISH_SONG
	dbw 49, BLIZZARD
	db 0 ; no more level-up moves

ElekidEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, ELECTABUZZ
	db 0 ; no more evolutions
	dbw 1, QUICK_ATTACK
	dbw 1, LEER
	dbw 9, THUNDERPUNCH
	dbw 17, LIGHT_SCREEN
	dbw 25, SWIFT
	dbw 33, SCREECH
	dbw 41, THUNDERBOLT
	dbw 49, THUNDER
	db 0 ; no more level-up moves

MagbyEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, MAGMAR
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 7, LEER
	dbw 13, SMOG
	dbw 19, FIRE_PUNCH
	dbw 25, SMOKESCREEN
	dbw 31, SUNNY_DAY
	dbw 37, FLAMETHROWER
	dbw 43, CONFUSE_RAY
	dbw 49, FIRE_BLAST
	db 0 ; no more level-up moves

MiltankEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 4, GROWL
	dbw 8, DEFENSE_CURL
	dbw 13, STOMP
	dbw 19, MILK_DRINK
	dbw 26, BIDE
	dbw 34, ROLLOUT
	dbw 43, BODY_SLAM
	dbw 53, HEAL_BELL
	db 0 ; no more level-up moves

BlisseyEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 4, GROWL
	dbw 7, TAIL_WHIP
	dbw 10, SOFTBOILED
	dbw 13, DOUBLESLAP
	dbw 18, MINIMIZE
	dbw 23, SING
	dbw 28, EGG_BOMB
	dbw 33, DEFENSE_CURL
	dbw 40, LIGHT_SCREEN
	dbw 47, DOUBLE_EDGE
	db 0 ; no more level-up moves

RaikouEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, LEER
	dbw 11, THUNDERSHOCK
	dbw 21, ROAR
	dbw 31, QUICK_ATTACK
	dbw 41, SPARK
	dbw 51, REFLECT
	dbw 61, CRUNCH
	dbw 71, THUNDER
	db 0 ; no more level-up moves

EnteiEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, LEER
	dbw 11, EMBER
	dbw 21, ROAR
	dbw 31, FIRE_SPIN
	dbw 41, STOMP
	dbw 51, FLAMETHROWER
	dbw 61, SWAGGER
	dbw 71, FIRE_BLAST
	db 0 ; no more level-up moves

SuicuneEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, LEER
	dbw 11, BUBBLEBEAM
	dbw 21, RAIN_DANCE
	dbw 31, GUST
	dbw 41, AURORA_BEAM
	dbw 51, MIST
	dbw 61, MIRROR_COAT
	dbw 71, HYDRO_PUMP
	db 0 ; no more level-up moves

LarvitarEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, PUPITAR
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, LEER
	dbw 8, SANDSTORM
	dbw 15, SCREECH
	dbw 22, ROCK_SLIDE
	dbw 29, THRASH
	dbw 36, SCARY_FACE
	dbw 43, CRUNCH
	dbw 50, EARTHQUAKE
	dbw 57, HYPER_BEAM
	db 0 ; no more level-up moves

PupitarEvosAttacks:
	dbbw EVOLVE_LEVEL, 55, TYRANITAR
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, LEER
	dbw 1, SANDSTORM
	dbw 1, SCREECH
	dbw 8, SANDSTORM
	dbw 15, SCREECH
	dbw 22, ROCK_SLIDE
	dbw 29, THRASH
	dbw 38, SCARY_FACE
	dbw 47, CRUNCH
	dbw 56, EARTHQUAKE
	dbw 65, HYPER_BEAM
	db 0 ; no more level-up moves

TyranitarEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, LEER
	dbw 1, SANDSTORM
	dbw 1, SCREECH
	dbw 8, SANDSTORM
	dbw 15, SCREECH
	dbw 22, ROCK_SLIDE
	dbw 29, THRASH
	dbw 38, SCARY_FACE
	dbw 47, CRUNCH
	dbw 61, EARTHQUAKE
	dbw 75, HYPER_BEAM
	db 0 ; no more level-up moves

LugiaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, AEROBLAST
	dbw 11, SAFEGUARD
	dbw 22, GUST
	dbw 33, RECOVER
	dbw 44, HYDRO_PUMP
	dbw 55, RAIN_DANCE
	dbw 66, SWIFT
	dbw 77, WHIRLWIND
	dbw 88, ANCIENTPOWER
	dbw 99, FUTURE_SIGHT
	db 0 ; no more level-up moves

HoOhEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SACRED_FIRE
	dbw 11, SAFEGUARD
	dbw 22, GUST
	dbw 33, RECOVER
	dbw 44, FIRE_BLAST
	dbw 55, SUNNY_DAY
	dbw 66, SWIFT
	dbw 77, WHIRLWIND
	dbw 88, ANCIENTPOWER
	dbw 99, FUTURE_SIGHT
	db 0 ; no more level-up moves

CelebiEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEECH_SEED
	dbw 1, CONFUSION
	dbw 1, RECOVER
	dbw 1, HEAL_BELL
	dbw 10, SAFEGUARD
	dbw 20, ANCIENTPOWER
	dbw 30, FUTURE_SIGHT
	dbw 40, BATON_PASS
	dbw 50, PERISH_SONG
	db 0 ; no more level-up moves

ArceusEvosAttacks:
	db 0 ; na
	dbw 1, TACKLE
	dbw 1, HYPER_BEAM
	db 0 ; no more moves.

SylveonEvosAttacks:
	db 0 ; na
	dbw 1, TACKLE
	db 0 ; no more moves.

TogekissEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, CHARM
	dbw 7, METRONOME
	dbw 18, SWEET_KISS
	dbw 25, ENCORE
	dbw 31, SAFEGUARD
	dbw 38, DOUBLE_EDGE
	db 0 ; no more level-up moves

AzurillEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, MARILL
	db 0 ; no more evolutions
	dbw 1, SING
	dbw 1, CHARM
	dbw 4, DEFENSE_CURL
	dbw 9, POUND
	dbw 14, BUBBLE
	db 0 ; no more level-up moves

PorygonZEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONVERSION2
	dbw 1, TACKLE
	dbw 1, CONVERSION
	dbw 9, AGILITY
	dbw 12, PSYBEAM
	dbw 20, RECOVER
	dbw 24, DEFENSE_CURL
	dbw 32, LOCK_ON
	dbw 36, TRI_ATTACK
	dbw 44, ZAP_CANNON
	db 0 ; no more level-up moves
	
HonchkrowEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 11, PURSUIT
	dbw 16, HAZE
	dbw 26, NIGHT_SHADE
	dbw 31, FAINT_ATTACK
	dbw 41, MEAN_LOOK
	db 0 ; no more level-up moves
