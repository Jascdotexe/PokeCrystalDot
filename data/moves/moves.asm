; Characteristics of each move.

MACRO move
	; the animation byte will be filled when the move is loaded
	db \1 ; effect
	db \2 ; power
	db \3 | \4 ; type
	db \5 percent ; accuracy
	db \6 ; pp
	db \7 percent ; effect chance
ENDM


Moves::
; entries correspond to constants/move_constants.asm
	indirect_table MOVE_LENGTH - 1, 1
	indirect_entries NUM_ATTACKS, Moves1
	indirect_table_end

Moves1:
	move EFFECT_NORMAL_HIT,         40, NORMAL,        PHYSICAL, 100, 35,   0
	move EFFECT_NORMAL_HIT,         50, FIGHTING,      PHYSICAL, 100, 25,   0
	move EFFECT_MULTI_HIT,          15, NORMAL,        PHYSICAL,  85, 10,   0
	move EFFECT_MULTI_HIT,          18, NORMAL,        PHYSICAL,  85, 15,   0
	move EFFECT_NORMAL_HIT,         80, NORMAL,        PHYSICAL,  85, 20,   0
	move EFFECT_PAY_DAY,            40, NORMAL,        PHYSICAL, 100, 20,   0
	move EFFECT_BURN_HIT,           75, FIRE,          PHYSICAL, 100, 15,  10
	move EFFECT_FREEZE_HIT,         75, ICE,           PHYSICAL, 100, 15,  10
	move EFFECT_PARALYZE_HIT,       75, ELECTRIC,      PHYSICAL, 100, 15,  10
	move EFFECT_NORMAL_HIT,         40, NORMAL,        PHYSICAL, 100, 35,   0
	move EFFECT_NORMAL_HIT,         55, NORMAL,        PHYSICAL, 100, 30,   0
	move EFFECT_OHKO,                0, NORMAL,        PHYSICAL,  30,  5,   0
	move EFFECT_RAZOR_WIND,         80, NORMAL,        SPECIAL,   75, 10,   0
	move EFFECT_ATTACK_UP_2,         0, NORMAL,        STATUS,   100, 30,   0
	move EFFECT_NORMAL_HIT,         50, NORMAL,        PHYSICAL,  95, 30,   0
	move EFFECT_GUST,               40, FLYING,        SPECIAL,  100, 35,   0
	move EFFECT_NORMAL_HIT,         60, FLYING,        PHYSICAL, 100, 35,   0
	move EFFECT_FORCE_SWITCH,        0, NORMAL,        STATUS,   100, 20,   0
	move EFFECT_FLY,                70, FLYING,        PHYSICAL,  95, 15,   0
	move EFFECT_TRAP_TARGET,        15, NORMAL,        PHYSICAL,  75, 20,   0
	move EFFECT_NORMAL_HIT,         80, NORMAL,        PHYSICAL,  75, 20,   0
	move EFFECT_NORMAL_HIT,         35, GRASS,         PHYSICAL, 100, 10,   0
	move EFFECT_STOMP,              65, NORMAL,        PHYSICAL, 100, 20,  30
	move EFFECT_DOUBLE_HIT,         30, FIGHTING,      PHYSICAL, 100, 30,   0
	move EFFECT_NORMAL_HIT,        120, NORMAL,        PHYSICAL,  75,  5,   0
	move EFFECT_JUMP_KICK,          70, FIGHTING,      PHYSICAL,  95, 25,   0
	move EFFECT_FLINCH_HIT,         60, FIGHTING,      PHYSICAL,  85, 15,  30
	move EFFECT_ACCURACY_DOWN,       0, GROUND,        STATUS,   100, 15,   0
	move EFFECT_FLINCH_HIT,         70, NORMAL,        PHYSICAL, 100, 15,  30
	move EFFECT_NORMAL_HIT,         65, NORMAL,        PHYSICAL, 100, 25,   0
	move EFFECT_MULTI_HIT,          15, NORMAL,        PHYSICAL,  85, 20,   0
	move EFFECT_OHKO,                1, NORMAL,        PHYSICAL,  30,  5,   0
	move EFFECT_NORMAL_HIT,         35, NORMAL,        PHYSICAL,  95, 35,   0
	move EFFECT_PARALYZE_HIT,       85, NORMAL,        PHYSICAL, 100, 15,  30
	move EFFECT_TRAP_TARGET,        15, NORMAL,        PHYSICAL,  85, 20,   0
	move EFFECT_RECOIL_HIT,         90, NORMAL,        PHYSICAL,  85, 20,   0
	move EFFECT_RAMPAGE,            90, NORMAL,        PHYSICAL, 100, 20,   0
	move EFFECT_RECOIL_HIT,        120, NORMAL,        PHYSICAL, 100, 15,   0
	move EFFECT_DEFENSE_DOWN,        0, NORMAL,        STATUS,   100, 30,   0
	move EFFECT_POISON_HIT,         15, POISON,        PHYSICAL, 100, 35,  30
	move EFFECT_POISON_MULTI_HIT,   25, BUG,           PHYSICAL, 100, 20,  20
	move EFFECT_MULTI_HIT,          14, BUG,           PHYSICAL,  85, 20,   0
	move EFFECT_DEFENSE_DOWN,        0, NORMAL,        STATUS,   100, 30,   0
	move EFFECT_FLINCH_HIT,         60, DARK,          PHYSICAL, 100, 25,  30
	move EFFECT_ATTACK_DOWN,         0, NORMAL,        STATUS,   100, 40,   0
	move EFFECT_FORCE_SWITCH,        0, NORMAL,        STATUS,   100, 20,   0
	move EFFECT_SLEEP,               0, NORMAL,        STATUS,    55, 15,   0
	move EFFECT_CONFUSE,             0, NORMAL,        STATUS,    55, 20,   0
	move EFFECT_STATIC_DAMAGE,      20, NORMAL,        SPECIAL,   90, 20,   0
	move EFFECT_DISABLE,             0, NORMAL,        STATUS,    55, 20,   0
	move EFFECT_DEFENSE_DOWN_HIT,   40, POISON,        SPECIAL,  100, 30,  10
	move EFFECT_BURN_HIT,           40, FIRE,          SPECIAL,  100, 25,  10
	move EFFECT_BURN_HIT,           95, FIRE,          SPECIAL,  100, 15,  10
	move EFFECT_MIST,                0, ICE,           STATUS,   100, 30,   0
	move EFFECT_NORMAL_HIT,         40, WATER,         SPECIAL,  100, 25,   0
	move EFFECT_NORMAL_HIT,        120, WATER,         SPECIAL,   80,  5,   0
	move EFFECT_NORMAL_HIT,         95, WATER,         SPECIAL,  100, 15,   0
	move EFFECT_FREEZE_HIT,         95, ICE,           SPECIAL,  100, 10,  10
	move EFFECT_FREEZE_HIT,        120, ICE,           SPECIAL,   70,  5,  10
	move EFFECT_CONFUSE_HIT,        65, PSYCHIC_TYPE,  SPECIAL,  100, 20,  10
	move EFFECT_SPEED_DOWN_HIT,     65, WATER,         SPECIAL,  100, 20,  10
	move EFFECT_ATTACK_DOWN_HIT,    65, ICE,           SPECIAL,  100, 20,  10
	move EFFECT_HYPER_BEAM,        150, NORMAL,        SPECIAL,   90,  5,   0
	move EFFECT_NORMAL_HIT,         35, FLYING,        PHYSICAL, 100, 35,   0
	move EFFECT_NORMAL_HIT,         80, FLYING,        PHYSICAL, 100, 20,   0
	move EFFECT_RECOIL_HIT,         80, FIGHTING,      PHYSICAL,  80, 25,   0
	move EFFECT_FLINCH_HIT,         50, FIGHTING,      PHYSICAL,  90, 20,  30
	move EFFECT_COUNTER,             1, FIGHTING,      PHYSICAL, 100, 20,   0
	move EFFECT_LEVEL_DAMAGE,        1, FIGHTING,      PHYSICAL, 100, 20,   0
	move EFFECT_NORMAL_HIT,         80, NORMAL,        PHYSICAL, 100, 15,   0
	move EFFECT_LEECH_HIT,          20, GRASS,         SPECIAL,  100, 20,   0
	move EFFECT_LEECH_HIT,          40, GRASS,         SPECIAL,  100, 10,   0
	move EFFECT_LEECH_SEED,          0, GRASS,         STATUS,    90, 10,   0
	move EFFECT_SP_ATK_UP,           0, NORMAL,        STATUS,   100, 40,   0
	move EFFECT_NORMAL_HIT,         55, GRASS,         PHYSICAL,  95, 25,   0
	move EFFECT_SOLARBEAM,         120, GRASS,         SPECIAL,  100, 10,   0
	move EFFECT_POISON,              0, POISON,        STATUS,    75, 35,   0
	move EFFECT_PARALYZE,            0, GRASS,         STATUS,    75, 30,   0
	move EFFECT_SLEEP,               0, GRASS,         STATUS,    75, 15,   0
	move EFFECT_RAMPAGE,            70, GRASS,         SPECIAL,  100, 20,   0
	move EFFECT_SPEED_DOWN,          0, BUG,           STATUS,    95, 40,   0
	move EFFECT_STATIC_DAMAGE,      40, DRAGON,        SPECIAL,  100, 10,   0
	move EFFECT_TRAP_TARGET,        15, FIRE,          SPECIAL,   70, 15,   0
	move EFFECT_PARALYZE_HIT,       40, ELECTRIC,      SPECIAL,  100, 30,  10
	move EFFECT_PARALYZE_HIT,       95, ELECTRIC,      SPECIAL,  100, 15,  10
	move EFFECT_PARALYZE,            0, ELECTRIC,      STATUS,   100, 20,   0
	move EFFECT_THUNDER,           120, ELECTRIC,      SPECIAL,   70, 10,  30
	move EFFECT_NORMAL_HIT,         50, ROCK,          PHYSICAL,  90, 15,   0
	move EFFECT_EARTHQUAKE,        100, GROUND,        PHYSICAL, 100, 10,   0
	move EFFECT_OHKO,                1, GROUND,        PHYSICAL,  30,  5,   0
	move EFFECT_FLY,                60, GROUND,        PHYSICAL, 100, 10,   0
	move EFFECT_TOXIC,               0, POISON,        STATUS,    85, 10,   0
	move EFFECT_CONFUSE_HIT,        50, PSYCHIC_TYPE,  SPECIAL,  100, 25,  10
	move EFFECT_SP_DEF_DOWN_HIT,    90, PSYCHIC_TYPE,  SPECIAL,  100, 10,  10
	move EFFECT_SLEEP,               0, PSYCHIC_TYPE,  STATUS,    60, 20,   0
	move EFFECT_ATTACK_UP,           0, PSYCHIC_TYPE,  STATUS,   100, 40,   0
	move EFFECT_SPEED_UP_2,          0, PSYCHIC_TYPE,  STATUS,   100, 30,   0
	move EFFECT_PRIORITY_HIT,       40, NORMAL,        PHYSICAL, 100, 30,   0
	move EFFECT_RAGE,               20, NORMAL,        PHYSICAL, 100, 20,   0
	move EFFECT_TELEPORT,            0, PSYCHIC_TYPE,  STATUS,   100, 20,   0
	move EFFECT_LEVEL_DAMAGE,        1, GHOST,         SPECIAL,  100, 15,   0
	move EFFECT_MIMIC,               0, NORMAL,        STATUS,   100, 10,   0
	move EFFECT_DEFENSE_DOWN_2,      0, NORMAL,        STATUS,    85, 40,   0
	move EFFECT_EVASION_UP,          0, NORMAL,        STATUS,   100, 15,   0
	move EFFECT_HEAL,                0, NORMAL,        STATUS,   100, 20,   0
	move EFFECT_DEFENSE_UP,          0, NORMAL,        STATUS,   100, 30,   0
	move EFFECT_EVASION_UP,          0, NORMAL,        STATUS,   100, 20,   0
	move EFFECT_ACCURACY_DOWN,       0, NORMAL,        STATUS,   100, 20,   0
	move EFFECT_CONFUSE,             0, GHOST,         STATUS,   100, 10,   0
	move EFFECT_DEFENSE_UP,          0, WATER,         STATUS,   100, 40,   0
	move EFFECT_DEFENSE_CURL,        0, NORMAL,        STATUS,   100, 40,   0
	move EFFECT_DEFENSE_UP_2,        0, PSYCHIC_TYPE,  STATUS,   100, 30,   0
	move EFFECT_LIGHT_SCREEN,        0, PSYCHIC_TYPE,  STATUS,   100, 30,   0
	move EFFECT_RESET_STATS,         0, ICE,           STATUS,   100, 30,   0
	move EFFECT_REFLECT,             0, PSYCHIC_TYPE,  STATUS,   100, 20,   0
	move EFFECT_FOCUS_ENERGY,        0, NORMAL,        STATUS,   100, 30,   0
	move EFFECT_BIDE,                0, NORMAL,        PHYSICAL, 100, 10,   0
	move EFFECT_METRONOME,           0, NORMAL,        STATUS,   100, 10,   0
	move EFFECT_MIRROR_MOVE,         0, FLYING,        STATUS,   100, 20,   0
	move EFFECT_SELFDESTRUCT,      200, NORMAL,        PHYSICAL, 100,  5,   0
	move EFFECT_NORMAL_HIT,        100, NORMAL,        PHYSICAL,  75, 10,   0
	move EFFECT_PARALYZE_HIT,       20, GHOST,         PHYSICAL, 100, 30,  30
	move EFFECT_POISON_HIT,         20, POISON,        SPECIAL,   70, 20,  40
	move EFFECT_POISON_HIT,         65, POISON,        SPECIAL,  100, 20,  30
	move EFFECT_FLINCH_HIT,         65, GROUND,        PHYSICAL,  85, 20,  10
	move EFFECT_BURN_HIT,          120, FIRE,          SPECIAL,   85,  5,  10
	move EFFECT_NORMAL_HIT,         80, WATER,         PHYSICAL, 100, 15,   0
	move EFFECT_TRAP_TARGET,        35, WATER,         PHYSICAL,  75, 10,   0
	move EFFECT_ALWAYS_HIT,         60, NORMAL,        SPECIAL,  100, 20,   0
	move EFFECT_SKULL_BASH,        100, NORMAL,        PHYSICAL, 100, 15,   0
	move EFFECT_MULTI_HIT,          20, NORMAL,        PHYSICAL, 100, 15,   0
	move EFFECT_SPEED_DOWN_HIT,     10, NORMAL,        PHYSICAL, 100, 35,  10
	move EFFECT_SP_DEF_UP_2,         0, PSYCHIC_TYPE,  STATUS,   100, 20,   0
	move EFFECT_ACCURACY_DOWN,       0, PSYCHIC_TYPE,  STATUS,    80, 15,   0
	move EFFECT_HEAL,                0, NORMAL,        STATUS,   100, 10,   0
	move EFFECT_JUMP_KICK,          85, FIGHTING,      PHYSICAL,  90, 20,   0
	move EFFECT_PARALYZE,            0, NORMAL,        STATUS,    75, 30,   0
	move EFFECT_DREAM_EATER,       100, PSYCHIC_TYPE,  SPECIAL,  100, 15,   0
	move EFFECT_POISON,              0, POISON,        STATUS,    55, 40,   0
	move EFFECT_MULTI_HIT,          15, NORMAL,        PHYSICAL,  85, 20,   0
	move EFFECT_LEECH_HIT,          20, BUG,           PHYSICAL, 100, 15,   0
	move EFFECT_SLEEP,               0, NORMAL,        STATUS,    75, 10,   0
	move EFFECT_SKY_ATTACK,        140, FLYING,        PHYSICAL,  90,  5,   0
	move EFFECT_TRANSFORM,           0, NORMAL,        STATUS,   100, 10,   0
	move EFFECT_SPEED_DOWN_HIT,     20, WATER,         SPECIAL,  100, 30,  10
	move EFFECT_CONFUSE_HIT,        70, NORMAL,        PHYSICAL, 100, 10,  20
	move EFFECT_SLEEP,               0, GRASS,         STATUS,   100, 15,   0
	move EFFECT_ACCURACY_DOWN,       0, NORMAL,        STATUS,    70, 20,   0
	move EFFECT_PSYWAVE,             1, PSYCHIC_TYPE,  SPECIAL,   80, 15,   0
	move EFFECT_SPLASH,              0, NORMAL,        STATUS,   100, 40,   0
	move EFFECT_DEFENSE_UP_2,        0, POISON,        STATUS,   100, 40,   0
	move EFFECT_NORMAL_HIT,         90, WATER,         PHYSICAL,  85, 10,   0
	move EFFECT_SELFDESTRUCT,      250, NORMAL,        PHYSICAL, 100,  5,   0
	move EFFECT_MULTI_HIT,          18, NORMAL,        PHYSICAL,  80, 15,   0
	move EFFECT_DOUBLE_HIT,         50, GROUND,        PHYSICAL,  90, 10,   0
	move EFFECT_HEAL,                0, PSYCHIC_TYPE,  STATUS,   100, 10,   0
	move EFFECT_FLINCH_HIT,         75, ROCK,          PHYSICAL,  90, 10,  30
	move EFFECT_FLINCH_HIT,         80, NORMAL,        PHYSICAL,  90, 15,  10
	move EFFECT_ATTACK_UP,           0, NORMAL,        STATUS,   100, 30,   0
	move EFFECT_CONVERSION,          0, NORMAL,        STATUS,   100, 30,   0
	move EFFECT_TRI_ATTACK,         80, NORMAL,        SPECIAL,  100, 10,  20
	move EFFECT_SUPER_FANG,          1, NORMAL,        PHYSICAL,  90, 10,   0
	move EFFECT_NORMAL_HIT,         70, NORMAL,        PHYSICAL, 100, 20,   0
	move EFFECT_SUBSTITUTE,          0, NORMAL,        STATUS,   100, 10,   0
	move EFFECT_RECOIL_HIT,         50, NORMAL,        PHYSICAL, 100,  1,   0
	move EFFECT_SKETCH,              0, NORMAL,        STATUS,   100,  1,   0
	move EFFECT_TRIPLE_KICK,        10, FIGHTING,      PHYSICAL,  90, 10,   0
	move EFFECT_THIEF,              40, DARK,          PHYSICAL, 100, 10, 100
	move EFFECT_MEAN_LOOK,           0, BUG,           STATUS,   100, 10,   0
	move EFFECT_LOCK_ON,             0, NORMAL,        STATUS,   100,  5,   0
	move EFFECT_NIGHTMARE,           0, GHOST,         STATUS,   100, 15,   0
	move EFFECT_FLAME_WHEEL,        60, FIRE,          PHYSICAL, 100, 25,  10
	move EFFECT_SNORE,              40, NORMAL,        SPECIAL,  100, 15,  30
	move EFFECT_CURSE,               0, CURSE_TYPE,    STATUS,   100, 10,   0
	move EFFECT_REVERSAL,            1, NORMAL,        PHYSICAL, 100, 15,   0
	move EFFECT_CONVERSION2,         0, NORMAL,        STATUS,   100, 30,   0
	move EFFECT_NORMAL_HIT,        100, FLYING,        SPECIAL,   95,  5,   0
	move EFFECT_SPEED_DOWN_2,        0, GRASS,         STATUS,    85, 40,   0
	move EFFECT_REVERSAL,            1, FIGHTING,      PHYSICAL, 100, 15,   0
	move EFFECT_SPITE,               0, GHOST,         STATUS,   100, 10,   0
	move EFFECT_FREEZE_HIT,         40, ICE,           SPECIAL,  100, 25,  10
	move EFFECT_PROTECT,             0, NORMAL,        STATUS,   100, 10,   0
	move EFFECT_PRIORITY_HIT,       40, FIGHTING,      PHYSICAL, 100, 30,   0
	move EFFECT_SPEED_DOWN_2,        0, NORMAL,        STATUS,    90, 10,   0
	move EFFECT_ALWAYS_HIT,         60, DARK,          PHYSICAL, 100, 20,   0
	move EFFECT_CONFUSE,             0, FAIRY,        STATUS,    75, 10,   0
	move EFFECT_BELLY_DRUM,          0, NORMAL,        STATUS,   100, 10,   0
	move EFFECT_POISON_HIT,         90, POISON,        SPECIAL,  100, 10,  30
	move EFFECT_ACCURACY_DOWN_HIT,  20, GROUND,        SPECIAL,  100, 10, 100
	move EFFECT_ACCURACY_DOWN_HIT,  65, WATER,         SPECIAL,   85, 10,  50
	move EFFECT_SPIKES,              0, GROUND,        STATUS,   100, 20,   0
	move EFFECT_PARALYZE_HIT,      100, ELECTRIC,      SPECIAL,   50,  5, 100
	move EFFECT_FORESIGHT,           0, NORMAL,        STATUS,   100, 40,   0
	move EFFECT_DESTINY_BOND,        0, GHOST,         STATUS,   100,  5,   0
	move EFFECT_PERISH_SONG,         0, NORMAL,        STATUS,   100,  5,   0
	move EFFECT_SPEED_DOWN_HIT,     55, ICE,           SPECIAL,   95, 15, 100
	move EFFECT_PROTECT,             0, FIGHTING,      STATUS,   100,  5,   0
	move EFFECT_MULTI_HIT,          25, GROUND,        PHYSICAL,  80, 10,   0
	move EFFECT_LOCK_ON,             0, NORMAL,        STATUS,   100,  5,   0
	move EFFECT_RAMPAGE,            90, DRAGON,        PHYSICAL, 100, 15,   0
	move EFFECT_SANDSTORM,           0, ROCK,          STATUS,   100, 10,   0
	move EFFECT_LEECH_HIT,          60, GRASS,         SPECIAL,  100,  5,   0
	move EFFECT_ENDURE,              0, NORMAL,        STATUS,   100, 10,   0
	move EFFECT_ATTACK_DOWN_2,       0, FAIRY,         STATUS,   100, 20,   0
	move EFFECT_ROLLOUT,            30, ROCK,          PHYSICAL,  90, 20,   0
	move EFFECT_FALSE_SWIPE,        40, NORMAL,        PHYSICAL, 100, 40,   0
	move EFFECT_SWAGGER,             0, NORMAL,        STATUS,    90, 15, 100
	move EFFECT_HEAL,                0, NORMAL,        STATUS,   100, 10,   0
	move EFFECT_PARALYZE_HIT,       65, ELECTRIC,      PHYSICAL, 100, 20,  30
	move EFFECT_FURY_CUTTER,        10, BUG,           PHYSICAL,  95, 20,   0
	move EFFECT_DEFENSE_UP_HIT,     70, STEEL,         PHYSICAL,  90, 25,  10
	move EFFECT_MEAN_LOOK,           0, NORMAL,        STATUS,   100,  5,   0
	move EFFECT_ATTRACT,             0, NORMAL,        STATUS,   100, 15,   0
	move EFFECT_SLEEP_TALK,          0, NORMAL,        STATUS,   100, 10,   0
	move EFFECT_HEAL_BELL,           0, NORMAL,        STATUS,   100,  5,   0
	move EFFECT_RETURN,              1, NORMAL,        PHYSICAL, 100, 20,   0
	move EFFECT_PRESENT,             1, NORMAL,        PHYSICAL,  90, 15,   0
	move EFFECT_FRUSTRATION,         1, NORMAL,        PHYSICAL, 100, 20,   0
	move EFFECT_SAFEGUARD,           0, NORMAL,        STATUS,   100, 25,   0
	move EFFECT_PAIN_SPLIT,          0, NORMAL,        STATUS,   100, 20,   0
	move EFFECT_SACRED_FIRE,       100, FIRE,          PHYSICAL,  95,  5,  50
	move EFFECT_MAGNITUDE,           1, GROUND,        PHYSICAL, 100, 30,   0
	move EFFECT_CONFUSE_HIT,       100, FIGHTING,      PHYSICAL,  50,  5, 100
	move EFFECT_NORMAL_HIT,        120, BUG,           PHYSICAL,  85, 10,   0
	move EFFECT_PARALYZE_HIT,       60, DRAGON,        SPECIAL,  100, 20,  30
	move EFFECT_BATON_PASS,          0, NORMAL,        STATUS,   100, 40,   0
	move EFFECT_ENCORE,              0, NORMAL,        STATUS,   100,  5,   0
	move EFFECT_PURSUIT,            40, DARK,          PHYSICAL, 100, 20,   0
	move EFFECT_RAPID_SPIN,         20, NORMAL,        PHYSICAL, 100, 40,   0
	move EFFECT_EVASION_DOWN,        0, NORMAL,        STATUS,   100, 20,   0
	move EFFECT_DEFENSE_DOWN_HIT,  100, STEEL,         PHYSICAL,  75, 15,  30
	move EFFECT_ATTACK_UP_HIT,      50, STEEL,         PHYSICAL,  95, 35,  10
	move EFFECT_ALWAYS_HIT,         70, FIGHTING,      PHYSICAL, 100, 10,   0
	move EFFECT_MORNING_SUN,         0, NORMAL,        STATUS,   100,  5,   0
	move EFFECT_SYNTHESIS,           0, GRASS,         STATUS,   100,  5,   0
	move EFFECT_MOONLIGHT,           0, FAIRY,        STATUS,   100,  5,   0
	move EFFECT_HIDDEN_POWER,        1, NORMAL,        SPECIAL,  100, 15,   0
	move EFFECT_NORMAL_HIT,        100, FIGHTING,      PHYSICAL,  80,  5,   0
	move EFFECT_TWISTER,            40, DRAGON,        SPECIAL,  100, 20,  20
	move EFFECT_RAIN_DANCE,          0, WATER,         STATUS,    90,  5,   0
	move EFFECT_SUNNY_DAY,           0, FIRE,          STATUS,    90,  5,   0
	move EFFECT_SP_DEF_DOWN_HIT,    80, DARK,          PHYSICAL, 100, 15,  20
	move EFFECT_MIRROR_COAT,         1, PSYCHIC_TYPE,  SPECIAL,  100, 20,   0
	move EFFECT_PSYCH_UP,            0, NORMAL,        STATUS,   100, 10,   0
	move EFFECT_PRIORITY_HIT,       80, NORMAL,        PHYSICAL, 100,  5,   0
	move EFFECT_ALL_UP_HIT,         60, ROCK,          SPECIAL,  100,  5,  10
	move EFFECT_SP_DEF_DOWN_HIT,    80, GHOST,         SPECIAL,  100, 15,  20
	move EFFECT_FUTURE_SIGHT,       80, PSYCHIC_TYPE,  SPECIAL,   90, 15,   0
	move EFFECT_DEFENSE_DOWN_HIT,   20, FIGHTING,      PHYSICAL, 100, 15,  50
	move EFFECT_TRAP_TARGET,        15, WATER,         SPECIAL,   70, 15,   0
	move EFFECT_BEAT_UP,            10, DARK,          PHYSICAL, 100, 10,   0
	move EFFECT_FREEZE_HIT,         65, ICE,           PHYSICAL,   100, 15,  10      ; ICE_FANG
	move EFFECT_BURN_HIT,           65, FIRE,          PHYSICAL,   100, 15,  10      ; FIRE_FANG
	move EFFECT_PARALYZE_HIT,       65, ELECTRIC,      PHYSICAL,   100, 15,  10      ; THUNDER_FANG
	move EFFECT_PRIORITY_HIT,       40, WATER,         PHYSICAL,   100, 20,   0      ; AQUA_JET
	move EFFECT_BURN_HIT,           80, WATER,         SPECIAL,    100, 15,   10     ; SCALD       
	move EFFECT_NORMAL_HIT,         40, GRASS,         PHYSICAL,   100, 40,   0      ; LEAFAGE
	move EFFECT_ALWAYS_HIT,         60, GHOST,         PHYSICAL,   100, 20,   0      ; SHADOW_PUNCH
	move EFFECT_BURN_HIT,            0, FIRE,          STATUS,      85, 15,  100     ; WILL-O-WISP
	move EFFECT_SPEED_DOWN_HIT,     55, ELECTRIC,      SPECIAL,     95, 15,  100     ; ELECTRO_WEB       
	move EFFECT_SP_ATK_DOWN_HIT,    55, DARK,          SPECIAL,     95, 15,  100     ; SNARL
	move EFFECT_NORMAL_HIT,         40, FAIRY,         SPECIAL,    100, 30,   0       ; FAIRY_WIND
	move EFFECT_ATTACK_DOWN_HIT,    90, FAIRY,         PHYSICAL,    90, 10,  10       ; PLAY_ROUGH     
	move EFFECT_SP_ATK_DOWN_HIT,    95, FAIRY,         SPECIAL,    100, 15,  30       ; MOONBLAST
	move EFFECT_NORMAL_HIT,         80, DRAGON,        PHYSICAL,   100, 15,   0       ; DRAGON_CLAW
	move EFFECT_NORMAL_HIT,         85, DRAGON,        SPECIAL,    100, 10,   0       ; DRAGON_PULSE
	move EFFECT_LEECH_HIT,          75, FIGHTING,      PHYSICAL,   100, 10,   0       ; DRAIN_PUNCH
	move EFFECT_LEECH_HIT,          50, FAIRY,         SPECIAL,    100, 10,   0       ; DRAINING_KISS
	move EFFECT_FLINCH_HIT,         80, DARK,          SPECIAL,    100, 15,  20       ; DARK_PULSE
	move EFFECT_PRIORITY_HIT,       40, ICE,           PHYSICAL,   100, 30,   0       ; ICE_SHARD
	move EFFECT_NORMAL_HIT,         90, WATER,         PHYSICAL,    90, 10,   0       ; AQUA_TAIL
	move EFFECT_SPEED_UP_HIT,       50, FIRE,          PHYSICAL,   100, 20, 100       ; FLAME_CHARGE      
	move EFFECT_BURN_HIT,           80, FIRE,          SPECIAL,    100, 15,  30       ; LAVA_PLUME
	move EFFECT_BURN_HIT,          100, FIRE,          SPECIAL,    100,  5, 100       ; INFERNO              
.IndirectEnd::
