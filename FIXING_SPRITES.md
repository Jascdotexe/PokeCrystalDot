# Fixing RGBA Sprite Build Issue

## Problem

The build currently fails because many newer Pokemon sprites are in RGBA format instead of indexed color format with embedded palettes.

## Error Message
```
FATAL: `-c embedded` was given, but the PNG does not have an embedded palette!
Conversion aborted after 1 error
```

## Affected Sprites

Many newly added Pokemon have this issue, including:
- abomasnow, aexeggutor, aggron, altaria, amarowak, appletun, araichu, **arceus**
- aron, azurill, beautifly, blaziken, breloom, buizel, buneary
- cacnea, cacturne, camerupt, carvanha, cascoon
- And many more...

## Root Cause

The Makefile requires sprites to use:
```makefile
gfx/pokemon/%/front.2bpp: rgbgfx += -c embedded
```

This requires PNG files to be:
- **8-bit indexed color** (colormap/palette mode)
- **With embedded palette**

Current problematic sprites are:
- **8-bit/color RGBA** (no palette, full color)

## Solution Options

### Option 1: Convert All Sprites (Recommended)

Use ImageMagick or similar tools to convert RGBA to indexed color:

```bash
# Install ImageMagick if needed
sudo apt-get install imagemagick

# Convert a single sprite
convert gfx/pokemon/arceus/front.png -type Palette PNG8:gfx/pokemon/arceus/front_indexed.png
mv gfx/pokemon/arceus/front_indexed.png gfx/pokemon/arceus/front.png

# Convert all RGBA sprites
for file in $(find gfx/pokemon -name "front.png" -o -name "back.png"); do
    file_type=$(file "$file")
    if echo "$file_type" | grep -q "RGBA"; then
        echo "Converting $file"
        convert "$file" -type Palette PNG8:"${file}.tmp"
        mv "${file}.tmp" "$file"
    fi
done
```

### Option 2: Batch Script

Create a script `fix_sprites.sh`:

```bash
#!/bin/bash
cd gfx/pokemon

for dir in */; do
    if [ -f "$dir/front.png" ]; then
        if file "$dir/front.png" | grep -q "RGBA"; then
            echo "Converting $dir/front.png"
            convert "$dir/front.png" -colors 16 -type Palette PNG8:"$dir/front_new.png"
            mv "$dir/front_new.png" "$dir/front.png"
        fi
    fi
    
    if [ -f "$dir/back.png" ]; then
        if file "$dir/back.png" | grep -q "RGBA"; then
            echo "Converting $dir/back.png"
            convert "$dir/back.png" -colors 16 -type Palette PNG8:"$dir/back_new.png"
            mv "$dir/back_new.png" "$dir/back.png"
        fi
    fi
done
```

Run with:
```bash
chmod +x fix_sprites.sh
./fix_sprites.sh
```

### Option 3: Use GIMP (Manual, Per-Sprite)

For each sprite:
1. Open the PNG in GIMP
2. Image → Mode → Indexed...
3. Select "Generate optimum palette"
4. Set maximum colors to 4 (Game Boy Color limit per sprite)
5. Export as PNG
6. Make sure "Save color profile" is unchecked
7. Save

### Option 4: Modify Makefile (Not Recommended)

You could remove the `-c embedded` flag, but this would require regenerating all sprite palettes manually.

## Verification

After conversion, verify the sprite format:

```bash
# Should show "8-bit colormap" not "RGBA"
file gfx/pokemon/arceus/front.png
```

Expected output:
```
gfx/pokemon/arceus/front.png: PNG image data, 56 x 336, 8-bit colormap, non-interlaced
```

## Testing

After converting sprites:

1. Clean and rebuild:
```bash
make clean
make
```

2. Verify the game builds successfully
3. Test the converted sprites in-game
4. Check that colors look correct
5. Verify animations work

## Color Palette Considerations

Game Boy Color limitations:
- 4 colors per sprite palette
- Sprites can use multiple palettes
- Background uses separate palettes

When converting:
- Use 4 colors for simple sprites
- Up to 16 colors for complex sprites (will use multiple palettes)
- Ensure important details are preserved

## Common Issues

### Issue: Colors look wrong after conversion
**Solution**: Manually adjust the palette in GIMP or use a specific palette file

### Issue: Transparency lost
**Solution**: Ensure first color in palette is transparent, or use `-transparent` flag with ImageMagick

### Issue: Sprite too large
**Solution**: Game Boy Color has size limits; ensure sprite fits within tile constraints

## Automated Fix Script (Complete)

Save as `tools/fix_rgba_sprites.sh`:

```bash
#!/bin/bash
set -e

echo "Finding and converting RGBA sprites to indexed color..."

count=0
for png in gfx/pokemon/*/front.png gfx/pokemon/*/back.png; do
    if [ ! -f "$png" ]; then
        continue
    fi
    
    if file "$png" | grep -q "8-bit/color RGBA"; then
        echo "Converting: $png"
        convert "$png" \
            -colors 4 \
            -type Palette \
            -define png:color-type=3 \
            PNG8:"${png}.tmp"
        mv "${png}.tmp" "$png"
        ((count++))
    fi
done

echo "Converted $count sprite files"
echo "Build with: make clean && make"
```

Usage:
```bash
chmod +x tools/fix_rgba_sprites.sh
./tools/fix_rgba_sprites.sh
```

## Next Steps After Fixing

1. Run `make clean && make` to build
2. Test converted sprites in emulator
3. Commit fixed sprites to repository
4. Continue adding new moves and Pokemon

## Prevention

When adding new Pokemon sprites in the future:
1. Always use indexed color mode
2. Limit to 4 colors per sprite
3. Test build immediately after adding
4. Keep a reference sprite as template
