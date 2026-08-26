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
- `modules/packages.nix` — every package installed via `home.packages`
- `modules/direnv.nix` — the one `programs.*` module left, because nix-direnv wiring is genuinely easier in nix
- `modules/dotfiles.nix` — the symlink table

**Single source of truth: `.config/`.** Nix owns *packages and symlinks only*; it never generates config text. Every config file lives as a real file in this repo (`.config/**`, `.zshenv`, `.gitconfig`, `.vimrc`) and is linked into `$HOME` with `config.lib.file.mkOutOfStoreSymlink`, so edits take effect immediately — `make switch` is only needed when adding a package or a new link.

Do **not** reintroduce `programs.<tool>.settings` / `extraConfig` for a tool whose config lives in `.config/`: it would both shadow the real file and re-split the source of truth. Add the package to `packages.nix` and a link to `dotfiles.nix` instead.

Config directories are linked **whole**, including ones whose tools write machine-local files back into them (`gh/hosts.yml`, `tmux/tmux.local.conf`, `nvim/lazy-lock.json`, `zsh/.zshrc.local`, `xournalpp/settings.xml`). Those files land inside this repo and are excluded by an explicit deny line in `.gitignore` — that is the intended pattern, not an accident. Note that `git clean -xdf` will delete them.

`nix` is the one exception, linked at *file* level: nothing currently shares `~/.config/nix`, so a single-file link avoids needing a deny line for `registry.json`.

Adding a new tool: add the package to `modules/packages.nix`, drop its config under `.config/`, add one line to `modules/dotfiles.nix`, and whitelist the path in `.gitignore`. If a second machine is ever added, reintroduce per-profile module selection in `profiles.nix` at that point — not before.

**.gitignore** uses a strict whitelist strategy — everything is ignored by default, specific paths are explicitly allowed.
