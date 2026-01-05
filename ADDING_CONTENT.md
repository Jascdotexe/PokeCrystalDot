# Guide: Adding New Moves and Pokemon

This guide explains how to add new moves and Pokemon to the game now that space has been expanded.

## Quick Reference

### Current Capacity
- **Moves**: 300 used / 500 capacity = **200 slots available**
- **Pokemon**: 269 used / 1407 limit = **1138 slots available**
- **Move Effects**: ~165 used / unlimited

## Adding a New Move

### 1. Add Move Constant
**File**: `constants/move_constants.asm`

Add your move before the `DEF NUM_ATTACKS` line:
```asm
const ENERGY_BALL
const YOUR_NEW_MOVE  ; Add here
DEF NUM_ATTACKS EQU const_value - 1
```

### 2. Add Move Data
**File**: `data/moves/moves.asm`

Define the move's properties:
```asm
move YOUR_NEW_MOVE
    db MOVE_TYPE      ; Move type (NORMAL, FIRE, etc.)
    db EFFECT_NORMAL_HIT  ; Move effect constant
    db POWER          ; Base power (0-255)
    db TYPE           ; Type field (matches first type field for compatibility)
    db ACCURACY       ; Accuracy (0-255, usually percentage)
    db PP             ; Power Points
    db EFFECT_CHANCE  ; % chance for effect (0-255)
    db 0              ; Unused byte
    db TARGET         ; Target (ENEMY, SELF, etc.)
    db 0              ; Priority modifier
    db FLAGS          ; Special flags
```

### 3. Add Move Name
**File**: `data/moves/names.asm`

Add the display name (max 12 characters):
```asm
db "YOUR MOVE@"
```

### 4. Add Move Description
**File**: `data/moves/descriptions.asm`

Add a description for the Pokedex:
```asm
YourNewMoveDescription:
    db   "Short description"
    next "of your new move.@"
```

### 5. Add Move Animation
**File**: `data/moves/animations.asm`

Link to an animation (can reuse existing):
```asm
dw YOUR_NEW_MOVE_ANIM
```

### 6. Add Move Effect (if new)
If your move uses a new effect:

**File**: `constants/move_effect_constants.asm`
```asm
const EFFECT_YOUR_NEW_EFFECT
```

**File**: `data/moves/effects_pointers.asm`
```asm
dw YourNewEffectCommand
```

**File**: `engine/battle/move_effects/*.asm`
Implement the effect logic in an appropriate file.

## Adding a New Pokemon

### 1. Add Pokemon Constant
**File**: `constants/pokemon_constants.asm`

Add before `DEF NUM_POKEMON`:
```asm
const MUNCHLAX
const YOUR_NEW_POKEMON  ; Add here
DEF NUM_POKEMON EQU const_value - 1
```

### 2. Add Base Stats
**File**: `data/pokemon/base_stats/your_new_pokemon.asm`

Create a new file with base stats:
```asm
	db YOUR_NEW_POKEMON ; Pokedex number
	db 80 ; HP
	db 70 ; Attack
	db 60 ; Defense
	db 50 ; Speed
	db 65 ; Special Attack
	db 55 ; Special Defense
	db TYPE_1, TYPE_2 ; Types
	db 45 ; Catch rate
	db 150 ; Base experience
	db ITEM_NONE ; Item 1
	db ITEM_NONE ; Item 2
	db GENDER_F50 ; Gender ratio
	db 100 ; Unknown
	db 20 ; Step cycles to hatch
	db 5 ; Unknown
	dn 6, 6 ; Front pic dimensions
	db 0, 0, 0, 0 ; Padding
	db GROWTH_MEDIUM_FAST ; Growth rate
	dn EGG_GROUP_MONSTER, EGG_GROUP_MONSTER ; Egg groups
	db 0, 0, 0, 0 ; TM/HM flags will be set elsewhere
```

### 3. Add to Base Stats Index
**File**: `data/pokemon/base_stats.asm`

Add an include line:
```asm
INCLUDE "data/pokemon/base_stats/your_new_pokemon.asm"
```

### 4. Add Pokemon Name
**File**: `data/pokemon/names.asm`

Add name (max 10 characters):
```asm
db "YOURMON@"
```

### 5. Add Evolutions and Attacks
**File**: `data/pokemon/evos_attacks.asm`

Define evolution and level-up moves:
```asm
EvosAttacksPointers::
	dw YourNewPokemonEvosAttacks
	
YourNewPokemonEvosAttacks:
	; Evolutions
	db EVOLVE_LEVEL, 25, EVOLUTION_FORM
	db 0 ; no more evolutions
	; Learnset
	db 1, TACKLE
	db 7, GROWL
	db 13, WATER_GUN
	db 0 ; no more moves
```

### 6. Add Pokedex Entry
**File**: `data/pokemon/dex_entries/your_new_pokemon.asm`

```asm
	db "SPECIES@"  ; Species name
	db 1, 0        ; Height (feet, inches)
	dw 100         ; Weight (pounds)
	db "Pokedex description text goes"
	next "here with multiple lines if"
	next "needed for the entry.@"
```

### 7. Add Graphics
Create folders and files:
- `gfx/pokemon/your_new_pokemon/front.png` - Front sprite (indexed color!)
- `gfx/pokemon/your_new_pokemon/back.png` - Back sprite
- `gfx/pokemon/your_new_pokemon/shiny.pal` - Shiny palette
- `gfx/pokemon/your_new_pokemon/anim.asm` - Animation commands
- `gfx/pokemon/your_new_pokemon/anim_idle.asm` - Idle animation

**Important**: PNG files must be indexed color (8-bit colormap) with embedded palettes, not RGBA!

### 8. Add Cry
**File**: `data/pokemon/cries.asm`

Link to a cry sound:
```asm
mon_cry YOUR_NEW_POKEMON, -1, 128, 129
```

### 9. Add Icon
**File**: `data/pokemon/icon_pointers.asm`

Link to icon graphics:
```asm
dw YourNewPokemonIcon
```

### 10. Add to Pokedex Orders
**Files**: 
- `data/pokemon/dex_order_alpha.asm` - Alphabetical
- `data/pokemon/dex_order_new.asm` - New Pokedex order

Add your Pokemon to the appropriate position in both lists.

## TM/HM Compatibility

**File**: `data/pokemon/tmhm_learnsets.asm`

Define which TMs and HMs the Pokemon can learn:
```asm
YourNewPokemonLearnset:
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE
	; ... more TMs/HMs
	db 0 ; end
```

## Egg Moves

**File**: `data/pokemon/egg_moves.asm`

If breedable, add egg moves:
```asm
	db YOUR_NEW_POKEMON
	db MOVE_1
	db MOVE_2
	db -1 ; end
```

## Common Pitfalls

1. **Sprite Format**: New Pokemon sprites MUST be indexed color (8-bit colormap), not RGBA
2. **Name Length**: Pokemon names are max 10 characters, move names max 12
3. **Index Order**: Keep everything in the same order as constants
4. **Build Errors**: Always build after adding to catch errors early
5. **Missing Files**: Easy to forget icon, cry, or dex entry files

## Testing Your Additions

After adding content, build and test:

```bash
make clean
make
```

Test in-game:
- Can you obtain the Pokemon/use the move?
- Do stats display correctly?
- Does the sprite appear properly?
- Does the animation work?
- Is the Pokedex entry readable?

## Space Monitoring

Check remaining space by counting:
```bash
# Count moves
grep "^\tconst [A-Z]" constants/move_constants.asm | wc -l

# Count Pokemon  
grep "^\tconst [A-Z]" constants/pokemon_constants.asm | wc -l
```

Compare against limits:
- Moves: XXX / 500
- Pokemon: XXX / 1407

## Additional Resources

- `SPACE_EXPANSION.md` - Details on space limits and expansion
- `ToDo` - List of planned moves and Pokemon to add
- Original pokecrystal documentation and tutorials
