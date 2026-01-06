# Copilot instructions (PokeCrystalDot)

## Project overview
- This repo is an RGBDS (Game Boy Color) disassembly-based ROM build; the main output is `pokecrystal.gbc` (see `Makefile`).
- Code is mostly RGBASM assembly (`.asm`) with a small C toolchain in `tools/` used during the build.

## How the ROM is put together
- Build “compilation units” are the top-level objects listed in `Makefile` (`audio.asm`, `home.asm`, `main.asm`, `ram.asm`, plus various `data/**`/`engine/**` objects).
- `main.asm` is the primary bank dispatcher: it declares `SECTION "bankX", ROMX` blocks and `INCLUDE`s many modules (example: Bank $10 includes `data/moves/moves.asm`).
- Bank/section names must match the linker script in `layout.link`. If you add/move large modules, you usually need to adjust both the `SECTION` placement and `layout.link`.

## Pre-includes, macros, and constants
- Assembly is built with `rgbasm -P includes.asm` (see `Makefile: RGBASMFLAGS`). That means `includes.asm` is *pre-included* for every file.
- Put new global macros in `macros/` and new global constants in `constants/`; avoid re-`INCLUDE`ing these in every file unless the repo already does.
- **Ordering matters:** `includes.asm` notes that `constants/16_bit_locking_constants.asm` must come after `constants/16_bit_translation_constants.asm`.

## 16-bit index expansion (project-specific)
- Pokémon and move IDs use a 16-bit indirection/conversion system.
  - Configuration: `constants/16_bit_translation_constants.asm`
  - Locked-ID slots: `constants/16_bit_locking_constants.asm` (guarded by `fail` checks)
  - WRAM table layout macro: `macros/wram_16bit.asm`
- Many data tables use `indirect_table` / `indirect_entries` patterns (example: `data/moves/moves.asm`). When extending an indexed table, update the corresponding constants (e.g., `constants/move_constants.asm`) and any `NUM_*` limits referenced by the table.

## Build workflow (what to run)
- Prereqs: RGBDS **v0.7.0+** is enforced by `rgbdscheck.asm`.
- Recommended on Windows: use WSL or Cygwin per `INSTALL.md`.
- Common targets:
  - `make` → builds `pokecrystal.gbc` (and builds `tools/` first unless you’re running `clean/tidy/tools`).
  - `make tools` → builds helper binaries in `tools/`.
  - `make tidy` → removes ROM, symbols/maps, objects, and patches.
  - `make clean` → `tidy` plus deletes generated gfx artifacts (`*.2bpp`, `*.lz`, palettes, etc.).
  - `make DEBUG=1` → adds extra assembler export info for debugging (`.sym`/`.map` are produced by link step).
  - `make RGBDS=path/to/rgbds/` → use a local RGBDS checkout.

## Asset/build integration points
- PNG→2bpp conversion is done via `rgbgfx` and sometimes post-processed via `tools/gfx` (see the pattern rules in `Makefile`).
- LZ compression outputs `*.lz` via `tools/lzcomp` (`Makefile` rule `%.lz: %`).
- Dependency tracking uses `tools/scan_includes` to discover `INCLUDE` graphs; if you add new includes, keep paths correct so deps are discovered.

## Known repo state (avoid wasted time)
- Current builds may fail due to ROM/SRAM overflow linker errors; see `LINKER_ERRORS_README.md` and `ERRORS.txt`. If you touch large data/graphics/phone text/newbox, expect to revisit `layout.link` and section placement.
- Some expansion notes in `SPACE_EXPANSION.md` describe intended table sizes; verify current effective values in `constants/16_bit_translation_constants.asm` before changing limits.

## Existing agent config
- A custom agent scaffold exists at `.github/agents/my-agent.agent.md`. Treat it as high-level context; prefer conventions that are demonstrably used in code/build files.
