# Linker Errors - ROM/SRAM Overflow Issues

## Status
All RGBDS v1.0.1 deprecation warnings have been **FIXED** ✅

The remaining linker errors are a separate category of issues related to ROM/SRAM space management.

## Current Linker Errors

When building with `make`, you will see 9 linker errors:

```
error: The linker script assigns section "Newbox" to address $63a5, but then it would overflow ROMX by 224 bytes
error: The linker script assigns section "Bill's PC Graphics" to address $8000, but then it would overflow ROMX by 366 bytes
error: The linker script assigns section "Crystal Phone Text 2" to address $71e3, but then it would overflow ROMX by 10052 bytes
error: The linker script assigns section "Egg Moves 2" to address $8000, but then it would overflow ROMX by 720 bytes
error: The linker script assigns section "Box Metadata" to address $bc2a, but then it would overflow SRAM by 264 bytes
error: The linker script assigns section "Link Battle Data" to address $c000, but then it would overflow SRAM by 96 bytes
error: The linker script assigns section "SRAM Hall of Fame" to address $c000, but then it would overflow SRAM by 3150 bytes
error: The linker script assigns section "SRAM Crystal Data" to address $c000, but then it would overflow SRAM by 9 bytes
error: The linker script assigns section "SRAM Battle Tower" to address $c000, but then it would overflow SRAM by 24 bytes
```

## Root Cause

The project has undergone significant content expansion (documented in `SPACE_EXPANSION.md`):
- Move table: 230 → 500 entries
- Pokemon table: 100 → 200 entries
- Pokemon limit: 999 → 1407
- Many new Pokemon, moves, and features added

However, the `layout.link` file still uses the original bank assignments, and many sections have grown beyond their allocated space.

## Solution Options

### Option 1: Reorganize layout.link (Recommended)

Reorganize sections across banks to give overflowing sections more space:

1. **Move large sections to their own banks:**
   - "Newbox" → own bank
   - "Bill's PC Graphics" → own bank
   - "Crystal Phone Text 2" → own bank
   - "Egg Moves 2" → own bank

2. **Split SRAM sections across multiple banks:**
   - "Box Metadata" → SRAM $02
   - "Link Battle Data" → SRAM $03
   - "SRAM Hall of Fame" → SRAM $04
   - "SRAM Crystal Data" → SRAM $05
   - "SRAM Battle Tower" → SRAM $06

3. **Update all subsequent bank numbers** to account for the new banks

### Option 2: Remove Fixed Address Constraints

Remove explicit address assignments from `layout.link` and let the linker automatically place sections. This is simpler but loses precise control over memory layout.

### Option 3: Optimize Section Sizes

Review and optimize the content in overflowing sections to reduce their size. This may require removing features or compressing data.

## Manual Fix Required

The linker errors require manual intervention to fix because:
1. The reorganization affects many interdependent bank assignments
2. The optimal layout depends on your specific requirements
3. Some sections may need to be split or reorganized based on your game design

## Testing After Fix

After reorganizing `layout.link`:
1. Run `make clean && make` to rebuild from scratch
2. Verify the ROM builds successfully
3. Test the game in an emulator to ensure all features work correctly
4. Pay special attention to:
   - Bill's PC box system
   - Save/load functionality
   - Phone text display
   - Egg moves
   - Hall of Fame

## Additional Resources

- RGBDS linker documentation: https://rgbds.gbdev.io/docs/rgblink.1
- Game Boy memory map: https://gbdev.io/pandocs/Memory_Map.html
- See `SPACE_EXPANSION.md` for details on content expansion
