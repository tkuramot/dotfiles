# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Deploy

```bash
make switch   # Build and activate
make build    # Build without activating (dry run)
```

Underlying command: `home-manager switch/build --flake .#default`

## Architecture

This is a **Nix Flakes + Home Manager** dotfiles repo for macOS (aarch64-darwin).

**Flake structure:** `flake.nix` defines inputs (nixpkgs unstable, home-manager) and builds `homeConfigurations` from profiles. The helper `mkHome` wires each profile through `modules/default.nix`.

**Profiles** (`profiles.nix`): Each entry maps a name to a system/user/home triple. Currently one profile:
- `default` — username: kura

**Modules** (flat, no common/optional split):
- `modules/default.nix` — entry point; imports every sibling module, sets home state version, enables home-manager self-management
- `modules/*.nix` — one per program (packages, tmux, alacritty, starship, gh, nix, vim, direnv)
- `modules/dotfiles.nix` — symlinks config directories (aerospace, nvim, xournalpp, zsh) from `.config/`, plus `.zshenv` and `.gitconfig`

Adding a module means dropping a file in `modules/` and adding one line to `modules/default.nix`. If a second machine is ever added, reintroduce per-profile module selection in `profiles.nix` at that point — not before.

**Dotfiles in `.config/`** are symlinked into `~/.config/` by Home Manager via `home.file`. Program-specific configs managed through `programs.*` options live in the nix modules instead.

**.gitignore** uses a strict whitelist strategy — everything is ignored by default, specific paths are explicitly allowed.
