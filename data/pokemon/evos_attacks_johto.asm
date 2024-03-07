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
	dbw 1, LEER
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
	dbw 1, ASTONISH
	dbw 1, MEAN_LOOK
	dbw 1, TOXIC
	dbw 1, SCREECH
	dbw 1, ABSORB
	dbw 1, SUPERSONIC
	dbw 15, POISON_FANG
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
	dbw 8, ASTONISH
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
	dbw 40, DARK_PULSE
	dbw 50, MEAN_LOOK
	dbw 55, SCREECH
	db 0 ; no more level-up moves

MurkrowEvosAttacks:
	dbbw EVOLVE_ITEM, MOON_STONE, HONCHKROW
	dbw 1, PECK
	dbw 1, ASTONISH
	dbw 5, GUST
	dbw 8, PURSUIT ; REMOVE
	dbw 11, HAZE
	dbw 15, WING_ATTACK
	dbw 21, NIGHT_SHADE
	; dbw 25, ASSURANCE
	; dbw 31, TAUNT
	dbw 31, FAINT_ATTACK ; REMOVE
	dbw 35, MEAN_LOOK
	; dbw 40, FOUL_PLAY
	; dbw 50, SUCKER_PUNCH
	; dbw 55, TORMENT
	; dbw 60, QUASH
	db 0 ; no more level-up moves

SlowkingEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CURSE
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, WATER_GUN
	; dbw 1, POWER_GEM
	; dbw 1, NASTY_PLOT
	; dbw 1, SWAGGER
	; dbw 9, YAWN
	dbw 12, CONFUSION
	dbw 15, DISABLE
	; dbw 18, WATER_PULSE
	dbw 21, HEADBUTT
	dbw 27, AMNESIA
	dbw 30, SURF
	; dbw 33, SLACK_OFF
	dbw 36, PSYCHIC_M
	dbw 39, PSYCH_UP
	dbw 42, RAIN_DANCE
	; dbw 45, HEAL_PULSE
	db 0 ; no more level-up moves

MisdreavusEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, CONFUSION
	dbw 6, SPITE ; REMOVE
	dbw 10, ASTONISH
	dbw 14, CONFUSE_RAY
	dbw 19, MEAN_LOOK
	; dbw 23, HEX
	dbw 28, PSYBEAM
	dbw 32, PAIN_SPLIT
	; dbw 37, PAYBACK
	; dbw 41, SHADOW_BALL
	dbw 46, PERISH_SONG
	; ldbw 50, POWER_GEM
	db 0 ; no more level-up moves

UnownEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HIDDEN_POWER
	db 0 ; no more level-up moves

WobbuffetEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, COUNTER ; EVOMOVE
	dbw 1, MIRROR_COAT ; EVOMOVE
	dbw 1, SAFEGUARD ; EVOMOVE
	dbw 1, DESTINY_BOND ; EVOMOVE
	dbw 1, AMNESIA
	dbw 1, SPLASH
	dbw 1, CHARM
	dbw 1, ENCORE
	db 0 ; no more level-up moves

GirafarigEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, ASTONISH
	; dbw 1, POWER_SWAP
	; dbw 1, GUARD_SWAP
	dbw 5, CONFUSION
	; dbw 10, ASSURANCE
	dbw 14, STOMP
	dbw 19, PSYBEAM
	dbw 23, AGILITY
	; dbw 28, DOUBLE_HIT
	; dbw 32, TWIN_BEAM
	dbw 37, CRUNCH
	dbw 41, BATON_PASS
	; dbw 46, NASTY_PLOT
	dbw 50, PSYCHIC_M
	db 0 ; no more level-up moves

PinecoEvosAttacks:
	dbbw EVOLVE_LEVEL, 31, FORRETRESS
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, PROTECT
	dbw 6, SELFDESTRUCT
	; dbw 9, BUG_BITE
	dbw 12, TAKE_DOWN
	dbw 17, RAPID_SPIN
	dbw 20, ROLLOUT
	dbw 23, CURSE
	dbw 28, SPIKES
	dbw 31, BIDE ; REMOVE
	; dbw 31, PAYBACK
	dbw 34, EXPLOSION
	; dbw 39, IRON_DEFENSE
	; dbw 42, GYRO_BALL
	dbw 45, DOUBLE_EDGE
	db 0 ; no more level-up moves

ForretressEvosAttacks:
	db 0 ; no more evolutions
	; dbw 1, HEAVY_SLAM ; EVOMOVE
	; dbw 1, MAGNET_RISE
	; dbw 1, TOXIC_SPIKES
	; dbw 1, BUG_BITE
	dbw 1, TACKLE
	dbw 1, PROTECT
	dbw 1, SELFDESTRUCT
	dbw 1, ZAP_CANNON
	dbw 12, TAKE_DOWN
	dbw 17, RAPID_SPIN
	dbw 20, ROLLOUT
	dbw 23, CURSE
	dbw 28, SPIKES
	dbw 32, BIDE
	; dbw 32, PAYBACK
	dbw 36, EXPLOSION
	; dbw 42, IRON_DEFENSE
	; dbw 46, GYRO_BALL
	dbw 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

DunsparceEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, RAGE ; REMOVE
	dbw 1, DEFENSE_CURL
	dbw 1, FLAIL
	dbw 4, MUD_SLAP
	dbw 8, ROLLOUT	
	dbw 12, GLARE
	dbw 16, SCREECH
	dbw 20, ANCIENTPOWER
	; dbw 24, DRILL_RUN
	; dbw 28, YAWN
	; dbw 32, HYPER_DRILL
	; dbw 26, ROOST
	; dbw 40, DRAGON_RUSH
	; dbw 44, COIL
	; dbw 52, ENDEAVOR
	dbw 26, PURSUIT ; REMOVE
	dbw 32, TAKE_DOWN ; REMOVE
	dbw 40, DOUBLE_EDGE
	db 0 ; no more level-up moves

GligarEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 4, SAND_ATTACK
	dbw 7, HARDEN
	dbw 13, QUICK_ATTACK
	; dbw 16, FURY_CUTTER
	; dbw 19, POISON_TAIL
	; dbw 22, ACROBATICS
	dbw 27, SLASH
	dbw 28, FAINT_ATTACK ; REMOVE
	; dbw 30, U_TURN
	dbw 30, SCREECH
	dbw 40, X_SCISSOR
	dbw 45, CRABHAMMER
	dbw 48, SWORDS_DANCE
	dbw 52, GUILLOTINE ; REMOVE
	db 0 ; no more level-up moves

SteelixEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CRUNCH
	dbw 1, THUNDER_FANG
	dbw 1, FIRE_FANG
	dbw 1, ICE_FANG
	dbw 1, TACKLE
	; dbw 1, ROCK_POLISH
	dbw 1, BIND
	dbw 1, ROCK_THROW
	; dbw 4, SMACK_DOWN
	; dbw 8, AUTOTOMIZE
	dbw 12, DRAGONBREATH
	dbw 16, CURSE
	; dbw 20, ROCK_SLIDE
	dbw 24, SCREECH
	dbw 27, RAGE ; REMOVE
	; dbw 28, SAND_TOMB
	; dbw 32, STEALTH_ROCK
	dbw 36, SLAM
	dbw 40, SANDSTORM
	dbw 44, DIG
	; dbw 48, IRON_TAIL
	; dbw 52, STONE_EDGE
	dbw 56, DOUBLE_EDGE
	; dbw 60, MAGNET_RISE
	db 0 ; no more level-up moves

SnubbullEvosAttacks:
	dbbw EVOLVE_LEVEL, 23, GRANBULL
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, THUNDER_FANG
	dbw 1, SCARY_FACE
	dbw 1, ICE_FANG
	dbw 1, TAIL_WHIP
	dbw 1, FIRE_FANG
	dbw 1, CHARM
	dbw 7, BITE
	dbw 13, LICK
	dbw 19, HEADBUTT
	dbw 25, ROAR
	; dbw 31, LAST_RESORT
	dbw 34, RAGE ; REMOVE
	dbw 37, PLAY_ROUGH
	; dbw 43, PAYBACK
	dbw 43, CRUNCH ; 49
	db 0 ; no more level-up moves

GranbullEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, THUNDER_FANG
	dbw 1, SCARY_FACE
	dbw 1, ICE_FANG
	dbw 1, TAIL_WHIP
	dbw 1, FIRE_FANG
	dbw 1, CHARM
	dbw 7, BITE
	dbw 13, LICK
	dbw 19, HEADBUTT
	dbw 27, ROAR
	; dbw 35, LAST_RESORT
	dbw 34, RAGE ; REMOVE
	dbw 43, PLAY_ROUGH
	; dbw 51, PAYBACK
	dbw 51, CRUNCH ; 59
	db 0 ; no more level-up moves

QwilfishEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, POISON_STING
	dbw 4, HARDEN
	dbw 8, WATER_GUN
	; dbw 12, FELL_STINGER
	dbw 16, MINIMIZE
	dbw 20, SPIKES
	; dbw 24, BRINE
	; dbw 28, POISON_JAB
	dbw 32, PIN_MISSILE
	; dbw 36, TOXIC_SPIKES
	dbw 37, TAKE_DOWN
	; dbw 40, STOCKPILE
	; dbw 40, SPIT_UP
	dbw 44, TOXIC
	dbw 48, AQUA_TAIL
	; dbw 52, ACCUPRESSURE
	dbw 56, DESTINY_BOND
	db 0 ; no more level-up moves

ScizorEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, FALSE_SWIPE
	dbw 1, QUICK_ATTACK
	dbw 1, LEER
	dbw 1, WING_ATTACK
	dbw 1, AGILITY
	; dbw 1, AIR_SLASH
	; dbw 1, FURY_CUTTER
	dbw 10, PURSUIT ; REMOVE
	dbw 12, METAL_CLAW
	dbw 16, DOUBLE_TEAM
	; dbw 20, DOUBLE_HIT
	dbw 24, SLASH
	dbw 28, FOCUS_ENERGY
	; dbw 32, IRON_DEFENSE
	; dbw 36, IRON_HEAD	
	dbw 40, X_SCISSOR
	dbw 44, SWORDS_DANCE
	db 0 ; no more level-up moves

ShuckleEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONSTRICT ; REMOVE
	dbw 1, WRAP
	dbw 5, ROLLOUT
	; dbw 10, STRUGGLE_BUG
	dbw 14, ENCORE
	dbw 15, ROCK_THROW
	dbw 20, SAFEGUARD
	dbw 25, REST
	dbw 28, BIDE ; REMOVE
	; dbw 30, BUG_BITE
	; dbw 35, POWER_SPLIT
	; dbw 35, GUARD_SPLIT
	dbw 40, ROCK_SLIDE
	; dbw 45, GASTRO_ACID
	; dbw 50, STICKY_WEB
	; dbw 55, POWER_TRICK
	; dbw 60, STONE_EDGE
	; dbw 65, SHELL_SMASH
	db 0 ; no more level-up moves

HeracrossEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 5, FURY_ATTACK
	dbw 10, ENDURE
	; dbw 15, AERIAL_ACE
	dbw 15, HORN_ATTACK ; 20
	dbw 25, COUNTER
	dbw 30, REVERSAL ; REMOVE
	; dbw 30, BRICK_BREAK
	dbw 35, PIN_MISSILE
	; dbw 40, THROAT_CHOP
	dbw 42, THRASH
	dbw 50, SWORDS_DANCE
	dbw 55, MEGAHORN
	; dbw 60, CLOSE_COMBAT
	db 0 ; no more level-up moves

SneaselEvosAttacks:
	dbbw EVOLVE_ITEM, LINK_CABLE, WEAVILE
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	; dbw 6, TAUNT
	dbw 12, QUICK_ATTACK
	dbw 18, METAL_CLAW
	dbw 24, ICY_WIND
	dbw 25, FAINT_ATTACK ; REMOVE
	dbw 30, FURY_SWIPES
	; dbw 36, HONE_CLAW
	dbw 42, BEAT_UP
	dbw 48, AGILITY
	dbw 54, SCREECH
	dbw 49, SLASH
	db 0 ; no more level-up moves

TeddiursaEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, URSARING
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LICK
	; dbw 1, BABY_DOLL_EYES
	; dbw 1, FLING
	; dbw 1, COVET
	dbw 8, FURY_SWIPES
	; dbw 13, PAYBACK
	dbw 14, SWEET_SCENT
	dbw 17, FAINT_ATTACK ; REMOVE
	dbw 22, SLASH
	; dbw 25, PLAY_NICE
	dbw 29, PLAY_ROUGH
	dbw 33, CHARM
	dbw 37, REST
	dbw 37, SNORE
	dbw 41, THRASH
	db 0 ; no more level-up moves

UrsaringEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LICK
	; dbw 1, FAKE_TEARS
	; dbw 1, COVET
	dbw 8, FURY_SWIPES
	; dbw 13, PAYBACK
	dbw 14, SWEET_SCENT ; 17
	dbw 17, FAINT_ATTACK ; REMOVE
	dbw 22, SLASH
	; dbw 25, PLAY_NICE
	dbw 29, PLAY_ROUGH
	dbw 35, SCARY_FACE
	dbw 41, REST
	dbw 41, SNORE
	; dbw 48, HIGH_HORSEPOWER
	dbw 56, THRASH
	; dbw 64, HAMMER_ARM
	db 0 ; no more level-up moves

SlugmaEvosAttacks:
	dbbw EVOLVE_LEVEL, 38, MAGCARGO
	db 0 ; no more evolutions
	dbw 1, SMOG
	; dbw 1, YAWN
	dbw 6, EMBER
	dbw 8, ROCK_THROW
	dbw 13, HARDEN
	; dbw 20, CLEAR_SMOG
	dbw 22, ANCIENTPOWER
	; dbw 27, INCINERATE
	dbw 29, ROCK_SLIDE
	dbw 34, LAVA_PLUME
	dbw 36, AMNESIA
	dbw 41, BODY_SLAM
	dbw 43, RECOVER
	dbw 48, FLAMETHROWER
	; dbw 50, EARTH_POWER
	db 0 ; no more level-up moves

MagcargoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SMOG
	; dbw 1, YAWN
	dbw 1, EMBER
	dbw 1, ROCK_THROW
    ; dbw 1, EARTH_POWER
	dbw 13, HARDEN
	; dbw 20, CLEAR_SMOG
	dbw 22, ANCIENTPOWER
	; dbw 27, INCINERATE
	dbw 29, ROCK_SLIDE
	dbw 34, LAVA_PLUME
	dbw 36, AMNESIA
	dbw 43, BODY_SLAM
	dbw 47, RECOVER
	dbw 54, FLAMETHROWER
	db 0 ; no more level-up moves

SwinubEvosAttacks:
	dbbw EVOLVE_LEVEL, 33, PILOSWINE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, MUD_SLAP
	dbw 5, POWDER_SNOW
	dbw 10, FLAIL
	dbw 15, ICE_SHARD
	dbw 20, MIST
	dbw 25, ENDURE
	dbw 30, ICY_WIND
	dbw 35, AMNESIA
	dbw 40, TAKE_DOWN
	dbw 45, EARTHQUAKE
	dbw 50, BLIZZARD
	db 0 ; no more level-up moves

PiloswineEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, MAMOSWINE
	db 0 ; no more evolutions
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

CorsolaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, HARDEN
	dbw 5, WATER_GUN
	; dbw 10, AQUA_RING
	dbw 15, ENDURE
	dbw 20, ANCIENTPOWER
	dbw 25, BUBBLEBEAM
	dbw 30, FLAIL
	; dbw 35, LIFE_DEW
	dbw 35, SPIKE_CANNON ; REMOVE
	; dbw 40, POWER_GEM
	; dbw 45, EARTH_POWER
	dbw 50, RECOVER
	dbw 55, MIRROR_COAT
	db 0 ; no more level-up moves

RemoraidEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, OCTILLERY
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	; dbw 1, HELPING_HAND
	; dbw 4, WATER_PULSE
	dbw 8, FOCUS_ENERGY
	dbw 12, PSYBEAM
	dbw 16, AURORA_BEAM
	dbw 20, BUBBLEBEAM
	dbw 24, LOCK_ON
	; dbw 28, BULLET_SEED
	dbw 32, ICE_BEAM
	dbw 36, HYDRO_PUMP
	; dbw 40, SOAK
	dbw 44, HYPER_BEAM
	db 0 ; no more level-up moves

OctilleryEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, OCTAZOOKA ; EVOMOVE
	; dbw 1, GUNK_SHOT
	; dbw 1, ROCK_BLAST
	dbw 1, WATER_GUN
	; dbw 1, HELPING_HAND
	; dbw 1, WATER_PULSE
	dbw 1, WRAP
	dbw 1, FOCUS_ENERGY
	dbw 12, PSYBEAM
	dbw 16, AURORA_BEAM
	dbw 20, BUBBLEBEAM
	dbw 24, LOCK_ON
	; dbw 30, BULLET_SEED
	dbw 36, ICE_BEAM
	dbw 42, HYDRO_PUMP
	; dbw 48, SOAK
	dbw 54, HYPER_BEAM
	db 0 ; no more level-up moves

DelibirdEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PRESENT
	dbw 25, DRILL_PECK
	db 0 ; no more level-up moves

MantineEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PSYBEAM
	; dbw 1, BULLET_SEED
	; dbw 1, ROOST
	dbw 1, TACKLE
	dbw 1, WATER_GUN
	dbw 1, SUPERSONIC
	dbw 1, WING_ATTACK
	; dbw 12, WATER_PULSE
	; dbw 16, WIDE_GUARD
	dbw 20, AGILITY	
	dbw 24, BUBBLEBEAM
	dbw 28, HEADBUTT
	dbw 34, CONFUSE_RAY ;
	; dbw 32, AIR_SLASH
	; dbw 36, AQUA_RING
	; dbw 40, BOUNCE
	dbw 44, HYDRO_PUMP
	db 0 ; no more level-up moves

SkarmoryEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, PECK
	dbw 4, SAND_ATTACK
	dbw 8, FURY_ATTACK
	dbw 12, METAL_CLAW
	dbw 16, AGILITY
	dbw 20, WING_ATTACK
	dbw 24, SLASH
	dbw 28, STEEL_WING
	; dbw 32, PAYBACK
	dbw 36, DRILL_PECK
	; dbw 40, METAL_SOUND
	dbw 44, SPIKES
	; dbw 48, IRON_DEFENSE
	; dbw 52, BRAVE_BIRD
	db 0 ; no more level-up moves

HoundourEvosAttacks:
	dbbw EVOLVE_LEVEL, 24, HOUNDOOM
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, EMBER
	; dbw 4, HOWL
	dbw 8, SMOG
	dbw 13, ROAR
	dbw 16, BITE
	; dbw 20, INCINERATE
	dbw 25, BEAT_UP
	dbw 28, FIRE_FANG
	dbw 34, FAINT_ATTACK ; REMOVE
	; dbw 32, TORMENT
	; dbw 37, COMEUPPANCE
	; dbw 40, FOUL_PLAY
	dbw 44, FLAMETHROWER
	dbw 49, CRUNCH
	; dbw 52, NASTY_PLOT
	dbw 56, INFERNO
	db 0 ; no more level-up moves

HoundoomEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, EMBER
	; dbw 1, HOWL
	dbw 1, SMOG
	; dbw 1, NASTY_PLOT
	dbw 1, THUNDER_FANG
	dbw 13, ROAR
	dbw 16, BITE
	; dbw 20, INCINERATE
	dbw 26, BEAT_UP
	dbw 30, FIRE_FANG
	dbw 35, FAINT_ATTACK ; REMOVE
	; dbw 35, TORMENT
	; dbw 41, COMEUPPANCE
	; dbw 45, FOUL_PLAY
	dbw 50, FLAMETHROWER
	dbw 56, CRUNCH
	dbw 62, INFERNO
	db 0 ; no more level-up moves

KingdraEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SMOKESCREEN
	dbw 1, WHIRLPOOL
	; dbw 1, YAWN
	dbw 1, LEER
	dbw 1, WATER_GUN
	dbw 1, TWISTER
	dbw 15, FOCUS_ENERGY
	dbw 20, DRAGONBREATH
	dbw 25, BUBBLEBEAM
	dbw 30, AGILITY
	; dbw 37, WATER_PULSE
	dbw 44, DRAGON_PULSE
	dbw 51, HYDRO_PUMP
	; dbw 58, DRAGON_DANCE
	dbw 65, RAIN_DANCE
	; dbw 72, WAVE_CRASH
	db 0 ; no more level-up moves

PhanpyEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, DONPHAN
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, DEFENSE_CURL
	dbw 6, FLAIL
	dbw 10, ROLLOUT
	dbw 15, BULLDOZE
	dbw 19, ENDURE
	dbw 24, SLAM
	dbw 28, TAKE_DOWN
	dbw 33, CHARM
	; dbw 37, LAST_RESORT
	dbw 42, DOUBLE_EDGE
	db 0 ; no more level-up moves

DonphanEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, FURY_ATTACK ; EVOMOVE
	dbw 1, FIRE_FANG
	dbw 1, GROWL
	dbw 1, DEFENSE_CURL
	dbw 1, THUNDER_FANG
	dbw 1, BULLDOZE
	dbw 6, RAPID_SPIN
	dbw 10, ROLLOUT
	; dbw 15, ASSURANCE
	; dbw 19, KNOCK_OFF
	dbw 24, SLAM
	; dbw 30, STOMPING_TANTRUM
	dbw 37, SCARY_FACE
	dbw 43, EARTHQUAKE
	; dbw 50, GIGA_IMPACT
	db 0 ; no more level-up moves

Porygon2EvosAttacks:
	dbbw EVOLVE_ITEM, DUBIOUS_DISC, PORYGONZ
	dbw 1, TACKLE
	dbw 1, CONVERSION
	dbw 1, DEFENSE_CURL
	; dbw 1, RECYCLE
	; dbw 1, MAGNET_RISE
	dbw 15, THUNDERSHOCK
	dbw 20, PSYBEAM
	dbw 25, CONVERSION2
	dbw 30, AGILITY
	dbw 35, RECOVER
	; dbw 40, DISCHARGE
	dbw 45, TRI_ATTACK
	dbw 50, LOCK_ON
	dbw 55, ZAP_CANNON
	dbw 60, HYPER_BEAM
	db 0 ; no more level-up moves

StantlerEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 3, LEER
	dbw 7, ASTONISH
	dbw 10, HYPNOSIS
	dbw 13, STOMP
	dbw 16, SAND_ATTACK
	dbw 21, TAKE_DOWN
	dbw 23, CONFUSE_RAY
	; dbw 27, CALM_MIND
	; dbw 32, ROLE_PLAY
	; dbw 37, ZEN_HEADBUTT
	; dbw 49, IMPRISON
	dbw 55, DOUBLE_EDGE
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
	dbw 1, FOCUS_ENERGY
	; dbw 1, FAKE_OUT
	; dbw 1, HELPING_HAND
	db 0 ; no more level-up moves

HitmontopEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TRIPLE_KICK ; EVOMOVE
	; dbw 1, FEINT
	; dbw 1, HELPING_HAND
	; dbw 1, FAKE_OUT
	dbw 1, FOCUS_ENERGY
	dbw 1, ROLLING_KICK
	dbw 4, QUICK_ATTACK
	; dbw 8, GYRO_BALL
	dbw 12, DETECT
	dbw 13, PURSUIT
	dbw 16, RAPID_SPIN
	; dbw 21, WIDE_GUARD
	; dbw 21, QUICK_GUARD
	; dbw 24, SUCKER_PUNCH
	dbw 28, AGILITY
	dbw 32, DIG
	; dbw 36, CLOSE_COMBAT
	dbw 40, COUNTER
	; dbw 44, ENDEAVOR
	db 0 ; no more level-up moves

SmoochumEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, JYNX
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, LICK
	dbw 4, POWDER_SNOW
	; dbw 8, COPYCAT
	dbw 12, CONFUSION
	dbw 20, SING
	; dbw 24, FAKE_TEARS
	dbw 28, ICE_PUNCH
	dbw 32, PSYCHIC_M
	dbw 36, SWEET_KISS
	dbw 36, MEAN_LOOK
	dbw 44, PERISH_SONG
	dbw 48, BLIZZARD
	db 0 ; no more level-up moves

ElekidEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, ELECTABUZZ
	db 0 ; no more evolutions
	dbw 1, QUICK_ATTACK
	dbw 1, LEER
	dbw 4, THUNDERSHOCK
	; dbw 8, CHARGE
	dbw 12, SWIFT
	; dbw 16, SHOCK_WAVE
	dbw 20, THUNDER_WAVE
	dbw 24, SCREECH
	dbw 28, THUNDERPUNCH
	; dbw 32, DISCHARGE
	dbw 36, LOW_KICK
	dbw 40, THUNDERBOLT
	dbw 44, LIGHT_SCREEN
	dbw 49, THUNDER
	db 0 ; no more level-up moves

MagbyEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, MAGMAR
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, SMOG
	dbw 4, EMBER
	dbw 6, SMOKESCREEN
	; dbw 12, CLEAR_SMOG
	dbw 16, FLAME_WHEEL
	dbw 20, CONFUSE_RAY
	dbw 25, SCARY_FACE
	dbw 28, FIRE_PUNCH
	dbw 32, LAVA_PLUME
	dbw 36, LOW_KICK
	dbw 40, FLAMETHROWER
	dbw 44, SUNNY_DAY
	dbw 48, FIRE_BLAST
	db 0 ; no more level-up moves

MiltankEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 5, ROLLOUT
	dbw 10, DEFENSE_CURL
	dbw 15, STOMP
	dbw 20, HEAL_BELL
	dbw 25, HEADBUTT
	dbw 30, BIDE ; REMOVE
	; dbw 30, ZEN_HEADBUTT
	dbw 35, MILK_DRINK
	dbw 40, BODY_SLAM
	dbw 45, PLAY_ROUGH
	dbw 50, CHARM
	; dbw 55, HIGH_HORSEPOWER
	db 0 ; no more level-up moves

BlisseyEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CHARM
	dbw 1, POUND
	; dbw 1, COVET
	; dbw 1, COPYCAT
	; dbw 1, DISARMING_VOICE
	dbw 1, DEFENSE_CURL
	dbw 1, SWEET_KISS
	dbw 4, TAIL_WHIP
	; dbw 8, ECHOED_VOICE
	; dbw 12, LIFE_DEW
	dbw 16, SING
	; dbw 20, FLING
	dbw 24, TAKE_DOWN
	; dbw 28, HEAL_PULSE
	; dbw 32, HELPING_HAND
	dbw 36, LIGHT_SCREEN
	dbw 40, DOUBLE_EDGE
	dbw 44, SOFTBOILED
	; dbw 48, LAST_RESORT
	; dbw 52, HEALING_WISH
	db 0 ; no more level-up moves

RaikouEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, QUICK_ATTACK
	dbw 1, LEER
	dbw 1, EXTREMESPEED
	dbw 1, THUNDERSHOCK
	; dbw 1, CHARGE
	dbw 6, SPARK
	dbw 12, BITE
	; dbw 18, CALM_MIND
	dbw 24, ROAR
	dbw 30, THUNDER_FANG
	; dbw 36, HOWL
	dbw 42, CRUNCH
	; dbw 48, EXTRASENSORY
	; dbw 54, DISCHARGE
	dbw 60, REFLECT
	dbw 66, RAIN_DANCE
	dbw 72, THUNDER
	dbw 78, ZAP_CANNON
	db 0 ; no more level-up moves

EnteiEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, LEER
	dbw 1, STOMP
	dbw 1, SMOKESCREEN
	dbw 6, FLAME_WHEEL
	dbw 12, BITE
	; dbw 18, CALM_MIND
	dbw 24, ROAR
	dbw 30, FIRE_FANG
	dbw 36, SCARY_FACE
	dbw 42, CRUNCH
	; dbw 48, EXTRASENSORY
	dbw 54, LAVA_PLUME
	; dbw 60, SWAGGER
	dbw 66, SUNNY_DAY
	dbw 72, FIRE_BLAST
	; dbw 78, ERUPTION
	db 0 ; no more level-up moves

SuicuneEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GUST
	dbw 1, MIST
	dbw 1, LEER
	dbw 1, WATER_GUN
	; dbw 6, WATER_PULSE
	dbw 12, BITE
	; dbw 18, CALM_MIND
	dbw 24, ROAR
	dbw 30, ICE_FANG
	; dbw 36, TAILWIND
	dbw 42, CRUNCH
	; dbw 48, EXTRASENSORY
	dbw 54, SURF
	dbw 60, MIRROR_COAT
	dbw 66, RAIN_DANCE
	dbw 72, HYDRO_PUMP
	dbw 78, BLIZZARD
	db 0 ; no more level-up moves

LarvitarEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, PUPITAR
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 3, ROCK_THROW
	; dbw 6, PAYBACK
	dbw 9, BITE
	dbw 12, SCARY_FACE
	dbw 15, ROCK_SLIDE
	; dbw 18, STOMPING_TANTRUM
	dbw 21, SCREECH
	; dbw 24, SMACK_DOWN
	dbw 27, CRUNCH
	dbw 29, THRASH
	dbw 31, EARTHQUAKE
	; dbw 33, STONE_EDGE
	dbw 36, THRASH
	dbw 39, SANDSTORM
	dbw 42, HYPER_BEAM
	db 0 ; no more level-up moves

PupitarEvosAttacks:
	dbbw EVOLVE_LEVEL, 55, TYRANITAR
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 1, ROCK_THROW
	; dbw 1, PAYBACK
	dbw 9, BITE
	dbw 12, SCARY_FACE
	dbw 15, ROCK_SLIDE
	; dbw 18, STOMPING_TANTRUM
	dbw 21, SCREECH
	; dbw 24, SMACK_DOWN
	dbw 27, CRUNCH
	dbw 33, EARTHQUAKE
	; dbw 37, STONE_EDGE
	dbw 42, THRASH
	dbw 47, SANDSTORM
	dbw 52, HYPER_BEAM
	db 0 ; no more level-up moves

TyranitarEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, FIRE_FANG
	dbw 1, LEER
	dbw 1, THUNDER_FANG
	dbw 1, ROCK_THROW
	dbw 1, ICE_FANG
	dbw 1, DARK_PULSE
	; dbw 1, IRON_DEFENSE
	; dbw 1, PAYBACK
	dbw 9, BITE
	dbw 12, SCARY_FACE
	dbw 15, ROCK_SLIDE
	; dbw 18, STOMPING_TANTRUM
	dbw 21, SCREECH
	; dbw 24, SMACK_DOWN
	dbw 27, CRUNCH
	dbw 33, EARTHQUAKE
	; dbw 37, STONE_EDGE
	dbw 42, THRASH
	dbw 47, SANDSTORM
	dbw 52, HYPER_BEAM
	; dbw 59, GIGA_IMPACT
	db 0 ; no more level-up moves

LugiaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GUST
	dbw 1, WHIRLWIND
	dbw 1, ANCIENTPOWER
	; dbw 1, WEATHER_BALL
	dbw 9, MIST
	dbw 18, SAFEGUARD
	; dbw 27, CALM_MIND
	; dbw 36, EXTRASENSORY
	dbw 45, RECOVER
	dbw 54, AEROBLAST
	dbw 63, RAIN_DANCE
	dbw 72, HYDRO_PUMP
	dbw 81, FUTURE_SIGHT
	dbw 90, SKY_ATTACK
	db 0 ; no more level-up moves

HoOhEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GUST
	dbw 1, WHIRLWIND
	dbw 1, ANCIENTPOWER
	; dbw 1, WEATHER_BALL
	; dbw 9, LIFE_DEW
	dbw 18, SAFEGUARD
	; dbw 27, CALM_MIND
	; dbw 36, EXTRASENSORY
	dbw 45, RECOVER
	dbw 54, SACRED_FIRE
	dbw 63, SUNNY_DAY
	dbw 72, FIRE_BLAST
	dbw 81, FUTURE_SIGHT
	dbw 90, SKY_ATTACK
	; dbw 99, OVERHEAT
	db 0 ; no more level-up moves

CelebiEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, RECOVER
	dbw 1, HEAL_BELL
	dbw 10, SAFEGUARD ; 
	; dbw 10, MAGICAL_LEAF
	dbw 20, BATON_PASS
	dbw 30, ANCIENTPOWER
	; dbw 40, LIFE_DEW
	dbw 50, LEECH_SEED
	dbw 60, RECOVER
	dbw 70, FUTURE_SIGHT
	; dbw 80, HEALING_WISH
	; dbw 90, LEAF_STORM
	dbw 100, PERISH_SONG
	db 0 ; no more level-up moves

	