SECTION "Evolutions and Attacks 1", ROMX

EvosAttacksPointers1::
	dw BulbasaurEvosAttacks
	dw IvysaurEvosAttacks
	dw VenusaurEvosAttacks
	dw CharmanderEvosAttacks
	dw CharmeleonEvosAttacks
	dw CharizardEvosAttacks
	dw SquirtleEvosAttacks
	dw WartortleEvosAttacks
	dw BlastoiseEvosAttacks
	dw CaterpieEvosAttacks
	dw MetapodEvosAttacks
	dw ButterfreeEvosAttacks
	dw WeedleEvosAttacks
	dw KakunaEvosAttacks
	dw BeedrillEvosAttacks
	dw PidgeyEvosAttacks
	dw PidgeottoEvosAttacks
	dw PidgeotEvosAttacks
	dw RattataEvosAttacks
	dw RaticateEvosAttacks
	dw SpearowEvosAttacks
	dw FearowEvosAttacks
	dw EkansEvosAttacks
	dw ArbokEvosAttacks
	dw PikachuEvosAttacks
	dw RaichuEvosAttacks
	dw SandshrewEvosAttacks
	dw SandslashEvosAttacks
	dw NidoranFEvosAttacks
	dw NidorinaEvosAttacks
	dw NidoqueenEvosAttacks
	dw NidoranMEvosAttacks
	dw NidorinoEvosAttacks
	dw NidokingEvosAttacks
	dw ClefairyEvosAttacks
	dw ClefableEvosAttacks
	dw VulpixEvosAttacks
	dw NinetalesEvosAttacks
	dw JigglypuffEvosAttacks
	dw WigglytuffEvosAttacks
	dw ZubatEvosAttacks
	dw GolbatEvosAttacks
	dw OddishEvosAttacks
	dw GloomEvosAttacks
	dw VileplumeEvosAttacks
	dw ParasEvosAttacks
	dw ParasectEvosAttacks
	dw VenonatEvosAttacks
	dw VenomothEvosAttacks
	dw DiglettEvosAttacks
	dw DugtrioEvosAttacks
	dw MeowthEvosAttacks
	dw PersianEvosAttacks
	dw PsyduckEvosAttacks
	dw GolduckEvosAttacks
	dw MankeyEvosAttacks
	dw PrimeapeEvosAttacks
	dw GrowlitheEvosAttacks
	dw ArcanineEvosAttacks
	dw PoliwagEvosAttacks
	dw PoliwhirlEvosAttacks
	dw PoliwrathEvosAttacks
	dw AbraEvosAttacks
	dw KadabraEvosAttacks
	dw AlakazamEvosAttacks
	dw MachopEvosAttacks
	dw MachokeEvosAttacks
	dw MachampEvosAttacks
	dw BellsproutEvosAttacks
	dw WeepinbellEvosAttacks
	dw VictreebelEvosAttacks
	dw TentacoolEvosAttacks
	dw TentacruelEvosAttacks
	dw GeodudeEvosAttacks
	dw GravelerEvosAttacks
	dw GolemEvosAttacks
	dw PonytaEvosAttacks
	dw RapidashEvosAttacks
	dw SlowpokeEvosAttacks
	dw SlowbroEvosAttacks
	dw MagnemiteEvosAttacks
	dw MagnetonEvosAttacks
	dw FarfetchDEvosAttacks
	dw DoduoEvosAttacks
	dw DodrioEvosAttacks
	dw SeelEvosAttacks
	dw DewgongEvosAttacks
	dw GrimerEvosAttacks
	dw MukEvosAttacks
	dw ShellderEvosAttacks
	dw CloysterEvosAttacks
	dw GastlyEvosAttacks
	dw HaunterEvosAttacks
	dw GengarEvosAttacks
	dw OnixEvosAttacks
	dw DrowzeeEvosAttacks
	dw HypnoEvosAttacks
	dw KrabbyEvosAttacks
	dw KinglerEvosAttacks
	dw VoltorbEvosAttacks
	dw ElectrodeEvosAttacks
	dw ExeggcuteEvosAttacks
	dw ExeggutorEvosAttacks
	dw CuboneEvosAttacks
	dw MarowakEvosAttacks
	dw HitmonleeEvosAttacks
	dw HitmonchanEvosAttacks
	dw LickitungEvosAttacks
	dw KoffingEvosAttacks
	dw WeezingEvosAttacks
	dw RhyhornEvosAttacks
	dw RhydonEvosAttacks
	dw ChanseyEvosAttacks
	dw TangelaEvosAttacks
	dw KangaskhanEvosAttacks
	dw HorseaEvosAttacks
	dw SeadraEvosAttacks
	dw GoldeenEvosAttacks
	dw SeakingEvosAttacks
	dw StaryuEvosAttacks
	dw StarmieEvosAttacks
	dw MrMimeEvosAttacks
	dw ScytherEvosAttacks
	dw JynxEvosAttacks
	dw ElectabuzzEvosAttacks
	dw MagmarEvosAttacks
	dw PinsirEvosAttacks
	dw TaurosEvosAttacks
	dw MagikarpEvosAttacks
	dw GyaradosEvosAttacks
	dw LaprasEvosAttacks
	dw DittoEvosAttacks
	dw EeveeEvosAttacks
	dw VaporeonEvosAttacks
	dw JolteonEvosAttacks
	dw FlareonEvosAttacks
	dw PorygonEvosAttacks
	dw OmanyteEvosAttacks
	dw OmastarEvosAttacks
	dw KabutoEvosAttacks
	dw KabutopsEvosAttacks
	dw AerodactylEvosAttacks
	dw SnorlaxEvosAttacks
	dw ArticunoEvosAttacks
	dw ZapdosEvosAttacks
	dw MoltresEvosAttacks
	dw DratiniEvosAttacks
	dw DragonairEvosAttacks
	dw DragoniteEvosAttacks
	dw MewtwoEvosAttacks
	dw MewEvosAttacks
.IndirectEnd::

BulbasaurEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, IVYSAUR
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 3, VINE_WHIP
	dbw 6, GROWTH
	dbw 9, LEECH_SEED
	dbw 12, RAZOR_LEAF
	dbw 15, POISONPOWDER
	dbw 15, SLEEP_POWDER
	; dbw 18, SEED_BOMB
	dbw 21, TAKE_DOWN
	dbw 24, SWEET_SCENT
	dbw 27, SYNTHESIS
	; dbw 30, WORRY_SEED
	; dbw 33, POWER_WHIP
	dbw 36, SOLARBEAM
	db 0 ; no more level-up moves

IvysaurEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, VENUSAUR
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, VINE_WHIP
	dbw 1, GROWTH
	dbw 9, LEECH_SEED
	dbw 12, RAZOR_LEAF
	dbw 15, POISONPOWDER
	dbw 15, SLEEP_POWDER
	; dbw 20, SEED_BOMB
	dbw 25, TAKE_DOWN
	dbw 30, SWEET_SCENT
	dbw 35, SYNTHESIS
	; dbw 40, WORRY_SEED
	; dbw 45, POWER_WHIP
	dbw 50, SOLARBEAM
	db 0 ; no more level-up moves

VenusaurEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, VINE_WHIP
	dbw 1, GROWTH
	dbw 1, PETAL_DANCE
	; dbw 1, PETAL_BLIZZARD ; EVOMOVE
	dbw 9, LEECH_SEED
	dbw 12, RAZOR_LEAF
	dbw 15, POISONPOWDER
	dbw 15, SLEEP_POWDER
	; dbw 20, SEED_BOMB
	dbw 25, TAKE_DOWN
	dbw 30, SWEET_SCENT
	dbw 37, SYNTHESIS
	; dbw 44, WORRY_SEED
	; dbw 51, POWER_WHIP
	dbw 58, SOLARBEAM
	db 0 ; no more level-up moves

CharmanderEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, CHARMELEON
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 4, EMBER
	dbw 8, SMOKESCREEN
	dbw 12, DRAGONBREATH
	dbw 17, FIRE_FANG
	dbw 20, SLASH
	dbw 24, FLAMETHROWER
	dbw 28, SCARY_FACE
	dbw 32, FIRE_SPIN
	dbw 36, INFERNO
	; dbw 40, FLARE_BLITZ
	db 0 ; no more level-up moves

CharmeleonEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, CHARIZARD
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 1, EMBER
	dbw 1, SMOKESCREEN
	dbw 12, DRAGONBREATH
	dbw 19, FIRE_FANG
	dbw 24, SLASH
	dbw 30, FLAMETHROWER
	dbw 37, SCARY_FACE
	dbw 48, INFERNO
	; dbw 54ioii, FLARE_BLITZ
	db 0 ; no more level-up moves

CharizardEvosAttacks:
	db 0 ; no more evolutions
	; dbw 1, AIR_SLASH ; EVOMOVE
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 1, EMBER
	dbw 1, SMOKESCREEN
	; dbw 1, HEAT_WAVE
	dbw 1, DRAGON_CLAW
	dbw 12, DRAGONBREATH
	dbw 19, FIRE_FANG
	dbw 24, SLASH
	dbw 30, FLAMETHROWER
	dbw 39, SCARY_FACE
	dbw 46, FIRE_SPIN
	dbw 54, INFERNO
	; dbw 62, FLARE_BLITZ
	db 0 ; no more level-up moves

SquirtleEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, WARTORTLE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 3, WATER_GUN
	dbw 6, WITHDRAW
	dbw 9, RAPID_SPIN
	dbw 12, BITE
	; dbw 15, WATER_PULSE
	dbw 18, PROTECT
	dbw 21, RAIN_DANCE
	dbw 24, AQUA_TAIL
	; dbw 27, SHELL_SMASH
	; dbw 30, IRON_DEFENSE
	dbw 33, HYDRO_PUMP
	; dbw 36, WAVE_CRASH
	db 0 ; no more level-up moves

WartortleEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, BLASTOISE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 1, WATER_GUN
	dbw 1, WITHDRAW
	dbw 9, RAPID_SPIN
	dbw 12, BITE
	; dbw 15, WATER_PULSE
	dbw 20, PROTECT
	dbw 25, RAIN_DANCE
	dbw 30, AQUA_TAIL
	; dbw 35, SHELL_SMASH
	; dbw 40, IRON_DEFENSE
	dbw 45, HYDRO_PUMP
	; dbw 50, WAVE_CRASH
	db 0 ; no more level-up moves

BlastoiseEvosAttacks:
	db 0 ; no more evolutions
	; dbw 1, FLASH_CANNON ; EVOMOVE
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 1, WATER_GUN
	dbw 1, WITHDRAW
	dbw 9, RAPID_SPIN
	dbw 12, BITE
	; dbw 15, WATER_PULSE
	dbw 20, PROTECT
	dbw 25, RAIN_DANCE
	dbw 30, AQUA_TAIL
	; dbw 35, SHELL_SMASH
	; dbw 42, IRON_DEFENSE
	dbw 49, HYDRO_PUMP
	; dbw 56, WAVE_CRASH
	db 0 ; no more level-up moves

CaterpieEvosAttacks:
	dbbw EVOLVE_LEVEL, 7, METAPOD
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, STRING_SHOT
	; dbw 9, BUG_BITE
	db 0 ; no more level-up moves

MetapodEvosAttacks:
	dbbw EVOLVE_LEVEL, 10, BUTTERFREE
	db 0 ; no more evolutions
	dbw 1, HARDEN ; EVOMOVE
	dbw 7, HARDEN
	db 0 ; no more level-up moves

ButterfreeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GUST ; EVOMOVE
	dbw 1, HARDEN
	dbw 1, TACKLE
	dbw 1, STRING_SHOT
	; dbw 1, BUG_BITE
	dbw 4, SUPERSONIC
	dbw 8, CONFUSION
	dbw 12, POISONPOWDER
	dbw 12, STUN_SPORE
	dbw 12, SLEEP_POWDER
	dbw 16, PSYBEAM
	dbw 20, WHIRLWIND
	; dbw 24, AIR_SLASH
	dbw 28, SAFEGUARD
	; dbw 32, BUG_BUZZ
	; dbw 36, TAILWIND
	; dbw 40, RAGE_POWDER
	; dbw 44, QUIVER_DANCE
	db 0 ; no more level-up moves

WeedleEvosAttacks:
	dbbw EVOLVE_LEVEL, 7, KAKUNA
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 1, STRING_SHOT
	; dbw 9, BUG_BITE
	db 0 ; no more level-up moves

KakunaEvosAttacks:
	dbbw EVOLVE_LEVEL, 10, BEEDRILL
	db 0 ; no more evolutions
	dbw 1, HARDEN ; EVOMOVE
	dbw 7, HARDEN
	db 0 ; no more level-up moves

BeedrillEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, FURY_ATTACK ; EVOMOVE
	dbw 1, POISON_STING
	dbw 1, STRING_SHOT
	dbw 1, HARDEN
	; dbw 1, BUG_BITE
	; dbw 11, FURY_CUTTER
	; dbw 14, LASER_FOCUS
	dbw 20, FOCUS_ENERGY
	; dbw 23, VENOSHOCK
	; dbw 26, ASSURANCE
	; dbw 29, TOXIC_SPIKES
	dbw 20, TWINEEDLE ; REMOVE
	dbw 26, PURSUIT ; REMOVE
	dbw 32, PIN_MISSILE
	; dbw 35, POISON_JAB
	dbw 38, AGILITY
	; dbw 41, ENDEAVOR
	; dbw 44, FELL_STINGER
	db 0 ; no more level-up moves

PidgeyEvosAttacks:
	dbbw EVOLVE_LEVEL, 18, PIDGEOTTO
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 5, SAND_ATTACK
	dbw 9, GUST
	dbw 13, QUICK_ATTACK
	dbw 17, WHIRLWIND
	dbw 21, TWISTER
	; dbw 25, FEATHER_DANCE
	dbw 29, AGILITY
	dbw 33, WING_ATTACK
	; dbw 37, ROOST
	; dbw 41, TAILWIND
	; dbw 45, AERIAL_ACE
	dbw 47, MIRROR_MOVE ; REMOVE
	; dbw 49, AIR_SLASH
	; dbw 53, HURRICANE
	db 0 ; no more level-up moves

PidgeottoEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, PIDGEOT
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SAND_ATTACK
	dbw 1, GUST
	dbw 13, QUICK_ATTACK
	dbw 17, WHIRLWIND
	dbw 22, TWISTER
	; dbw 27, FEATHER_DANCE
	dbw 32, AGILITY
	dbw 37, WING_ATTACK
	; dbw 42, ROOST
	; dbw 47, TAILWIND
	; dbw 52, AERIAL_ACE
	dbw 47, MIRROR_MOVE ; REMOVE
	; dbw 57, AIR_SLASH
	; dbw 62, HURRICANE
	db 0 ; no more level-up moves

PidgeotEvosAttacks:
	db 0 ; no more evolutions
	; dbw 1, HURRICANE
	dbw 1, TACKLE
	dbw 1, SAND_ATTACK
	dbw 1, GUST
	dbw 1, QUICK_ATTACK
	dbw 17, WHIRLWIND
	dbw 22, TWISTER
	; dbw 27, FEATHER_DANCE
	dbw 32, AGILITY
	dbw 38, WING_ATTACK
	; dbw 44, ROOST
	; dbw 50, TAILWIND
	; dbw 56, AERIAL_ACE
	dbw 48, MIRROR_MOVE ; REMOVE
	; dbw 62, AIR_SLASH
	; dbw 68, HURRICANE
	db 0 ; no more level-up moves

RattataEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, RATICATE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 4, QUICK_ATTACK
	dbw 7, FOCUS_ENERGY
	dbw 10, BITE
	; dbw 13, LASER_FOCUS
	dbw 16, TAKE_DOWN
	; dbw 19, ASSURANCE
	dbw 22, CRUNCH
	; dbw 25, SUCKER_PUNCH
	dbw 25, PURSUIT ; REMOVE
	dbw 28, SUPER_FANG
	; dbw 31, DOUBLE_EDGE
	; dbw 34, ENDEAVOR
	db 0 ; no more level-up moves

RaticateEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCARY_FACE ; EVOMOVE
	dbw 1, SWORDS_DANCE
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 4, QUICK_ATTACK
	dbw 7, FOCUS_ENERGY
	dbw 10, BITE
	; dbw 13, LASER_FOCUS
	dbw 16, TAKE_DOWN
	; dbw 19, ASSURANCE
	dbw 24, CRUNCH
	; dbw 29, SUCKER_PUNCH
	dbw 29, PURSUIT ; REMOVE
	dbw 34, SUPER_FANG
	; dbw 39, DOUBLE_EDGE
	; dbw 44, ENDEAVOR
	db 0 ; no more level-up moves

SpearowEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, FEAROW
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, GROWL
	dbw 4, LEER
	; dbw 8, ASSURANCE
	dbw 11, FURY_ATTACK
	; dbw 15, AERIAL_ACE
	dbw 18, WING_ATTACK
	dbw 22, TAKE_DOWN
	dbw 25, AGILITY
	dbw 29, FOCUS_ENERGY
	; dbw 32, ROOST
	dbw 32, PURSUIT ; REMOVE
	dbw 34, MIRROR_MOVE ; REMOVE
	dbw 36, DRILL_PECK
	db 0 ; no more level-up moves

FearowEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, GROWL
	dbw 4, LEER
	; dbw 8, ASSURANCE
	dbw 11, FURY_ATTACK
	; dbw 15, AERIAL_ACE
	dbw 18, WING_ATTACK
	dbw 22, TAKE_DOWN
	dbw 27, AGILITY
	dbw 32, FOCUS_ENERGY
	; dbw 36, ROOST
	dbw 36, PURSUIT ; REMOVE
	dbw 39, MIRROR_MOVE ; REMOVE
	dbw 41, DRILL_PECK
	; dbw 45, DRILL_RUN
	db 0 ; no more level-up moves

EkansEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, ARBOK
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LEER
	dbw 4, POISON_STING
	dbw 9, BITE
	dbw 12, GLARE
	dbw 17, SCREECH
	dbw 20, ACID
	; dbw 25, STOCKPILE
	; dbw 25, SWALLOW
	; dbw 25, SPIT_UP
	; dbw 28, ACID_SPRAY
	dbw 33, SLUDGE_BOMB
	; dbw 36, GASTRO_ACID
	; dbw 38, BELCH
	; dbw 41, HAZE
	; dbw 44, COIL
	; dbw 49, GUNK_SHOT
	db 0 ; no more level-up moves

ArbokEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LEER
	dbw 1, THUNDER_FANG
	dbw 1, ICE_FANG
	dbw 1, POISON_STING
	dbw 1, FIRE_FANG
	dbw 1, BITE
	dbw 12, GLARE
	dbw 17, SCREECH
	dbw 20, ACID
	; dbw 27, STOCKPILE
	; dbw 27, SWALLOW
	; dbw 27, SPIT_UP
	; dbw 32, ACID_SPRAY
	dbw 39, SLUDGE_BOMB
	; dbw 44, GASTRO_ACID
	; dbw 48, BELCH
	; dbw 51, HAZE
	; dbw 56, COIL
	; dbw 63, GUNK_SHOT
	db 0 ; no more level-up moves

PikachuEvosAttacks:
	dbbw EVOLVE_ITEM, THUNDERSTONE, RAICHU
	db 0 ; no more evolutions
	; dbw 1, NUZZLE
	; dbw 1, NASTY_PLOT
	dbw 1, CHARM
	dbw 1, SWEET_KISS
	; dbw 1, PLAY_NICE
	dbw 1, QUICK_ATTACK
	dbw 1, THUNDERSHOCK
	dbw 1, GROWL
	dbw 1, TAIL_WHIP
	dbw 4, THUNDER_WAVE
	dbw 8, DOUBLE_TEAM
	; dbw 12, ELECTRO_BALL
	; dbw 16, FEINT
	; dbw 20, SPARK
	dbw 17, SLAM ; REMOVE
	dbw 24, AGILITY
	dbw 28, IRON_TAIL
	; dbw 32, DISCHARGE
	dbw 36, THUNDERBOLT
	dbw 50, LIGHT_SCREEN
	dbw 41, THUNDER
	db 0 ; no more level-up moves

RaichuEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THUNDERPUNCH
	; dbw 1, NUZZLE
	; dbw 1, NASTY_PLOT
	dbw 1, CHARM
	dbw 1, SWEET_KISS
	; dbw 1, PLAY_NICE
	dbw 1, QUICK_ATTACK
	dbw 1, THUNDERSHOCK
	dbw 1, GROWL
	dbw 1, TAIL_WHIP
	dbw 4, THUNDER_WAVE
	dbw 1, DOUBLE_TEAM
	; dbw 1, ELECTRO_BALL
	; dbw 1, FEINT
	; dbw 1, SPARK
	dbw 1, SLAM ; REMOVE
	dbw 1, AGILITY
	dbw 1, IRON_TAIL
	; dbw 1, DISCHARGE
	dbw 1, LIGHT_SCREEN
	dbw 1, THUNDER
	dbw 5, THUNDERBOLT
	db 0 ; no more level-up moves

SandshrewEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, SANDSLASH
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, DEFENSE_CURL
	dbw 3, POISON_STING
	dbw 6, SAND_ATTACK
	dbw 9, ROLLOUT
	dbw 12, FURY_CUTTER
	dbw 15, RAPID_SPIN
	dbw 18, BULLDOZE
	dbw 21, SWIFT
	dbw 24, FURY_SWIPES
	dbw 30, SLASH
	dbw 33, DIG
	; dbw 36, GYRO_BALL
	dbw 39, SWORDS_DANCE
	dbw 42, SANDSTORM
	dbw 45, EARTHQUAKE
	db 0 ; no more level-up moves

SandslashEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, DEFENSE_CURL
	; dbw 1, CRUSH_CLAW
	dbw 1, POISON_STING
	dbw 1, SAND_ATTACK
	dbw 9, ROLLOUT
	dbw 12, FURY_CUTTER
	dbw 15, RAPID_SPIN
	dbw 18, BULLDOZE
	dbw 21, SWIFT
	dbw 26, FURY_SWIPES
	; dbw 31, SAND_TOMB
	dbw 36, SLASH
	dbw 41, DIG
	; dbw 46, GYRO_BALL
	dbw 51, SWORDS_DANCE
	dbw 56, SANDSTORM
	dbw 61, EARTHQUAKE
	db 0 ; no more level-up moves

NidoranFEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, NIDORINA
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, POISON_STING
	dbw 5, SCRATCH
	dbw 10, TAIL_WHIP
	dbw 15, FURY_SWIPES
	; dbw 20, TOXIC_SPIKES
	dbw 25, DOUBLE_KICK
	dbw 30, BITE
	; dbw 35, HELPING_HAND
	dbw 40, TOXIC
	; dbw 45, FLATTER
	dbw 50, CRUNCH
	dbw 55, EARTH_POWER
	db 0 ; no more level-up moves

NidorinaEvosAttacks:
	dbbw EVOLVE_ITEM, MOON_STONE, NIDOQUEEN
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, POISON_STING
	dbw 5, SCRATCH
	dbw 10, TAIL_WHIP
	dbw 15, FURY_SWIPES
	; dbw 22, TOXIC_SPIKES
	dbw 29, DOUBLE_KICK
	dbw 36, BITE
	; dbw 35, HELPING_HAND
	dbw 50, TOXIC
	; dbw 57, FLATTER
	dbw 64, CRUNCH
	dbw 71, EARTH_POWER
	db 0 ; no more level-up moves

NidoqueenEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, POISON_STING
	dbw 5, SCRATCH
	dbw 1, TAIL_WHIP
	dbw 1, FURY_SWIPES
	; dbw 1, TOXIC_SPIKES
	dbw 1, DOUBLE_KICK
	dbw 1, BITE
	; dbw 1, HELPING_HAND
	dbw 1, TOXIC
	; dbw 1, FLATTER
	dbw 1, CRUNCH
	dbw 1, EARTH_POWER
	; dbw 1, SUPERPOWER ; EVOMOVE
	db 0 ; no more level-up moves

NidoranMEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, NIDORINO
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, POISON_STING
	dbw 5, PECK
	dbw 10, FOCUS_ENERGY
	dbw 15, FURY_ATTACK
	; dbw 20, TOXIC_SPIKES
	dbw 25, DOUBLE_KICK
	dbw 30, HORN_ATTACK
	; dbw 35, HELPING_HAND
	dbw 40, TOXIC
	; dbw 45, FLATTER
	; dbw 50, POISON_JAB
	dbw 55, EARTH_POWER
	db 0 ; no more level-up moves

NidorinoEvosAttacks:
	dbbw EVOLVE_ITEM, MOON_STONE, NIDOKING
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, POISON_STING
	dbw 1, PECK
	dbw 1, FOCUS_ENERGY
	dbw 15, FURY_ATTACK
	; dbw 22, TOXIC_SPIKES
	dbw 29, DOUBLE_KICK
	dbw 36, HORN_ATTACK
	; dbw 43, HELPING_HAND
	dbw 50, TOXIC
	; dbw 57, FLATTER
	; dbw 64, POISON_JAB
	dbw 71, EARTH_POWER
	db 0 ; no more level-up moves

NidokingEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, POISON_STING
	dbw 1, PECK
	dbw 1, FOCUS_ENERGY
	dbw 1, FURY_ATTACK
	; dbw 1, TOXIC_SPIKES
	dbw 1, DOUBLE_KICK
	dbw 1, HORN_ATTACK
	; dbw 1, HELPING_HAND
	dbw 1, TOXIC
	; dbw 1, FLATTER
	; dbw 1, POISON_JAB
	dbw 1, EARTH_POWER
	dbw 1, MEGAHORN ; EVOMOVE
	db 0 ; no more level-up moves

ClefairyEvosAttacks:
	dbbw EVOLVE_ITEM, MOON_STONE, CLEFABLE
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, GROWL
	dbw 1, SING
	dbw 1, DEFENSE_CURL
	dbw 1, SPLASH
	dbw 1, SWEET_KISS
	dbw 1, CHARM
	; dbw 1, DISARMING_VOICE
	; dbw 1, COPYCAT
	; dbw 4, STORED_POWER
	dbw 8, ENCORE
	; dbw 12, AFTER_YOU
	; dbw 16, LIFE_DEW
	dbw 20, METRONOME
	dbw 24, MOONLIGHT
	; dbw 28, GRAVITY
	; dbw 32, METEOR_MASH
	; dbw 36, FOLLOW_ME
	; dbw 40, COSMIC_POWER
	dbw 44, MOONBLAST
	; dbw 48, HEALING_WISH
	db 0 ; no more level-up moves

ClefableEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, GROWL
	dbw 1, SING
	dbw 1, DEFENSE_CURL
	dbw 1, SPLASH
	dbw 1, SWEET_KISS
	dbw 1, CHARM
	; dbw 1, DISARMING_VOICE
	; dbw 1, COPYCAT
	; dbw 1, STORED_POWER
	dbw 1, ENCORE
	; dbw 1, AFTER_YOU
	; dbw 1, LIFE_DEW
	dbw 1, METRONOME
	dbw 1, MOONLIGHT
	; dbw 1, GRAVITY
	; dbw 1, METEOR_MASH
	; dbw 1, FOLLOW_ME
	; dbw 1, COSMIC_POWER
	dbw 1, MOONBLAST
	; dbw 1, HEALING_WISH
	db 0 ; no more level-up moves

VulpixEvosAttacks:
	dbbw EVOLVE_ITEM, FIRE_STONE, NINETALES
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, TAIL_WHIP
	dbw 4, DISABLE
	dbw 8, QUICK_ATTACK
	dbw 12, SPITE
	; dbw 16, INCINERATE
	dbw 20, CONFUSE_RAY
	dbw 24, WILL_O_WISP
	; dbw 28, EXTRASENSORY
	dbw 32, FLAMETHROWER
	; dbw 36, IMPRISON
	dbw 40, FIRE_SPIN
	dbw 44, SAFEGUARD
	dbw 48, INFERNO
	dbw 52, FIRE_BLAST
	db 0 ; no more level-up moves

NinetalesEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, TAIL_WHIP
	dbw 1, DISABLE
	dbw 1, QUICK_ATTACK
	dbw 1, SPITE
	; dbw 1, INCINERATE
	dbw 1, CONFUSE_RAY
	dbw 1, WILL_O_WISP
	; dbw 1, EXTRASENSORY
	dbw 1, FLAMETHROWER
	; dbw 1, IMPRISON
	dbw 1, FIRE_SPIN
	dbw 1, SAFEGUARD
	dbw 1, INFERNO
	dbw 1, FIRE_BLAST
	db 0 ; no more level-up moves

JigglypuffEvosAttacks:
	dbbw EVOLVE_ITEM, MOON_STONE, WIGGLYTUFF
	db 0 ; no more evolutions
	dbw 1, SING
	dbw 1, DEFENSE_CURL
	dbw 1, POUND
	dbw 1, DISABLE
	dbw 1, CHARM
	; dbw 1, COPYCAT
	; dbw 1, DISARMING_VOICE
	; dbw 4, ECHOED_VOICE
	; dbw 8, COVET
	; dbw 12, STOCKPILE
	; dbw 12, SWALLOW
	; dbw 12, SPIT_UP
	; dbw 16, ROUND
	dbw 20, REST
	dbw 24, BODY_SLAM
	dbw 28, MIMIC
	; dbw 32, GYRO_BALL
	; dbw 36, HYPER_VOICE
	dbw 44, DOUBLE_EDGE
	dbw 19, ROLLOUT
	dbw 24, DOUBLESLAP
	dbw 29, REST
	dbw 34, BODY_SLAM
	dbw 39, DOUBLE_EDGE
	db 0 ; no more level-up moves

WigglytuffEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SING
	dbw 1, DEFENSE_CURL
	dbw 1, POUND
	dbw 1, DISABLE
	dbw 1, CHARM
	; dbw 1, COPYCAT
	; dbw 1, DISARMING_VOICE
	; dbw 1, ECHOED_VOICE
	; dbw 1, COVET
	; dbw 1, STOCKPILE
	; dbw 1, SWALLOW
	; dbw 1, SPIT_UP
	; dbw 1, ROUND
	dbw 1, REST
	dbw 1, BODY_SLAM
	dbw 1, MIMIC
	; dbw 1, GYRO_BALL
	; dbw 1, HYPER_VOICE
	dbw 1, DOUBLE_EDGE
	dbw 1, ROLLOUT
	dbw 1, DOUBLESLAP
	dbw 1, REST
	dbw 1, BODY_SLAM
	dbw 1, DOUBLE_EDGE
	dbw 5, PLAY_ROUGH
	db 0 ; no more level-up moves

ZubatEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, GOLBAT
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, SUPERSONIC
	dbw 5, ASTONISH
	dbw 10, MEAN_LOOK
	dbw 15, POISON_FANG
	; dbw 20, QUICK_GUARD
	; dbw 25, AIR_CUTTER
	dbw 30, BITE
	dbw 35, HAZE
	; dbw 40, VENOSHOCK
	dbw 45, CONFUSE_RAY
	; dbw 50, AIR_SLASH
	dbw 55, LEECH_LIFE
	db 0 ; no more level-up moves

GolbatEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, CROBAT
	db 0 ; no more evolutions
	dbw 1, SCREECH
	dbw 1, ABSORB
	dbw 1, SUPERSONIC
	dbw 1, ASTONISH
	dbw 1, MEAN_LOOK
	dbw 15, POISON_FANG
	; dbw 20, QUICK_GUARD
	; dbw 27, AIR_CUTTER
	dbw 34, BITE
	dbw 41, HAZE
	; dbw 48, VENOSHOCK
	dbw 55, CONFUSE_RAY
	; dbw 62, AIR_SLASH
	dbw 69, LEECH_LIFE
	db 0 ; no more level-up moves

OddishEvosAttacks:
	dbbw EVOLVE_LEVEL, 21, GLOOM
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, GROWTH
	dbw 4, ACID
	dbw 8, SWEET_SCENT
	dbw 12, MEGA_DRAIN
	dbw 14, POISONPOWDER
	dbw 16, STUN_SPORE
	dbw 18, SLEEP_POWDER
	dbw 20, GIGA_DRAIN
	dbw 24, TOXIC
	dbw 28, MOONBLAST
	; dbw 32, GRASSY_TERRAIN
	dbw 36, MOONLIGHT
	dbw 40, PETAL_DANCE
	db 0 ; no more level-up moves

GloomEvosAttacks:
	dbbw EVOLVE_ITEM, LEAF_STONE, VILEPLUME
	dbbw EVOLVE_ITEM, SUN_STONE, BELLOSSOM
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, GROWTH
	dbw 1, ACID
	dbw 1, SWEET_SCENT
	dbw 12, MEGA_DRAIN
	dbw 14, POISONPOWDER
	dbw 16, STUN_SPORE
	dbw 18, SLEEP_POWDER
	dbw 20, GIGA_DRAIN
	dbw 26, TOXIC
	dbw 32, MOONBLAST
	; dbw 38, GRASSY_TERRAIN
	dbw 44, MOONLIGHT
	dbw 50, PETAL_DANCE
	db 0 ; no more level-up moves

VileplumeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, GROWTH
	dbw 1, ACID
	dbw 1, SWEET_SCENT
	dbw 1, MEGA_DRAIN
	dbw 1, POISONPOWDER
	dbw 1, STUN_SPORE
	dbw 1, SLEEP_POWDER
	dbw 1, GIGA_DRAIN
	dbw 1, TOXIC
	dbw 1, MOONBLAST
	; dbw 1, GRASSY_TERRAIN
	dbw 1, MOONLIGHT
	dbw 1, PETAL_DANCE
	; dbw 1, PETAL_BLIZZARD ; EVOMOVE
	db 0 ; no more level-up moves

ParasEvosAttacks:
	dbbw EVOLVE_LEVEL, 24, PARASECT
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 6, STUN_SPORE
	dbw 6, POISONPOWDER
	dbw 11, ABSORB
	dbw 17, FURY_CUTTER
	dbw 22, SPORE
	dbw 27, SLASH
	dbw 33, GROWTH
	dbw 38, GIGA_DRAIN
	; dbw 43, AROMATHERAPY
	; dbw 49, RAGE_POWDER
	dbw 54, X_SCISSOR
	db 0 ; no more level-up moves

ParasectEvosAttacks:
	db 0 ; no more evolutions
	; dbw 1, CROSS_POISON ; EVOMOVE
	dbw 1, SCRATCH
	dbw 1, STUN_SPORE
	dbw 1, POISONPOWDER
	dbw 1, ABSORB
	dbw 17, FURY_CUTTER
	dbw 22, SPORE
	dbw 29, SLASH
	dbw 37, GROWTH
	dbw 44, GIGA_DRAIN
	; dbw 51, AROMATHERAPY
	; dbw 59, RAGE_POWDER
	dbw 66, X_SCISSOR
	db 0 ; no more level-up moves

VenonatEvosAttacks:
	dbbw EVOLVE_LEVEL, 31, VENOMOTH
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, DISABLE
	; dbw 1, STRUGGLE_BUG
	dbw 1, FORESIGHT ; REMOVE
	dbw 5, SUPERSONIC
	dbw 11, CONFUSION
	dbw 13, POISONPOWDER
	dbw 17, PSYBEAM
	dbw 23, STUN_SPORE
	dbw 25, MEGA_DRAIN
	dbw 29, SLEEP_POWDER
	dbw 35, LEECH_LIFE
	; dbw 37, ZEN_HEADBUTT
	dbw 41, POISON_FANG
	dbw 47, PSYCHIC_M
	db 0 ; no more level-up moves

VenomothEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, DISABLE
	; dbw 1, BUG_BUZZ
	; dbw 1, QUIVER_DANCE
	; dbw 1, STRUGGLE_BUG
	dbw 1, WHIRLWIND
	dbw 1, FORESIGHT ; REMOVE
	dbw 1, GUST ; EVOMOVE
	dbw 5, SUPERSONIC
	dbw 11, CONFUSION
	dbw 13, POISONPOWDER
	dbw 17, PSYBEAM
	dbw 23, STUN_SPORE
	dbw 25, MEGA_DRAIN
	dbw 29, SLEEP_POWDER
	dbw 37, LEECH_LIFE
	; dbw 41, ZEN_HEADBUTT
	dbw 47, POISON_FANG
	dbw 55, PSYCHIC_M
	; dbw 59, BUG_BUZZ
	; dbw 63, QUIVER_DANCE
	db 0 ; no more level-up moves

DiglettEvosAttacks:
	dbbw EVOLVE_LEVEL, 26, DUGTRIO
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, SAND_ATTACK
	dbw 4, GROWL
	dbw 8, ASTONISH
	dbw 9, MAGNITUDE ; REMOVE
	dbw 12, MUD_SLAP
	dbw 16, BULLDOZE
	; dbw 20, SUCKER_PUNCH
	dbw 24, SLASH
	dbw 28, SANDSTORM
	dbw 32, DIG
	dbw 36, EARTH_POWER
	dbw 40, EARTHQUAKE
	dbw 44, FISSURE
	db 0 ; no more level-up moves

DugtrioEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, SAND_ATTACK
	dbw 1, GROWL
	dbw 1, ASTONISH
	dbw 1, TRI_ATTACK
	; dbw 1, NIGHT_SLASH 
	dbw 1, MAGNITUDE ; REMOVE
	dbw 12, MUD_SLAP
	dbw 16, BULLDOZE
	; dbw 20, SUCKER_PUNCH
	dbw 24, SLASH
	dbw 30, SANDSTORM
	dbw 36, DIG
	dbw 42, EARTH_POWER
	dbw 48, EARTHQUAKE
	dbw 54, FISSURE
	db 0 ; no more level-up moves

MeowthEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, PERSIAN
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	; dbw 1, FAKE_OUT
	; dbw 4, FEINT
	dbw 12, PAY_DAY
	dbw 16, BITE
	; dbw 20, TAUNT
	; dbw 24, ASSURANCE
	dbw 29, FURY_SWIPES
	dbw 32, SCREECH
	dbw 36, SLASH
	; dbw 40, NASTY_PLOT
	dbw 44, PLAY_ROUGH
	db 0 ; no more level-up moves

PersianEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	; dbw 1, POWER_GEM ; EVOMOVE
	; dbw 1, FAKE_OUT
	; dbw 1, FEINT
	; dbw 1, SWITCHEROO
	dbw 12, PAY_DAY
	dbw 16, BITE
	; dbw 20, TAUNT
	; dbw 24, ASSURANCE
	dbw 31, FURY_SWIPES
	dbw 36, SCREECH
	dbw 42, SLASH
	; dbw 48, NASTY_PLOT
	dbw 54, PLAY_ROUGH
	db 0 ; no more level-up moves

PsyduckEvosAttacks:
	dbbw EVOLVE_LEVEL, 33, GOLDUCK
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, TAIL_WHIP
	dbw 1, WATER_GUN
	dbw 6, CONFUSION
	dbw 9, FURY_SWIPES
	; dbw 12, WATER_PULSE
	dbw 15, DISABLE
	; dbw 18, ZEN_HEADBUTT
	dbw 21, SCREECH
	dbw 24, AQUA_TAIL
	; dbw 27, SOAK
	dbw 30, PSYCH_UP
	dbw 34, AMNESIA
	; dbw 39, WONDER_ROOM
	db 0 ; no more level-up moves

GolduckEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, TAIL_WHIP
	dbw 1, WATER_GUN
	dbw 1, CONFUSION
	dbw 1, AQUA_JET
	dbw 9, FURY_SWIPES
	; dbw 12, WATER_PULSE
	dbw 15, DISABLE
	; dbw 18, ZEN_HEADBUTT
	dbw 21, SCREECH
	dbw 24, AQUA_TAIL
	; dbw 27, SOAK
	dbw 30, PSYCH_UP
	dbw 36, AMNESIA
	dbw 40, HYDRO_PUMP
	; dbw 45, WONDER_ROOM
	db 0 ; no more level-up moves

MankeyEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, PRIMEAPE
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 1, FOCUS_ENERGY
	; dbw 1, COVET
	dbw 5, FURY_SWIPES
	dbw 8, LOW_KICK
	dbw 12, SEISMIC_TOSS
	dbw 15, KARATE_CHOP ; REMOVE
	; dbw 17, SWAGGER
	dbw 22, CROSS_CHOP
	; dbw 26, ASSURANCE
	dbw 29, THRASH
	; dbw 33, CLOSE_COMBAT
	dbw 36, SCREECH
	; dbw 40, STOMPING_TANTRUM
	dbw 41, OUTRAGE
	; dbw 48, FINAL_GAMBIT
	db 0 ; no more level-up moves

PrimeapeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 1, FOCUS_ENERGY
	; dbw 1, FLING
	dbw 5, FURY_SWIPES
	dbw 8, LOW_KICK
	dbw 15, SEISMIC_TOSS
	dbw 17, KARATE_CHOP ; REMOVE
	; dbw 17, SWAGGER
	dbw 22, CROSS_CHOP
	; dbw 26, ASSURANCE
	dbw 30, THRASH
	; dbw 35, RAGE_FIST
	; dbw 39, CLOSE_COMBAT
	dbw 44, SCREECH
	; dbw 48, STOMPING_TANTRUM
	dbw 53, OUTRAGE
	; dbw 57, FINAL_GAMBIT
	db 0 ; no more level-up moves

GrowlitheEvosAttacks:
	dbbw EVOLVE_ITEM, FIRE_STONE, ARCANINE
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, LEER
	; dbw 4, HOWL
	dbw 8, BITE
	dbw 12, FLAME_WHEEL
	; dbw 16, HELPING_HAND
	dbw 20, AGILITY
	dbw 24, FIRE_FANG
	; dbw 28, RETALIATE
	dbw 32, CRUNCH
	dbw 36, TAKE_DOWN
	dbw 40, FLAMETHROWER
	dbw 44, ROAR
	dbw 48, PLAY_ROUGH
	dbw 52, REVERSAL
	; dbw 56, FLARE_BLITZ
	db 0 ; no more level-up moves

ArcanineEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EXTREMESPEED
	dbw 1, EMBER
	dbw 1, LEER
	; dbw 1, HOWL
	dbw 1, BITE
	dbw 1, FLAME_WHEEL
	; dbw 1, HELPING_HAND
	dbw 1, AGILITY
	dbw 1, FIRE_FANG
	; dbw 1, RETALIATE
	dbw 1, CRUNCH
	dbw 1, TAKE_DOWN
	dbw 1, FLAMETHROWER
	dbw 1, ROAR
	dbw 1, PLAY_ROUGH
	dbw 1, REVERSAL
	; dbw 1, FLARE_BLITZ
	db 0 ; no more level-up moves

PoliwagEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, POLIWHIRL
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, HYPNOSIS
	dbw 6, POUND
	; dbw 12, MUD_SHOT
	dbw 18, BUBBLEBEAM
	dbw 24, RAIN_DANCE
	dbw 30, BODY_SLAM
	dbw 36, EARTH_POWER
	dbw 42, HYDRO_PUMP
	dbw 48, BELLY_DRUM
	dbw 54, DOUBLE_EDGE
	db 0 ; no more level-up moves

PoliwhirlEvosAttacks:
	dbbw EVOLVE_ITEM, WATER_STONE, POLIWRATH
	dbbw EVOLVE_TRADE, KINGS_ROCK, POLITOED
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, HYPNOSIS
	dbw 1, POUND
	; dbw 1, MUD_SHOT
	dbw 18, BUBBLEBEAM
	dbw 24, RAIN_DANCE
	dbw 32, BODY_SLAM
	dbw 40, EARTH_POWER
	dbw 48, HYDRO_PUMP
	dbw 56, BELLY_DRUM
	dbw 66, DOUBLE_EDGE
	db 0 ; no more level-up moves

PoliwrathEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, DYNAMICPUNCH
	dbw 1, WATER_GUN
	dbw 1, HYPNOSIS
	dbw 1, POUND
	; dbw 1, MUD_SHOT
	dbw 1, BUBBLEBEAM
	dbw 1, RAIN_DANCE
	dbw 1, BODY_SLAM
	dbw 1, EARTH_POWER
	dbw 1, HYDRO_PUMP
	dbw 1, BELLY_DRUM
	dbw 1, DOUBLE_EDGE
	db 0 ; no more level-up moves

AbraEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, KADABRA
	db 0 ; no more evolutions
	dbw 1, TELEPORT
	db 0 ; no more level-up moves

KadabraEvosAttacks:
	dbbw EVOLVE_ITEM, LINK_CABLE, ALAKAZAM
	db 0 ; no more evolutions
	dbw 1, TELEPORT
	dbw 1, KINESIS
	dbw 1, CONFUSION
	dbw 1, DISABLE
	dbw 5, PSYBEAM
	dbw 10, REFLECT
	; dbw 15, ALLY_SWITCH
	; dbw 20, PSYCHO_CUT
	dbw 25, RECOVER
	; dbw 30, PSYSHOCK
	dbw 35, PSYCHIC_M
	; dbw 40, ROLE_PLAY
	dbw 45, FUTURE_SIGHT
	; dbw 50, CALM_MIND
	db 0 ; no more level-up moves

AlakazamEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TELEPORT
	dbw 1, KINESIS
	dbw 1, CONFUSION
	dbw 1, DISABLE
	dbw 5, PSYBEAM
	dbw 10, REFLECT
	; dbw 15, ALLY_SWITCH
	; dbw 20, PSYCHO_CUT
	dbw 25, RECOVER
	; dbw 30, PSYSHOCK
	dbw 35, PSYCHIC_M
	; dbw 40, ROLE_PLAY
	dbw 45, FUTURE_SIGHT
	; dbw 50, CALM_MIND
	db 0 ; no more level-up moves

MachopEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, MACHOKE
	db 0 ; no more evolutions
	dbw 1, LOW_KICK
	dbw 1, LEER
	dbw 4, FOCUS_ENERGY
	; dbw 8, REVENGE
	; dbw 12, LOW_SWEEP
	dbw 16, KARATE_CHOP ; REMOVE
	; dbw 16, KNOCK_OFF
	dbw 20, SCARY_FACE
	dbw 24, VITAL_THROW
	dbw 29, STRENGTH
	; dbw 32, DUAL_CHOP
	; dbw 36, BULK_UP
	dbw 40, SEISMIC_TOSS
	dbw 44, DYNAMICPUNCH
	dbw 48, CROSS_CHOP
	; dbw 52, DOUBLE_EDGE
	dbw 52, SUBMISSION ; REMOVE
	db 0 ; no more level-up moves

MachokeEvosAttacks:
	dbbw EVOLVE_ITEM, LINK_CABLE, MACHAMP
	db 0 ; no more evolutions
	dbw 1, LOW_KICK
	dbw 1, LEER
	dbw 1, FOCUS_ENERGY
	; dbw 1, REVENGE
	; dbw 12, LOW_SWEEP
	dbw 16, KARATE_CHOP ; REMOVE
	; dbw 16, KNOCK_OFF
	dbw 20, SCARY_FACE
	dbw 24, VITAL_THROW
	dbw 31, STRENGTH
	; dbw 36, DUAL_CHOP
	; dbw 42, BULK_UP
	dbw 48, SEISMIC_TOSS
	dbw 54, DYNAMICPUNCH
	dbw 60, CROSS_CHOP
	; dbw 66, DOUBLE_EDGE
	dbw 66, SUBMISSION ; REMOVE
	db 0 ; no more level-up moves

MachampEvosAttacks:
	db 0 ; no more evolutions
	; dbw 1, WIDE_GUARD
	dbw 1, LOW_KICK
	dbw 1, LEER
	dbw 1, FOCUS_ENERGY
	; dbw 1, REVENGE
	; dbw 12, LOW_SWEEP
	dbw 16, KARATE_CHOP ; REMOVE
	; dbw 16, KNOCK_OFF
	dbw 20, SCARY_FACE
	dbw 24, VITAL_THROW
	dbw 31, STRENGTH
	; dbw 36, DUAL_CHOP
	; dbw 42, BULK_UP
	dbw 48, SEISMIC_TOSS
	dbw 54, DYNAMICPUNCH
	dbw 60, CROSS_CHOP
	; dbw 66, DOUBLE_EDGE
	dbw 66, SUBMISSION ; REMOVE
	db 0 ; no more level-up moves

BellsproutEvosAttacks:
	dbbw EVOLVE_LEVEL, 21, WEEPINBELL
	db 0 ; no more evolutions
	dbw 1, VINE_WHIP
	dbw 7, GROWTH
	dbw 11, WRAP
	dbw 13, SLEEP_POWDER
	dbw 15, POISONPOWDER
	dbw 17, STUN_SPORE
	dbw 23, ACID
	; dbw 27, KNOCK_OFF
	dbw 29, SWEET_SCENT
	; dbw 35, GASTRO_ACID
	dbw 39, RAZOR_LEAF
	; dbw 41, POISON_JAB
	dbw 47, SLAM
	; dbw 52, POWER_WHIP
	db 0 ; no more level-up moves

WeepinbellEvosAttacks:
	dbbw EVOLVE_ITEM, LEAF_STONE, VICTREEBEL
	db 0 ; no more evolutions
	dbw 1, VINE_WHIP
	dbw 1, GROWTH
	dbw 1, WRAP
	dbw 13, SLEEP_POWDER
	dbw 15, POISONPOWDER
	dbw 17, STUN_SPORE
	dbw 24, ACID
	; dbw 29, KNOCK_OFF
	dbw 32, SWEET_SCENT
	; dbw 39, GASTRO_ACID
	dbw 44, RAZOR_LEAF
	; dbw 47, POISON_JAB
	dbw 54, SLAM
	; dbw 58, POWER_WHIP
	db 0 ; no more level-up moves

VictreebelEvosAttacks:
	db 0 ; no more evolutions
	; dbw 1, LEAF_STORM ; EVOMOVE
	dbw 1, VINE_WHIP
	dbw 1, GROWTH
	dbw 1, WRAP
	dbw 1, SLEEP_POWDER
	dbw 1, POISONPOWDER
	dbw 1, STUN_SPORE
	dbw 1, ACID
	; dbw 1, KNOCK_OFF
	dbw 1, SWEET_SCENT
	; dbw 1, GASTRO_ACID
	dbw 1, RAZOR_LEAF
	; dbw 1, POISON_JAB
	dbw 1, SLAM
	; dbw 1, POWER_WHIP
	db 0 ; no more level-up moves

TentacoolEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, TENTACRUEL
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 1, WATER_GUN
	dbw 4, ACID
	dbw 8, WRAP
	dbw 12, SUPERSONIC
	; dbw 16, WATER_PULSE
	dbw 20, SCREECH
	dbw 24, BUBBLEBEAM
	; dbw 28, HEX
	dbw 32, ACID_ARMOR
	; dbw 36, POISON_JAB
	dbw 40, SURF
	; dbw 44, SLUDGE_WAVE
	dbw 49, HYDRO_PUMP
	db 0 ; no more level-up moves

TentacruelEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 1, WATER_GUN
	dbw 1, ACID
	dbw 1, WRAP
	; dbw 1, REFLECT_TYPE
	dbw 12, SUPERSONIC
	; dbw 16, WATER_PULSE
	dbw 20, SCREECH
	dbw 24, BUBBLEBEAM
	; dbw 28, HEX
	dbw 34, ACID_ARMOR
	; dbw 40, POISON_JAB
	dbw 46, SURF
	; dbw 52, SLUDGE_WAVE
	dbw 58, HYDRO_PUMP
	db 0 ; no more level-up moves

GeodudeEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, GRAVELER
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, DEFENSE_CURL
	; dbw 6, ROCK_POLISH
	dbw 10, ROLLOUT
	dbw 12, BULLDOZE
	dbw 16, ROCK_THROW
	; dbw 18, SMACK_DOWN
	dbw 18, MAGNITUDE ; REMOVE
	dbw 24, SELFDESTRUCT
	; dbw 28, STEALTH_ROCK
	; dbw 30, ROCK_BLAST
	dbw 24, EARTHQUAKE
	dbw 36, EXPLOSION
	; dbw 40, DOUBLE_EDGE
	; dbw 42, STONE_EDGE
	db 0 ; no more level-up moves

GravelerEvosAttacks:
	dbbw EVOLVE_ITEM, LINK_CABLE, GOLEM
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, DEFENSE_CURL
	; dbw 1, ROCK_POLISH
	dbw 10, ROLLOUT
	dbw 12, BULLDOZE
	dbw 16, ROCK_THROW
	; dbw 18, SMACK_DOWN
	dbw 18, MAGNITUDE ; REMOVE
	dbw 24, SELFDESTRUCT
	; dbw 30, STEALTH_ROCK
	; dbw 34, ROCK_BLAST
	dbw 40, EARTHQUAKE
	dbw 44, EXPLOSION
	; dbw 50, DOUBLE_EDGE
	; dbw 54, STONE_EDGE
	db 0 ; no more level-up moves

GolemEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, DEFENSE_CURL
	; dbw 1, ROCK_POLISH
	; dbw 1, HEAVY_SLAMl
	dbw 10, ROLLOUT
	dbw 16, ROCK_THROW
	; dbw 18, SMACK_DOWN
	dbw 18, MAGNITUDE ; REMOVE
	dbw 22, BULLDOZE
	dbw 24, SELFDESTRUCT
	; dbw 30, STEALTH_ROCK
	; dbw 34, ROCK_BLAST
	dbw 40, EARTHQUAKE
	dbw 44, EXPLOSION
	; dbw 50, DOUBLE_EDGE
	; dbw 54, STONE_EDGE
	db 0 ; no more level-up moves

PonytaEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, RAPIDASH
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 5, TAIL_WHIP
	dbw 10, EMBER
	dbw 15, FLAME_CHARGE
	dbw 20, AGILITY
	dbw 25, FLAME_WHEEL
	dbw 30, STOMP
	dbw 35, FIRE_SPIN
	dbw 41, TAKE_DOWN
	dbw 45, INFERNO
	dbw 50, FIRE_BLAST
	; dbw 55, FLARE_BLITZ
	db 0 ; no more level-up moves

RapidashEvosAttacks:
	db 0 ; no more evolutions
	; dbw 1, SMART_STRIKE ; EVOMOVE
	dbw 1, MEGAHORN
	; dbw 1, POISON_JAB
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, TAIL_WHIP
	dbw 1, QUICK_ATTACK
	dbw 1, EMBER
	dbw 15, FLAME_CHARGE
	dbw 20, AGILITY
	dbw 25, FLAME_WHEEL
	dbw 30, STOMP
	dbw 35, FIRE_SPIN
	dbw 43, TAKE_DOWN
	dbw 56, INFERNO
	dbw 63, FIRE_BLAST
	; dbw 55, FLARE_BLITZ
	db 0 ; no more level-up moves

SlowpokeEvosAttacks:
	dbbw EVOLVE_LEVEL, 37, SLOWBRO
	dbbw EVOLVE_TRADE, KINGS_ROCK, SLOWKING
	db 0 ; no more evolutions
	dbw 1, CURSE
	dbw 1, TACKLE
	dbw 3, GROWL
	dbw 6, WATER_GUN
	; dbw 9, YAWN
	dbw 12, CONFUSION
	dbw 15, DISABLE
	; dbw 18, WATER_PULSE
	dbw 21, HEADBUTT
	; dbw 24, ZEN_HEADBUTT
	dbw 27, AMNESIA
	dbw 30, SURF
	; dbw 33, SLACK_OFF
	dbw 36, PSYCHIC_M
	; dbw 39, PSYCH_UP
	dbw 42, RAIN_DANCE
	; dbw 45, HEAL_PULSE
	db 0 ; no more level-up moves

SlowbroEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WITHDRAW
	dbw 1, CURSE
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, WATER_GUN
	; dbw 9, YAWN
	dbw 12, CONFUSION
	dbw 15, DISABLE
	; dbw 18, WATER_PULSE
	dbw 21, HEADBUTT
	; dbw 24, ZEN_HEADBUTT
	dbw 27, AMNESIA
	dbw 30, SURF
	; dbw 33, SLACK_OFF
	dbw 36, PSYCHIC_M
	; dbw 41, PSYCH_UP
	dbw 46, RAIN_DANCE
	; dbw 51, HEAL_PULSE
	db 0 ; no more level-up moves

MagnemiteEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, MAGNETON
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, THUNDERSHOCK
	dbw 4, SUPERSONIC
	dbw 8, THUNDER_WAVE
	; dbw 12, ELECTRO_BALL
	; dbw 16, GYRO_BALL
	dbw 16, SONICBOOM ; REMOVE
	dbw 20, SPARK
	dbw 24, SCREECH
	; dbw 28, MAGNET_RISE
	; dbw 32, FLASH_CANNON
	; dbw 36, DISCHARGE
	; dbw 40, METAL_SOUND
	dbw 44, LIGHT_SCREEN
	dbw 48, LOCK_ON
	dbw 52, ZAP_CANNON
	db 0 ; no more level-up moves

MagnetonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, THUNDERSHOCK
	dbw 1, TRI_ATTACK ; EVOMOVE
	; dbw 1, ELECTRIC_TERRAIN
	dbw 1, SUPERSONIC
	dbw 1, THUNDER_WAVE
	; dbw 12, ELECTRO_BALL
	; dbw 16, GYRO_BALL
	dbw 16, SONICBOOM ; REMOVE
	dbw 20, SPARK
	dbw 24, SCREECH
	; dbw 28, MAGNET_RISE
	; dbw 34, FLASH_CANNON
	; dbw 40, DISCHARGE
	; dbw 46, METAL_SOUND
	dbw 52, LIGHT_SCREEN
	dbw 58, LOCK_ON
	dbw 64, ZAP_CANNON
	db 0 ; no more level-up moves

FarfetchDEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, SAND_ATTACK
	dbw 5, LEER
	dbw 10, FURY_CUTTER
	dbw 15, CUT
	dbw 19, FURY_ATTACK
	; dbw 20, AERIAL_ACE
	; dbw 25, AIR_CUTTER
	; dbw 30, KNOCK_OFF
	dbw 35, FALSE_SWIPE
	dbw 40, SLASH
	dbw 45, SWORDS_DANCE
	; dbw 50, AIR_SLASH
	; dbw 55, LEAF_BLADE
	dbw 60, AGILITY
	; dbw 65, BRAVE_BIRD
	db 0 ; no more level-up moves

DoduoEvosAttacks:
	dbbw EVOLVE_LEVEL, 31, DODRIO
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, GROWL
	dbw 5, QUICK_ATTACK
	dbw 9, FURY_ATTACK
	dbw 14, PURSUIT ; REMOVE
	; dbw 14, PLUCK
	; dbw 19, DOUBLE_HIT
	dbw 23, AGILITY
	; dbw 27, UPROAR
	; dbw 30, ACCUPRESSURE
	dbw 33, SWORDS_DANCE
	dbw 36, DRILL_PECK
	; dbw 39, ENDEAVOR
	dbw 43, THRASH
	db 0 ; no more level-up moves

DodrioEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, GROWL
	dbw 1, QUICK_ATTACK
	dbw 12, FURY_ATTACK
	dbw 15, PURSUIT ; REMOVE
	; dbw 15, PLUCK
	; dbw 19, DOUBLE_HIT
	dbw 23, AGILITY
	; dbw 26, UPROAR
	; dbw 30, ACCUPRESSURE
	dbw 34, SWORDS_DANCE
	dbw 38, DRILL_PECK
	; dbw 41, ENDEAVOR
	dbw 50, THRASH
	db 0 ; no more level-up moves

SeelEvosAttacks:
	dbbw EVOLVE_LEVEL, 34, DEWGONG
	db 0 ; no more evolutions
	dbw 1, HEADBUTT
	dbw 3, GROWL
	dbw 7, CHARM
	dbw 11, ICY_WIND
	dbw 13, ENCORE
	dbw 17, ICE_SHARD
	dbw 21, REST
	; dbw 23, AQUA_RING
	dbw 27, AURORA_BEAM
	dbw 31, AQUA_JET
	; dbw 33, BRINE
	dbw 37, TAKE_DOWN
	; dbw 41, DIVE
	dbw 43, AQUA_TAIL
	dbw 47, ICE_BEAM
	dbw 51, SAFEGUARD
	; dbw 53, SNOWSCAPE
	db 0 ; no more level-up moves

DewgongEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HEADBUTT
	; dbw 1, SHEER_COLD ; EVOMOVE
	dbw 1, GROWL
	dbw 1, CHARM
	dbw 1, ICY_WIND
	dbw 13, ENCORE
	dbw 17, ICE_SHARD
	dbw 21, REST
	; dbw 23, AQUA_RING
	dbw 27, AURORA_BEAM
	dbw 31, AQUA_JET
	; dbw 33, BRINE
	dbw 39, TAKE_DOWN
	; dbw 45, DIVE
	dbw 49, AQUA_TAIL
	dbw 55, ICE_BEAM
	dbw 61, SAFEGUARD
	; dbw 65, SNOWSCAPE
	db 0 ; no more level-up moves

GrimerEvosAttacks:
	dbbw EVOLVE_LEVEL, 38, MUK
	db 0 ; no more evolutions
	dbw 1, POISON_GAS
	dbw 1, POUND
	dbw 4, HARDEN
	; dbw 7, MUD_SLAPl
	dbw 12, DISABLE
	dbw 15, SLUDGE
	; dbw 18, MUD_SHOT
	dbw 21, MINIMIZE
	dbw 26, TOXIC
	dbw 29, SLUDGE_BOMB
	; dbw 32, SLUDGE_WAVE
	dbw 37, SCREECH
	; dbw 40, GUNK_SHOT
	dbw 43, ACID_ARMOR
	; dbw 46, BELCH
	; dbw 48, MEMENTO
	db 0 ; no more level-up moves

MukEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POISON_GAS
	dbw 1, POUND
	dbw 1, HARDEN
	dbw 1, MUD_SLAP
	dbw 12, DISABLE
	dbw 15, SLUDGE
	; dbw 18, MUD_SHOT
	dbw 21, MINIMIZE
	dbw 26, TOXIC
	dbw 29, SLUDGE_BOMB
	; dbw 32, SLUDGE_WAVE
	dbw 37, SCREECH
	; dbw 40, GUNK_SHOT
	dbw 46, ACID_ARMOR
	; dbw 52, BELCH
	; dbw 57, MEMENTO
	db 0 ; no more level-up moves

ShellderEvosAttacks:
	dbbw EVOLVE_ITEM, WATER_STONE, CLOYSTER
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, WATER_GUN
	dbw 4, WITHDRAW
	dbw 8, ICE_SHARD
	dbw 12, LEER
	; dbw 16, WHIRLPOOL
	dbw 20, SUPERSONIC
	dbw 24, AURORA_BEAM
	dbw 28, PROTECT
	; dbw 32, RAZOR_SHELL
	dbw 34, CLAMP ; REMOVE
	; dbw 36, IRON_DEFENSE
	dbw 40, ICE_BEAM
	; dbw 44, SHELL_SMASH
	dbw 48, HYDRO_PUMP
	db 0 ; no more level-up moves

CloysterEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	; dbw 1, ICICLE_SPEAR ; EVOMOVE
	; dbw 1, ICICLE_CRASH
	; dbw 1, SHELL_SMASH
	dbw 1, WATER_GUN
	dbw 4, WITHDRAW
	dbw 1, ICE_SHARD
	dbw 1, LEER
	; dbw 1, TOXIC_SPIKES
	dbw 1, SPIKES
	; dbw 1, WHIRLPOOL
	dbw 1, SUPERSONIC
	dbw 1, AURORA_BEAM
	dbw 1, PROTECT
	; dbw 1, RAZOR_SHELL
	dbw 1, CLAMP ; REMOVE
	; dbw 1, IRON_DEFENSE
	dbw 1, ICE_BEAM
	; dbw 1, SHELL_SMASH
	dbw 1, HYDRO_PUMP
	db 0 ; no more level-up moves

GastlyEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, HAUNTER
	db 0 ; no more evolutions
	dbw 1, CONFUSE_RAY
	dbw 1, LICK
	dbw 4, HYPNOSIS
	dbw 8, MEAN_LOOK
	; dbw 12, PAYBACK
	dbw 16, SPITE
	dbw 20, CURSE
	; dbw 24, HEX
	dbw 28, NIGHT_SHADE
	; dbw 32, SUCKER_PUNCH
	; dbw 36, DARK_PULSE
	dbw 40, SHADOW_BALL
	dbw 44, DESTINY_BOND
	dbw 48, DREAM_EATER
	db 0 ; no more level-up moves

HaunterEvosAttacks:
	dbbw EVOLVE_ITEM, LINK_CABLE, GENGAR
	db 0 ; no more evolutions
	; dbw 1, SHADOW_PUNCH ; EVOMOVE
	dbw 1, CONFUSE_RAY
	dbw 1, LICK
	dbw 1, HYPNOSIS
	dbw 1, MEAN_LOOK
	; dbw 12, PAYBACK
	dbw 16, SPITE
	dbw 20, CURSE
	; dbw 24, HEX
	dbw 30, NIGHT_SHADE
	; dbw 36, SUCKER_PUNCH
	; dbw 42, DARK_PULSE
	dbw 48, SHADOW_BALL
	dbw 54, DESTINY_BOND
	dbw 60, DREAM_EATER
	db 0 ; no more level-up moves

GengarEvosAttacks:
	db 0 ; no more evolutions
	; dbw 1, SHADOW_PUNCH
	dbw 1, CONFUSE_RAY
	dbw 1, LICK
	dbw 1, HYPNOSIS
	dbw 1, MEAN_LOOK
	; dbw 1, PERISH_SONG
	; dbw 1, REFLECT_TYPE
	; dbw 12, PAYBACK
	dbw 16, SPITE
	dbw 20, CURSE
	; dbw 24, HEX
	dbw 30, NIGHT_SHADE
	; dbw 36, SUCKER_PUNCH
	; dbw 42, DARK_PULSE
	dbw 48, SHADOW_BALL
	dbw 54, DESTINY_BOND
	dbw 60, DREAM_EATER
	db 0 ; no more level-up moves

OnixEvosAttacks:
	dbbw EVOLVE_TRADE, METAL_COAT, STEELIX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, HARDEN
	dbw 1, BIND
	dbw 1, ROCK_THROW
	; dbw 4, SMACK_DOWN
	; dbw 8, ROCK_POLISH
	dbw 12, DRAGONBREATH
	dbw 16, CURSE
	dbw 20, ROCK_SLIDE
	dbw 24, SCREECH
	; dbw 28, SAND_TOMB
	dbw 27, RAGE ; REMOVE
	; dbw 32, STEALTH_ROCK
	dbw 36, SLAM
	dbw 40, SANDSTORM
	dbw 44, DIG
	dbw 48, IRON_TAIL
	; dbw 52, STONE_EDGE
	; dbw 56, DOUBLE_EDGE
	db 0 ; no more level-up moves

DrowzeeEvosAttacks:
	dbbw EVOLVE_LEVEL, 26, HYPNO
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, HYPNOSIS
	dbw 5, DISABLE
	dbw 9, CONFUSION
	dbw 13, HEADBUTT
	dbw 17, POISON_GAS
	dbw 21, PSYBEAM
	dbw 25, PSYCH_UP
	; dbw 29, ZEN_HEADBUTT
	; dbw 33, SWAGGER
	dbw 37, PSYCHIC_M
	dbw 42, MEDITATE
	; dbw 41, NASTY_PLOT
	; dbw 45, PSYSHOCK
	dbw 49, FUTURE_SIGHT
	db 0 ; no more level-up moves

HypnoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, HYPNOSIS
	dbw 1, DISABLE
	dbw 1, DISABLE
	; dbw 1, SWITCHEROO
	dbw 1, CONFUSION
	dbw 13, HEADBUTT
	dbw 17, POISON_GAS
	dbw 21, PSYBEAM
	dbw 25, PSYCH_UP
	; dbw 32, ZEN_HEADBUTT
	; dbw 37, SWAGGER
	dbw 42, PSYCHIC_M
	dbw 47, MEDITATE
	; dbw 41, NASTY_PLOT
	; dbw 45, PSYSHOCK
	dbw 56, FUTURE_SIGHT
	db 0 ; no more level-up moves

KrabbyEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, KINGLER
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, LEER
	dbw 4, HARDEN
	dbw 8, METAL_CLAW
	; dbw 12, MUD_SHOT
	dbw 16, PROTECT
	dbw 20, BUBBLEBEAM
	dbw 24, STOMP
	dbw 29, FLAIL
	; dbw 32, RAZOR_SHELL
	dbw 36, SLAM
	dbw 40, SWORDS_DANCE
	dbw 44, CRABHAMMER
	dbw 48, GUILLOTINE
	db 0 ; no more level-up moves

KinglerEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, HARDEN
	; dbw 1, WIDE_GUARD
	; dbw 1, HAMMER_ARM
	dbw 1, LEER
	dbw 1, METAL_CLAW
	; dbw 12, MUD_SHOT
	dbw 16, PROTECT
	dbw 20, BUBBLEBEAM
	dbw 24, STOMP
	dbw 31, FLAIL
	; dbw 36, RAZOR_SHELL
	dbw 42, SLAM
	dbw 48, SWORDS_DANCE
	dbw 54, CRABHAMMER
	dbw 60, GUILLOTINE
	db 0 ; no more level-up moves

VoltorbEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, ELECTRODE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	; dbw 1, CHARGE
	dbw 4, THUNDERSHOCK
	; dbw 6, EERIE_IMPULSE
	dbw 9, SPARK
	dbw 11, ROLLOUT
	dbw 13, SCREECH
	; dbw 16, CHARGE_BEAM
	dbw 16, SONICBOOM ; REMOVE
	dbw 20, SWIFT
	; dbw 22, ELECTRO_BALL
	dbw 26, SELFDESTRUCT
	dbw 29, LIGHT_SCREEN
	; dbw 34, MAGNET_RISE
	; dbw 37, DISCHARGE
	dbw 41, EXPLOSION
	; dbw 46, GYRO_BALL
	dbw 50, MIRROR_COAT
	db 0 ; no more level-up moves

ElectrodeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	; dbw 1, CHARGE
	dbw 1, THUNDERSHOCK
	; dbw 1, EERIE_IMPULSE
	; dbw 1, MAGNETIC_FLUX
	dbw 9, SPARK
	dbw 11, ROLLOUT
	dbw 13, SCREECH
	; dbw 16, CHARGE_BEAM
	dbw 16, SONICBOOM ; REMOVE
	dbw 20, SWIFT
	; dbw 22, ELECTRO_BALL
	dbw 26, SELFDESTRUCT
	dbw 29, LIGHT_SCREEN
	; dbw 36, MAGNET_RISE
	; dbw 41, DISCHARGE
	dbw 47, EXPLOSION
	; dbw 54, GYRO_BALL
	dbw 58, MIRROR_COAT
	db 0 ; no more level-up moves

ExeggcuteEvosAttacks:
	dbbw EVOLVE_ITEM, LEAF_STONE, EXEGGUTOR
	db 0 ; no more evolutions
	dbw 1, BARRAGE ; REMOVE
	dbw 1, ABSORB
	dbw 1, HYPNOSIS
	dbw 5, REFLECT
	dbw 10, LEECH_SEED
	dbw 15, MEGA_DRAIN
	dbw 20, CONFUSION
	dbw 25, SYNTHESIS
	dbw 30, STUN_SPORE ; REMOVE
	; dbw 30, BULLET_SEED
	dbw 35, GIGA_DRAIN
	dbw 40, SLEEP_POWDER ; REMOVE
	; dbw 40, EXTRASENSORY
	; dbw 45, UPROAR
	; dbw 50, WORRY_SEED
	dbw 55, SOLARBEAM
	db 0 ; no more level-up moves

ExeggutorEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BARRAGE ; REMOVE
	dbw 1, ABSORB
	dbw 1, HYPNOSIS
	dbw 1, REFLECT
	dbw 1, LEECH_SEED
	; dbw 1, WOOD_HAMMER
	; dbw 1, PSYSHOCK
	dbw 1, MEGA_DRAIN
	dbw 1, CONFUSION
	dbw 1, SYNTHESIS
	dbw 1, STUN_SPORE ; REMOVE
	; dbw 1, BULLET_SEED
	dbw 1, GIGA_DRAIN
	dbw 1, SLEEP_POWDER ; REMOVE
	; dbw 1, EXTRASENSORY
	; dbw 1, UPROAR
	; dbw 1, WORRY_SEED
	dbw 1, SOLARBEAM
	db 0 ; no more level-up moves

CuboneEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, MAROWAK
	db 0 ; no more evolutions
	dbw 1, MUD_SLAP
	dbw 1, GROWL
	dbw 4, TAIL_WHIP
	dbw 12, HEADBUTT
	dbw 18, BONE_CLUB ; REMOVE
	; dbw 16, RETALIATE
	; dbw 20, FLING
	; dbw 24, STOMPING_TANTRUM
	dbw 29, BONE_RUSH
	dbw 32, FOCUS_ENERGY
	; dbw 36, ENDEAVOR
	dbw 40, BONEMERANG
	dbw 44, THRASH
	; dbw 48, DOUBLE_EDGE
	db 0 ; no more level-up moves

MarowakEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, MUD_SLAP
	dbw 1, GROWL
	dbw 1, TAIL_WHIP
	dbw 1, FALSE_SWIPE
	dbw 12, HEADBUTT
	dbw 18, BONE_CLUB ; REMOVE
	; dbw 16, RETALIATE
	; dbw 20, FLING
	; dbw 24, STOMPING_TANTRUM
	dbw 31, BONE_RUSH
	dbw 36, FOCUS_ENERGY
	; dbw 42, ENDEAVOR
	dbw 48, BONEMERANG
	dbw 54, THRASH
	; dbw 60l, DOUBLE_EDGE
	db 0 ; no more level-up moves

HitmonleeEvosAttacks:
	db 0 ; no more evolutions
	; dbw 1, BRICK_BREAK
	; dbw 1, FAKE_OUT
	dbw 1, TACKLE
	; dbw 1, HELPING_HAND
	dbw 1, FOCUS_ENERGY
	; dbw 1, LOW_SWEEP
	dbw 4, DOUBLE_KICK
	dbw 8, LOW_KICK
	dbw 12, ENDURE
	dbw 16, MEDITATE ; REMOVE
	; dbw 16, SUCKER_PUNCH
	; dbw 21, WIDE_GUARD
	dbw 20, ROLLING_KICK ; REMOVE
	dbw 26, JUMP_KICK ; REMOVE
	; dbw 24, BLAZE_KICK
	; dbw 28, FEINT
	dbw 32, MEGA_KICK
	; dbw 36, CLOSE_COMBAT
	dbw 40, REVERSAL
	dbw 44, HI_JUMP_KICK
	; dbw 50, AXE_KICK
	dbw 31, MIND_READER
	dbw 36, FORESIGHT
	db 0 ; no more level-up moves

HitmonchanEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, DRAIN_PUNCH ; EVOMOVE
	; dbw 1, FEINT
	dbw 1, TACKLE
	; dbw 1, HELPING_HAND
	; dbw 1, FAKE_OUT
	dbw 1, FOCUS_ENERGY
	dbw 1, COMET_PUNCH ; REMOVE
	; dbw 4, MACH_PUNCH
	; dbw 8, VACUUM_WAVE
	dbw 12, DETECT
	; dbw 16, BULLET_PUNCH
	; dbw 21, QUICK_GUARD
	dbw 24, THUNDERPUNCH
	dbw 24, ICE_PUNCH
	dbw 24, FIRE_PUNCH
	dbw 28, AGILITY
	dbw 32, MEGA_PUNCH
	; dbw 36, CLOSE_COMBAT
	dbw 40, COUNTER
	; dbw 44, FOCUS_PUNCH
	db 0 ; no more level-up moves

LickitungEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LICK
	dbw 1, DEFENSE_CURL
	dbw 6, ROLLOUT
	dbw 12, SUPERSONIC
	dbw 18, WRAP
	dbw 24, DISABLE
	dbw 30, STOMP
	dbw 36, SCREECH ; REMOVE
	; dbw 36, KNOCK_OFF
	dbw 48, SLAM
	; dbw 54, POWER_WHIP
	dbw 60, BELLY_DRUM
	db 0 ; no more level-up moves

KoffingEvosAttacks:
	dbbw EVOLVE_LEVEL, 35, WEEZING
	db 0 ; no more evolutions
	dbw 1, POISON_GAS
	dbw 1, TACKLE
	dbw 4, SMOG
	dbw 8, SMOKESCREEN
	; dbw 12, CLEAR_SMOG
	; dbw 16, ASSURANCE
	dbw 20, SLUDGE
	dbw 24, HAZE
	dbw 28, SELFDESTRUCT
	dbw 32, SLUDGE_BOMB
	dbw 36, TOXIC
	; dbw 40, BELCH
	dbw 44, EXPLOSION
	; dbw 48, MEMENTO
	dbw 52, DESTINY_BOND
	db 0 ; no more level-up moves

WeezingEvosAttacks:
	db 0 ; no more evolutions
	; dbw 1, DOUBLE_HIT ; EVOMOVE
	dbw 1, POISON_GAS
	dbw 1, TACKLE
	dbw 1, SMOG
	dbw 1, SMOKESCREEN
	; dbw 12, CLEAR_SMOG
	; dbw 16, ASSURANCE
	dbw 20, SLUDGE
	dbw 24, HAZE
	dbw 28, SELFDESTRUCT
	dbw 32, SLUDGE_BOMB
	dbw 38, TOXIC
	; dbw 44, BELCH
	dbw 50, EXPLOSION
	; dbw 56, MEMENTO
	dbw 62, DESTINY_BOND
	db 0 ; no more level-up moves

RhyhornEvosAttacks:
	dbbw EVOLVE_LEVEL, 42, RHYDON
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	; dbw 5, SMACK_DOWN
	dbw 10, BULLDOZE
	dbw 15, HORN_ATTACK
	dbw 20, SCARY_FACE
	dbw 25, STOMP
	; dbw 30, ROCK_BLAST
	; dbw 35, DRILL_RUN
	dbw 40, TAKE_DOWN
	dbw 45, EARTHQUAKE
	; dbw 50, STONE_EDGE
	dbw 55, MEGAHORN
	dbw 60, HORN_DRILL
	db 0 ; no more level-up moves

RhydonEvosAttacks:
	db 0 ; no more evolutions
	; dbw 1, HAMMER_ARM
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	; dbw 1, SMACK_DOWN
	dbw 1, BULLDOZE
	dbw 15, HORN_ATTACK
	dbw 20, SCARY_FACE
	dbw 25, STOMP
	; dbw 30, ROCK_BLAST
	; dbw 35, DRILL_RUN
	dbw 40, TAKE_DOWN
	dbw 47, EARTHQUAKE
	; dbw 54, STONE_EDGE
	dbw 61, MEGAHORN
	dbw 68, HORN_DRILL
	db 0 ; no more level-up moves

ChanseyEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, BLISSEY
	db 0 ; no more evolutions
	dbw 1, CHARM
	; dbw 1, COPYCAT
	; dbw 1, COVET
	; dbw 1, DISARMING_VOICE
	dbw 1, SWEET_KISS
	dbw 1, POUND
	dbw 1, DEFENSE_CURL
	dbw 4, TAIL_WHIP
	; dbw 8, ECHOED_VOICE
	; dbw 12, LIFE_DEW
	dbw 16, SING
	; dbw 20, FLING
	dbw 20, DOUBLESLAP ; REMOVE
	dbw 24, TAKE_DOWN
	dbw 28, EGG_BOMB ; REMOVE
	; dbw 28, HEAL_PULSE
	; dbw 32, HELPING_HAND
	dbw 36, LIGHT_SCREEN
	; dbw 40, DOUBLE_EDGE
	dbw 44, SOFTBOILED
	db 0 ; no more level-up moves

TangelaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BIND
	dbw 1, ABSORB
	dbw 4, STUN_SPORE
	dbw 8, GROWTH
	dbw 12, MEGA_DRAIN
	dbw 16, VINE_WHIP
	dbw 20, POISONPOWDER
	dbw 24, ANCIENTPOWER
	; dbw 28, KNOCK_OFF
	dbw 32, GIGA_DRAIN
	dbw 36, SLEEP_POWDER
	dbw 40, SLAM
	; dbw 44, TICKLE
	; dbw 48, POWER_WHIP
	; dbw 52, INGRAIN
	; dbw 56, GRASSY_TERRAIN
	db 0 ; no more level-up moves

KangaskhanEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, COMET_PUNCH
	dbw 1, TAIL_WHIP
	dbw 4, GROWL
	dbw 1, POUND
	dbw 12, BITE
	dbw 16, STOMP
	dbw 20, FOCUS_ENERGY
	dbw 24, HEADBUTT
	; dbw 28, SUCKER_PUNCH
	; dbw 32, DOUBLE_HIT
	dbw 32, MEGA_PUNCH ; REMOVE
	dbw 36, CRUNCH
	dbw 40, ENDURE
	dbw 44, REVERSAL
	dbw 48, OUTRAGE
	dbw 52, DIZZY_PUNCH
	; dbw 52, LAST_RESORT ; REMOVE
	db 0 ; no more level-up moves

HorseaEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, SEADRA
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, WATER_GUN
	dbw 5, SMOKESCREEN
	dbw 10, TWISTER
	dbw 15, FOCUS_ENERGY
	dbw 20, DRAGONBREATH
	dbw 25, BUBBLEBEAM
	dbw 30, AGILITY
	; dbw 35, WATER_PULSE
	dbw 40, DRAGON_PULSE
	dbw 45, HYDRO_PUMP
	; dbw 50, DRAGON_DANCE
	dbw 55, RAIN_DANCE
	db 0 ; no more level-up moves

SeadraEvosAttacks:
	dbbw EVOLVE_TRADE, DRAGON_SCALE, KINGDRA
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, WATER_GUN
	dbw 1, SMOKESCREEN
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
	db 0 ; no more level-up moves

GoldeenEvosAttacks:
	dbbw EVOLVE_LEVEL, 33, SEAKING
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, TAIL_WHIP
	dbw 5, SUPERSONIC
	; dbw 10, WATER_PULSE
	dbw 15, HORN_ATTACK
	dbw 20, AGILITY
	; dbw 25, AQUA_RING
	dbw 25, FURY_ATTACK ; REMOVE
	dbw 30, FLAIL
	dbw 35, WATERFALL
	; dbw 40, SOAK
	dbw 45, MEGAHORN
	dbw 50, HORN_DRILL
	db 0 ; no more level-up moves

SeakingEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, TAIL_WHIP
	dbw 1, SUPERSONIC
	; dbw 1, WATER_PULSE
	dbw 15, HORN_ATTACK
	dbw 20, AGILITY
	; dbw 25, AQUA_RING
	dbw 25, FURY_ATTACK ; REMOVE
	dbw 30, FLAIL
	dbw 37, WATERFALL
	; dbw 44, SOAK
	dbw 51, MEGAHORN
	dbw 58, HORN_DRILL
	db 0 ; no more level-up moves

StaryuEvosAttacks:
	dbbw EVOLVE_ITEM, WATER_STONE, STARMIE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, HARDEN
	dbw 4, WATER_GUN
	dbw 12, RAPID_SPIN
	dbw 16, MINIMIZE
	dbw 20, SWIFT
	dbw 24, PSYBEAM
	dbw 28, BUBBLEBEAM ; REMOVE
	; dbw 28, BRINE
	dbw 32, LIGHT_SCREEN
	; dbw 36, POWER_GEM
	dbw 40, PSYCHIC_M
	dbw 44, SURF
	dbw 48, RECOVER
	; dbw 52, COSMIC_POWER
	dbw 56, HYDRO_PUMP
	db 0 ; no more level-up moves

StarmieEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, HARDEN
	dbw 1, WATER_GUN
	dbw 1, RAPID_SPIN
	dbw 1, CONFUSE_RAY
	dbw 1, MINIMIZE
	dbw 1, SWIFT
	dbw 1, PSYBEAM
	dbw 1, BUBBLEBEAM ; REMOVE
	; dbw 1, BRINE
	dbw 1, LIGHT_SCREEN
	; dbw 1, POWER_GEM
	dbw 1, PSYCHIC_M
	dbw 1, SURF
	dbw 1, RECOVER
	; dbw 1, COSMIC_POWER
	dbw 1, HYDRO_PUMP
	db 0 ; no more level-up moves

MrMimeEvosAttacks:
	db 0 ; no more evolutions
	; dbw 1, WIDE_GUARD
	; dbw 1, QUICK_GUARD
	; dbw 1, POWER_SWAP
	; dbw 1, GUARD_SWAP
	dbw 1, POUND
	; dbw 1, COPYCAT
	dbw 1, BATON_PASS
	dbw 1, ENCORE
	dbw 6, BARRIER ; REMOVE
	dbw 12, CONFUSION
	dbw 16, SUBSTITUTE ; REMOVE
	; dbw 16, ROLE_PLAY
	dbw 20, PROTECT
	dbw 24, MEDITATE ; REMOVE
	; dbw 24, RECYCLE
	dbw 28, PSYBEAM
	dbw 32, MIMIC
	dbw 36, SAFEGUARD
	dbw 36, LIGHT_SCREEN 
	dbw 36, REFLECT
	; dbw 40, SUCKER_PUNCH
	; dbw 44, DAZZLING_GLEAM
	dbw 48, PSYCHIC_M
	; dbw 52, TEETER_DANCE
	db 0 ; no more level-up moves

ScytherEvosAttacks:
	dbbw EVOLVE_TRADE, METAL_COAT, SCIZOR
	db 0 ; no more evolutions
	dbw 1, QUICK_ATTACK
	dbw 1, LEER
	dbw 4, FURY_CUTTER
	dbw 8, FALSE_SWIPE
	dbw 12, WING_ATTACK
	dbw 16, DOUBLE_TEAM
	; dbw 20, DOUBLE_HIT
	dbw 20, PURSUIT ; REMOVE
	dbw 24, SLASH
	dbw 28, FOCUS_ENERGY
	dbw 32, AGILITY
	; dbw 36, AIR_SLASH
	dbw 40, X_SCISSOR
	dbw 44, SWORDS_DANCE
	db 0 ; no more level-up moves

JynxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SWEET_KISS
	dbw 1, POUND
	dbw 1, LICK
	dbw 1, POWDER_SNOW
	; dbw 1, COPYCAT
	dbw 12, CONFUSION
	; dbw 16, COVET
	dbw 20, SING
	; dbw 24, FAKE_TEARS
	dbw 24, DOUBLESLAP ; REMOVE
	dbw 28, ICE_PUNCH
	dbw 34, PSYCHIC_M
	dbw 40, LOVELY_KISS
	dbw 46, MEAN_LOOK
	dbw 52, PERISH_SONG
	dbw 58, BLIZZARD
	db 0 ; no more level-up moves

ElectabuzzEvosAttacks:
	dbbw EVOLVE_ITEM, LINK_CABLE, ELECTIVIRE; no more evolutions
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

MagmarEvosAttacks:
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

PinsirEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, VICEGRIP
	dbw 1, HARDEN
	dbw 4, FOCUS_ENERGY
	dbw 8, BIND
	dbw 12, SEISMIC_TOSS
	; dbw 16, BUG_BITE
	; dbw 20, STORM_THROW
	; dbw 24, DOUBLE_HIT
	dbw 28, VITAL_THROW
	dbw 32, X_SCISSOR
	dbw 36, STRENGTH
	dbw 40, SWORDS_DANCE
	dbw 44, SUBMISSION
	dbw 48, GUILLOTINE
	; dbw 52, SUPERPOWER
	db 0 ; no more level-up moves

TaurosEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	; dbw 5, WORK_UP
	; dbw 10, PAYBACK
	dbw 10, RAGE ; REMOVE
	; dbw 15, ASSURANCE
	dbw 20, HORN_ATTACK
	dbw 25, SCARY_FACE
	dbw 34, PURSUIT ; REMOVE
	; dbw 30, ZEN_HEADBUTT
	; dbw 35, RAGING_BULL
	; dbw 40, REST
	; dbw 45, SWAGGER
	dbw 50, THRASH
	dbw 53, TAKE_DOWN ; REMOVE
	; dbw 55, DOUBLE_EDGE
	; dbw 60, GIGA_IMPACT
	db 0 ; no more level-up moves

MagikarpEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, GYARADOS
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 15, TACKLE
	dbw 25, FLAIL
	db 0 ; no more level-up moves

GyaradosEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 1, BITE ; EVOMOVE
	dbw 1, TWISTER
	dbw 1, FLAIL
	dbw 1, SPLASH
	dbw 4, WHIRLPOOL
	dbw 8, ICE_FANG
	; dbw 12, BRINE
	dbw 12, DRAGON_RAGE ; REMOVE
	dbw 16, SCARY_FACE
	dbw 21, WATERFALL
	dbw 24, CRUNCH
	dbw 28, RAIN_DANCE
	dbw 32, AQUA_TAIL
	; dbw 36, DRAGON_DANCE
	dbw 40, HYDRO_PUMP
	; dbw 44, HURRICANE
	dbw 48, THRASH
	dbw 52, HYPER_BEAM
	db 0 ; no more level-up moves

LaprasEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, GROWL
	dbw 5, SING
	dbw 10, MIST
	; dbw 15, LIFE_DEW
	dbw 20, ICE_SHARD
	dbw 25, CONFUSE_RAY
	; dbw 30, WATER_PULSE
	dbw 32, SAFEGUARD
	; dbw 35, BRINE
	dbw 40, BODY_SLAM
	dbw 45, ICE_BEAM
	dbw 50, RAIN_DANCE
	dbw 55, HYDRO_PUMP
	dbw 60, PERISH_SONG
	; dbw 65, SHEER_COLD
	db 0 ; no more level-up moves

DittoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TRANSFORM
	db 0 ; no more level-up moves

EeveeEvosAttacks:
	dbbw EVOLVE_ITEM, THUNDERSTONE, JOLTEON
	dbbw EVOLVE_ITEM, WATER_STONE, VAPOREON
	dbbw EVOLVE_ITEM, FIRE_STONE, FLAREON
	dbbw EVOLVE_ITEM, MOON_STONE, ESPEON
	dbbw EVOLVE_ITEM, SUN_STONE, UMBREON
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, SYLVEON
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 1, GROWL
	; dbw 1, COVET
	dbw 5, SAND_ATTACK
	dbw 10, QUICK_ATTACK
	; dbw 15, BABY_DOLL_EYES
	dbw 20, SWIFT
	dbw 25, BITE
	; dbw 30, COPYCAT
	dbw 35, BATON_PASS
	dbw 40, TAKE_DOWN
	dbw 45, CHARM
	; dbw 50, DOUBLE_EDGE
	; dbw 55, LAST_RESORT
	db 0 ; no more level-up moves

VaporeonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN ; EVOMOVE
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	; dbw 1, DOUBLE_EDGE
	dbw 1, TAKE_DOWN
	dbw 1, BITE
	dbw 1, GROWL
	; dbw 1, COPYCAT
	; dbw 1, COVET
	; dbw 1, HELPING_HAND
	dbw 1, SWIFT
	dbw 1, BATON_PASS
	dbw 1, CHARM
	dbw 5, SAND_ATTACK
	dbw 10, QUICK_ATTACK
	; dbw 15, BABY_DOLL_EYES
	dbw 20, HAZE
	; dbw 25, WATER_PULSE
	dbw 30, AURORA_BEAM
	; dbw 35, AQUA_RING
	; dbw 40, MUDDY_WATER
	dbw 45, ACID_ARMOR
	dbw 50, HYDRO_PUMP
	; dbw 55, LAST_RESORT
	db 0 ; no more level-up moves

JolteonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK ; EVOMOVE
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	; dbw 1, DOUBLE_EDGE
	dbw 1, TAKE_DOWN
	dbw 1, BITE
	dbw 1, GROWL
	; dbw 1, COPYCAT
	; dbw 1, COVET
	; dbw 1, HELPING_HAND
	dbw 1, SWIFT
	dbw 1, BATON_PASS
	dbw 1, CHARM
	dbw 5, SAND_ATTACK
	dbw 10, QUICK_ATTACK
	; dbw 15, BABY_DOLL_EYES
	dbw 20, THUNDER_WAVE
	dbw 25, DOUBLE_KICK
	dbw 30, THUNDER_FANG
	dbw 35, PIN_MISSILE
	; dbw 40, DISCHARGE
	dbw 45, AGILITY
	dbw 50, THUNDER
	; dbw 55, LAST_RESORT
	db 0 ; no more level-up moves

FlareonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EMBER ; EVOMOVE
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	; dbw 1, DOUBLE_EDGE
	dbw 1, TAKE_DOWN
	dbw 1, BITE
	dbw 1, GROWL
	; dbw 1, COPYCAT
	; dbw 1, COVET
	; dbw 1, HELPING_HAND
	dbw 1, SWIFT
	dbw 1, BATON_PASS
	dbw 1, CHARM
	dbw 5, SAND_ATTACK
	dbw 10, QUICK_ATTACK
	; dbw 15, BABY_DOLL_EYES
	dbw 20, SMOG
	dbw 30, FIRE_FANG
	dbw 35, FIRE_SPIN
	dbw 40, LAVA_PLUME
	dbw 45, SCARY_FACE
	; dbw 50, FLARE_BLITZ
	; dbw 55, LAST_RESORT
	dbw 52, FLAMETHROWER ; REMOVE
	db 0 ; no more level-up moves

PorygonEvosAttacks:
	dbbw EVOLVE_TRADE, UP_GRADE, PORYGON2
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, CONVERSION
	; dbw 5, RECYCLE
	; dbw 10, MAGNET_RISE
	dbw 10, SHARPEN ; REMOVE
	dbw 15, THUNDERSHOCK
	dbw 20, PSYBEAM
	dbw 25, CONVERSION2
	dbw 30, AGILITY
	dbw 35, RECOVER
	; dbw 40, DISCHARGE
	dbw 45, TRI_ATTACK
	; dbw 50, DOUBLE_EDGE
	dbw 55, LOCK_ON
	dbw 60, ZAP_CANNON
	db 0 ; no more level-up moves

OmanyteEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, OMASTAR
	db 0 ; no more evolutions
	dbw 1, BIND
	dbw 1, WITHDRAW
	dbw 5, ROLLOUT
	dbw 10, SAND_ATTACK
	dbw 15, WATER_GUN
	dbw 20, LEER
	; dbw 25, MUD_SHOT
	dbw 25, CONSTRICT ; REMOVE
	dbw 30, ANCIENTPOWER
	; dbw 35, BRINE
	dbw 41, PROTECT
	; dbw 45, ROCK_BLAST
	dbw 50, SURF
	; dbw 55, SHELL_SMASH
	dbw 60, HYDRO_PUMP
	db 0 ; no more level-up moves

OmastarEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CRUNCH ; EVOMOVE
	dbw 1, BIND
	dbw 1, WITHDRAW
	dbw 1, ROLLOUT
	dbw 1, SAND_ATTACK
	dbw 15, WATER_GUN
	dbw 20, LEER
	; dbw 25, MUD_SHOT
	dbw 25, CONSTRICT ; REMOVE
	dbw 30, ANCIENTPOWER
	; dbw 35, BRINE
	dbw 43, PROTECT
	; dbw 49, ROCK_BLAST
	dbw 56, SURF
	; dbw 63, SHELL_SMASH
	dbw 70, HYDRO_PUMP
	db 0 ; no more level-up moves

KabutoEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, KABUTOPS
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, HARDEN
	dbw 5, SCRATCH
	dbw 10, SAND_ATTACK
	dbw 15, AQUA_JET
	dbw 20, LEER
	; dbw 25, MUD_SHOT
	dbw 30, ANCIENTPOWER
	; dbw 35, BRINE
	dbw 41, PROTECT
	dbw 45, LEECH_LIFE
	dbw 50, MEGA_DRAIN ; REMOVE
	; dbw 50, LIQUIDATION
	dbw 55, ENDURE ; REMOVE
	; dbw 55, METAL_SOUND
	; dbw 60, STONE_EDGE
	db 0 ; no more level-up moves

KabutopsEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SLASH ; EVOMOVE
	; dbw 1, NIGHT_SLASH
	; dbw 1, FEINT
	dbw 1, ABSORB
	dbw 1, HARDEN
	dbw 5, SCRATCH
	dbw 1, SAND_ATTACK
	dbw 15, AQUA_JET
	dbw 20, LEER
	; dbw 25, MUD_SHOT
	dbw 30, ANCIENTPOWER
	; dbw 35, BRINE
	dbw 43, PROTECT
	dbw 49, LEECH_LIFE
	dbw 56, MEGA_DRAIN ; REMOVE
	; dbw 56, LIQUIDATION
	dbw 60, ENDURE ; REMOVE
	; dbw 63, METAL_SOUND
	; dbw 70, STONE_EDGE
	db 0 ; no more level-up moves

AerodactylEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, ANCIENTPOWER
	dbw 5, SUPERSONIC
	dbw 10, WING_ATTACK
	dbw 15, SCARY_FACE
	dbw 20, ROCK_SLIDE
	dbw 25, ROAR
	dbw 30, CRUNCH
	; dbw 35, IRON_HEAD
	dbw 40, TAKE_DOWN
	; dbw 45, STONE_EDGE
	dbw 50, AGILITY
	dbw 55, HYPER_BEAM
	; dbw 60, GIGA_IMPACT
	db 0 ; no more level-up moves

SnorlaxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	; dbw 1, LAST_RESORT
	; dbw 1, SWALLOW
	dbw 1, SCREECH
	dbw 1, DEFENSE_CURL
	dbw 1, METRONOME
	dbw 1, LICK
	; dbw 1, FLING
	; dbw 1, RECYCLE
	; dbw 1, STOCKPILE
	dbw 1, FLAIL
	; dbw 1, COVET
	; dbw 1, BLOCK
	; dbw 12, YAWN
	dbw 16, BITE
	dbw 18, HEADBUTT ; REMOVE
	dbw 20, SNORE
	; dbw 20, SLEEP_TALK
	dbw 20, REST
	dbw 24, CRUNCH
	dbw 28, BODY_SLAM
	; dbw 32, HEAVY_SLAM
	dbw 36, AMNESIA
	; dbw 40, HIGH_HORSEPOWER
	dbw 40, ROLLOUT ; REMOVE
	; dbw 44, HAMMER_ARM
	dbw 48, BELLY_DRUM
	; dbw 52, BELCH
	dbw 56, HYPER_BEAM ; REMOVE
	; dbw 56, GIGA_IMPACT
	db 0 ; no more level-up moves

ArticunoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GUST
	dbw 1, MIST
	dbw 5, POWDER_SNOW
	dbw 10, REFLECT
	dbw 15, ICE_SHARD
	dbw 20, AGILITY
	dbw 25, ANCIENTPOWER
	; dbw 30, TAILWIND
	; dbw 35, FREEZE_DRY
	dbw 35, MIND_READER ; REMOVE
	; dbw 40, ROOST
	dbw 45, ICE_BEAM
	; dbw 50, SNOWSCAPE
	; dbw 55, HURRICANE
	dbw 60, HAZE
	dbw 65, BLIZZARD
	; dbw 70, SHEER_COLD
	db 0 ; no more level-up moves

ZapdosEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, THUNDER_WAVE
	dbw 5, THUNDERSHOCK
	dbw 10, LIGHT_SCREEN
	; dbw 15, PLUCK
	dbw 20, AGILITY
	dbw 25, ANCIENTPOWER
	; dbw 30, CHARGE
	dbw 35, DRILL_PECK
	; dbw 40, ROOST
	; dbw 45, DISCHARGE
	dbw 50, RAIN_DANCE
	dbw 55, THUNDER
	dbw 60, DETECT
	; dbw 65, MAGNETIC_FLUX
	dbw 70, ZAP_CANNON
	db 0 ; no more level-up moves

MoltresEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GUST
	dbw 1, LEER
	dbw 5, EMBER
	dbw 10, SAFEGUARD
	dbw 15, WING_ATTACK
	dbw 20, AGILITY
	dbw 25, ANCIENTPOWER
	dbw 30, FIRE_SPIN ; REMOVE
	dbw 35, FLAMETHROWER ; REMOVE
	; dbw 30, INCINERATE
	; dbw 35, AIR_SLASH
	; dbw 40, ROOST
	; dbw 45, HEAT_WAVE
	dbw 50, SUNNY_DAY
	; dbw 55, HURRICANE
	dbw 60, ENDURE
	dbw 65, OVERHEAT
	dbw 70, SKY_ATTACK
	db 0 ; no more level-up moves

DratiniEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, DRAGONAIR
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LEER
	dbw 5, TWISTER
	dbw 10, THUNDER_WAVE
	; dbw 15, DRAGON_TAIL
	dbw 20, AGILITY
	dbw 25, SLAM
	dbw 31, AQUA_TAIL
	; dbw 35, DRAGON_RUSH
	dbw 40, SAFEGUARD
	dbw 45, RAIN_DANCE
	; dbw 50, DRAGON_DANCE
	dbw 55, OUTRAGE
	dbw 60, HYPER_BEAM
	db 0 ; no more level-up moves

DragonairEvosAttacks:
	dbbw EVOLVE_LEVEL, 55, DRAGONITE
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LEER
	dbw 1, TWISTER
	dbw 1, THUNDER_WAVE
	; dbw 15, DRAGON_TAIL
	dbw 20, AGILITY
	dbw 25, SLAM
	dbw 33, AQUA_TAIL
	; dbw 39, DRAGON_RUSH
	dbw 46, SAFEGUARD
	dbw 53, RAIN_DANCE
	; dbw 60, DRAGON_DANCE
	dbw 67, OUTRAGE
	dbw 74, HYPER_BEAM
	db 0 ; no more level-up moves

DragoniteEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LEER
	dbw 1, TWISTER
	dbw 1, THUNDER_WAVE
	; dbw 15, DRAGON_TAIL
	dbw 20, AGILITY
	dbw 25, SLAM
	dbw 33, AQUA_TAIL
	; dbw 39, DRAGON_RUSH
	dbw 41, OUTRAGE
	dbw 46, SAFEGUARD
	dbw 53, RAIN_DANCE
	; dbw 52, DRAGON_DANCE
	dbw 80, HYPER_BEAM
	db 0 ; no more level-up moves

MewtwoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, DISABLE
	dbw 1, SWIFT
	; dbw 1, LIFE_DEW
	dbw 8, ANCIENTPOWER
	dbw 16, BARRIER ; REMOVE
	; dbw 16, PSYCHO_CUT
	dbw 24, SAFEGUARD
	dbw 32, AMNESIA
	; dbw 40, AURA_SPHERE
	dbw 48, PSYCHIC_M
	dbw 56, PSYCH_UP ; REMOVEl
	; dbw 56, POWER_SWAP
	; dbw 56, GUARD_SWAP
	dbw 64, MIST
	; dbw 72, PSYSTRIKE
	dbw 80, RECOVER
	dbw 88, FUTURE_SIGHT
	dbw 11, BARRIER
	db 0 ; no more level-up moves

MewEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	; dbw 1, REFLECT_TYPE
	dbw 10, AMNESIA
	dbw 20, BATON_PASS
	dbw 30, ANCIENTPOWER
	; dbw 40, LIFE_DEW
	; dbw 50, NASTY_PLOT
	dbw 60, METRONOME
	; dbw 70, IMPRISON
	dbw 80, TRANSFORM
	; dbw 90, AURA_SPHERE
	dbw 100, PSYCHIC_M
	db 0 ; no more level-up moves
