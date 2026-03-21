# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Deploy

```bash
make switch PROFILE=air    # Build and activate personal profile
make switch PROFILE=work   # Build and activate work profile
make build PROFILE=air     # Build without activating (dry run)
```

Underlying command: `home-manager switch/build --flake .#<profile>`

## Architecture

This is a **Nix Flakes + Home Manager** dotfiles repo for macOS (aarch64-darwin).

**Flake structure:** `flake.nix` defines inputs (nixpkgs unstable, home-manager) and builds `homeConfigurations` from profiles. The helper `mkHome` wires each profile through `modules/default.nix` plus any profile-specific `extraModules`.

**Profiles** (`profiles.nix`): Each entry maps a name to a system/user/home triple plus optional extra modules. Currently two profiles:
- `air` — personal (username: kura), no extra modules
- `work` — work machine (username: taisei-kuramoto), adds `modules/optional/colima.nix`

**Module layers:**
- `modules/default.nix` — entry point; imports `common.nix`, sets home state version, enables home-manager self-management
- `modules/common.nix` — imports all common modules and symlinks config directories (aerospace, nvim, xournalpp, zsh) from `.config/`
- `modules/common/*.nix` — per-program modules (packages, tmux, alacritty, starship, gh, nix, vim, direnv)
- `modules/optional/*.nix` — profile-specific modules added via `extraModules`

**Dotfiles in `.config/`** are symlinked into `~/.config/` by Home Manager via `home.file`. Program-specific configs managed through `programs.*` options live in the nix modules instead.

**.gitignore** uses a strict whitelist strategy — everything is ignored by default, specific paths are explicitly allowed.
