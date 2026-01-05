---
# Fill in the fields below to create a basic custom agent for your repository.
# The Copilot CLI can be used for local testing: https://gh.io/customagents/cli
# To make this agent available, merge this file into the default repository branch.
# For format details, see: https://gh.io/customagents/config

name: PokeCrys
description: Works on PokeCrystalDot
---

# Agent Instructions for Working on PokeCrystalDot Repository

This document serves as a guide for an "agent" tasked with adding features, expanding content, and making associated changes to the game hosted in the `PokeCrystalDot` repository: `PokeCrystal16 w/ Newbox +`.

## Repository Overview
The repository is primarily dedicated to an enhanced version of the Pokémon Crystal game, with particular focus on adding new content. The agent will work on various aspects of game design, code implementation, and integration within the existing codebase.

### Repository Language Breakdown:
- **Assembly (94%)**: Core of the game logic. Most tasks will involve writing and expanding Assembly code.
- **C (4%)**: Secondary components of game logic; could be used for libraries or low-level functions.
- **C++ (1%)**: Additional language support, potentially for new tooling or extended features.
- **Python (1%)**: Scripts, possibly for automation, debugging, or data/configuration serialization.
- **Makefile (0.1%)**: Build system and compilation process.
- **Awk (0%)**: Rarely used, potentially for small text-processing tasks.

---

## Agent Responsibilities

### 1. Adding New Game Content
- **Purpose**: Implement new maps, items, characters, quests, or Pokémon within the game.
- **Requirements**:
  - Use Assembly for most in-game feature additions (e.g., new Pokémon stats, item effects).
  - Update existing tables and memory layouts to allocate resources for new elements.
  - Follow naming and stylistic conventions in the `PokeCrystalDot` codebase.

#### Example Tasks:
- Add a new Pokémon, including its sprite, stats, and moveset:
  - Modify relevant Assembly files for Pokémon data.
  - Add sprite image data (compressed as required).
  - Integrate the Pokémon into the spawn table and encounter logic.
- Add new maps or regions:
  - Define new map templates (tileset design, assembly layout).
  - Assign event triggers for entering/exiting new areas.

---

### 2. Enhancing Game Mechanics
- **Purpose**: Expand or tweak game mechanics, such as introducing new moves, abilities, or evolution methods.
- **Requirements**:
  - Implement changes in Assembly, ensuring compatibility with existing systems.
  - Update associated tables for object interactions, animations, and calculations.

#### Example Tasks:
- Add new evolution methods (e.g., "evolve by friendship during rain"):
  - Extend evolution conditions in the Assembly code.
  - Update documentation or lookup tables affected by these changes.
  - Write test cases to verify functionality.

- Introduce new move types:
  - Modify battle logic in Assembly to accommodate new effects.
  - Update descriptions and animations associated with the move.

---

### 3. Debugging and Performance Optimization
- **Purpose**: Ensure the game runs smoothly and resolves bugs as development progresses.
- **Requirements**:
  - Analyze memory management issues, particularly in Assembly, to resolve bottlenecks or glitches.
  - Update Python or C-based scripts for debugging/logging purposes if necessary.
  - Edit Makefile to ensure builds are optimized where appropriate.

#### Example Tasks:
- Patch a memory overflow error in an Assembly file.
- Write a Python script to automate the detection of unused memory or invalid instruction sequences.

---

### 4. Automating Builds and Documentation
- **Purpose**: Streamline the build and documentation processes for ease of development.
- **Requirements**:
  - Maintain the Makefile to ensure a one-step build process.
  - Use Python scripts for automation tasks such as generating lookup tables or updating game resources.
  - Write clear comments/documentation detailing new changes.

#### Example Tasks:
- Update the Makefile with targets for new map data compilation.
- Add a Python script to procedurally generate configuration files for new Pokémon/events.

---

## Agent Guidelines

### Code Quality:
- Write maintainable, well-commented Assembly code.
- Follow established conventions in the repository.

### Documentation:
- Document new features, gameplay mechanics, or changes in inline comments and extended Markdown documentation in the `docs` folder.

### Collaboration:
- Test all changes locally using tools/emulators before committing.
- Keep changes modular to avoid breaking the existing codebase.
- Submit pull requests with detailed comments, including context for changes and specific files impacted.

---

## Contribution Workflow
1. **Fork and Clone the Repository**:
   - Create a fork of `Jascdotexe/PokeCrystalDot` and clone to your local machine.

2. **Create a Feature Branch**:
   - Example branch name: `feature/new_pokemon-xyz`.

3. **Implement Changes**:
   - Modify appropriate source files, primarily in Assembly.

4. **Test Changes**:
   - Test using a suitable emulator to validate new/modified game content.

5. **Submit Changes**:
   - Push the feature branch to your fork and open a pull request to the main repository.

6. **Respond to Reviews**:
   - Address feedback and ensure code conforms to repository standards.

7. **Merge Once Approved**:
   - Ensure changes are merged properly and update documentation as needed.

---

## Additional Notes for Development:
1. **Testing Framework**:
   - If applicable, extend or modify the repository's testing framework.
   - Use emulator/debugger tools (e.g., `BGB`, `No$GMB`) to step through Assembly code for testing.

2. **Game Design Philosophy**:
   - Respect the original Pokémon aesthetic and mechanics; changes should blend naturally into the game world.

3. **Tooling Utilization**:
   - Use Python and Makefile efficiently to manage builds, asset conversion, or other tooling.

Happy contributing! The `PokeCrystalDot` project thrives on creativity and technical precision—combine both to create amazing content!
