# Space Expansion Changes

This document describes the changes made to maximize room for additional moves, Pokemon, move effects, and animations.

## Summary of Changes

### 1. Move Table Expansion (constants/16_bit_translation_constants.asm)

- **MOVE_TABLE_ENTRIES**: Increased from 230 to **500**
  - This more than doubles the available space for moves
  - Allows adding hundreds of new moves from Generation 4+ onwards

- **MOVE_TABLE_LOCKED_ENTRIES**: Increased from 18 to **24**
  - More locked entries for better handling of simultaneous move usage

- **MOVE_TABLE_CACHE_SIZE**: Increased from 16 to **32**
  - Better performance with larger move lists

- **MOVE_TABLE_SAVED_RECENT_INDEXES**: Increased from 16 to **24**
  - Reduces evictions and improves memory management

### 2. Pokemon Table Expansion (constants/16_bit_translation_constants.asm)

- **MON_TABLE_ENTRIES**: Increased from 100 to **200**
  - Doubles the available space for Pokemon
  - Allows adding many more Pokemon from later generations

- **MON_TABLE_CACHE_SIZE**: Increased from 16 to **32**
  - Better performance with larger Pokemon lists

- **MON_TABLE_SAVED_RECENT_INDEXES**: Increased from 8 to **16**
  - Reduces evictions and improves memory management

### 3. Pokemon Limit Expansion (constants/pokemon_constants.asm)

- **Pokemon Limit**: Increased from 999 to **1407**
  - This is the practical limit based on wPokedexOrder size
  - The UI's PrintNum function already supports displaying 4-digit numbers
  - The wPokedexOrder buffer in RAM is already sized for 1407 entries

## Technical Details

### Move Limits
- Current move count: ~250 moves defined
- Hard limit: $3fff (16,383) - will never be reached
- New practical limit with tables: ~500 moves comfortably supported

### Pokemon Limits
- Current Pokemon count: ~280 Pokemon defined
- New limit: 1407 Pokemon (up from 999)
- Hard limit: 4095 (would require redesign to exceed)
- RAM allocation: wPokedexOrder already sized for 1407 entries

### Move Effects
- Current move effects: ~165 effects
- No hard limit on move effects
- Can add more as needed without special configuration

## What This Enables

1. **Moves**: Can now add ~250 more moves from later generations
2. **Pokemon**: Can now add ~1100 more Pokemon (currently at ~280, limit is 1407)
3. **Move Effects**: Unlimited within reasonable bounds
4. **Battle Animations**: Same limits as moves (can support all new moves)

## Known Issues

### Build Issue with New Pokemon Sprites
Some newly added Pokemon sprites (arceus, sylveon, togekiss, etc.) are in RGBA format instead of indexed color format with embedded palettes. These need to be converted before the project will build successfully.

Affected sprites include:
- abomasnow, aexeggutor, aggron, altaria, amarowak, appletun, araichu, arceus
- aron, azurill, beautifly, blaziken, breloom, buizel, buneary
- cacnea, cacturne, camerupt, carvanha, cascoon
- And many more...

To fix: Convert these PNG files to indexed color (8-bit colormap) with embedded palettes.

## Future Expansion

If even more space is needed in the future:

1. **Moves**: Can increase MOVE_TABLE_ENTRIES up to ~1000 or more
2. **Pokemon**: Can increase to 4095 (hard limit) but would require UI changes for >9999
3. **Cache sizes**: Can be increased further for better performance
4. **Move effects**: Can continue adding without limit

## Testing Required

After fixing the sprite issues:
1. Build the ROM with `make`
2. Test that existing moves and Pokemon work correctly
3. Add a new move and verify it works
4. Add a new Pokemon and verify it works
5. Test Pokedex display with more Pokemon
6. Test move selection menus with more moves

## Performance Considerations

The increased cache sizes and saved recent indexes should improve performance by reducing the frequency of:
- Table evictions
- Cache misses
- Memory reallocations

The table lookup system remains the same, just with more entries available.
