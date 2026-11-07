# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Deploy

```bash
make home-switch     # Home Manager: build and activate
make home-build      # Home Manager: build without activating
make darwin-switch   # nix-darwin: build and activate (sudo)
make darwin-build    # nix-darwin: build without activating
```

Underlying commands: `home-manager switch/build --flake .#macos`, `sudo darwin-rebuild switch --flake .#macos`.

The two layers are **independent** — Home Manager is not imported as a nix-darwin module. Changing a package or a symlink needs only `make home-switch`; changing macOS defaults or a cask needs only `make darwin-switch`.

## Architecture

This is a **Nix Flakes + Home Manager + nix-darwin** dotfiles repo for macOS (aarch64-darwin).

**Flake structure:** `flake.nix` defines inputs (nixpkgs unstable, home-manager, nix-darwin) and builds both `homeConfigurations` and `darwinConfigurations` from the same profiles. `mkHome` wires each profile through `modules/home.nix`; `mkDarwin` wires it through `modules/darwin.nix`.

**nix-darwin tracks `master`** and refuses to evaluate when its release string differs from the locked nixpkgs. `nixpkgs.url` is `nixos-unstable`, so after `nix flake update` the two can drift apart; if they do, pin the `nix-darwin` url to the matching `nix-darwin-YY.MM` branch (or back to `master` once master matches nixpkgs again).

**Profiles** (`profiles.nix`): Each entry maps a name to a system/user/home triple:
- `macos` — aarch64-darwin (macOS), username: kura
- `parrot` — aarch64-linux (ParrotOS ARM, Home Manager only), username: kura

`darwinConfigurations` is built only from profiles whose system ends in `-darwin`. `make home-switch`/`home-build` pick `parrot` on Linux and `macos` otherwise (override with `HOME_PROFILE=`). OS-specific bits live in the shared `modules/home.nix`, gated with `pkgs.stdenv.hostPlatform.isDarwin`/`isLinux`:
- macOS only: the `aerospace` link.
- Linux only: `targets.genericLinux` with nixGL (from the `nixgl` flake input, passed via `extraSpecialArgs`); GPU apps are wrapped with `config.lib.nixGL.wrap` (alacritty; on macOS it is a Homebrew cask instead).

Everything else on ParrotOS (base system, privileged security tools that ship with Parrot) stays with apt. Linux-only *module imports* cannot be gated on `pkgs` (infinite recursion), so they are selected in `mkHome` by system suffix: on `-linux` profiles it adds the `plasma-manager` module and `modules/plasma.nix`.

**Modules** — one file per layer (they are different module systems and cannot be merged):
- `modules/home.nix` — the Home Manager layer: state version, `home.packages`, and the symlink table (`home.file` / `xdg.configFile`)
- `modules/darwin.nix` — the nix-darwin (system) layer: Homebrew casks, `system.defaults`, Caps Lock remap

**Single source of truth: `.config/`.** Nix owns *packages and symlinks only*; it never generates config text — there are no `programs.*` modules, with one exception: `programs.plasma` (see below). Every config file lives as a real file in this repo (`.config/**`, `.zshenv`, `.gitconfig`, `.vimrc`) and is linked into `$HOME` with `config.lib.file.mkOutOfStoreSymlink`, so edits take effect immediately — `make home-switch` is only needed when adding a package or a new link.

Do **not** reintroduce `programs.<tool>.settings` / `extraConfig` for a tool whose config lives in `.config/`: it would both shadow the real file and re-split the source of truth. Add the package to `home.packages` and a link to the symlink table in `modules/home.nix` instead.

Config directories are linked **whole**, including ones whose tools write machine-local files back into them (`gh/hosts.yml`, `tmux/tmux.local.conf`, `nvim/lazy-lock.json`, `zsh/.zshrc.local`). Those files land inside this repo and are excluded by an explicit deny line in `.gitignore` — that is the intended pattern, not an accident. Note that `git clean -xdf` will delete them.

`direnv` follows the same rule: `.config/direnv/direnvrc` sources nix-direnv from `$HOME/.nix-profile`, so both `direnv` and `nix-direnv` must stay in `home.packages` for that path to exist.

`nix` is the one exception, linked at *file* level: nothing currently shares `~/.config/nix`, so a single-file link avoids needing a deny line for `registry.json`.

Adding a new tool: add the package to `home.packages` in `modules/home.nix`, drop its config under `.config/`, add one line to the symlink table in the same file, and whitelist the path in `.gitignore`. Linux-only packages go in the `lib.optionals isLinux` list in the same file. Unfree packages must also be named in the `allowUnfreePredicate` list in `mkHome` (`flake.nix`).

## nix-darwin layer

`modules/darwin.nix` owns only what lives above the user's home directory:

- **`homebrew.casks`** — GUI apps (`aerospace`, `alacritty`, `virtualbox`, …). `onActivation.cleanup = "none"`, so casks not listed here are left alone rather than uninstalled. nix-darwin does not install Homebrew itself; it must already be present.
- **`system.defaults`** — `defaults write` equivalents (key repeat, input auto-correction, Finder, Dock incl. `persistent-apps`, hot corners). Some entries deliberately restate the value already set by hand, so the state is declared rather than implicit.
- **`system.keyboard`** — Caps Lock → Control.
- **`security.pam.services.sudo_local.touchIdAuth`** — Touch ID for `sudo`.

Two options are set defensively and must not be flipped without understanding why:

- **`nix.enable = false`** — nix-darwin would otherwise take over the nix daemon and `/etc/nix`. The existing multi-user install manages the daemon, and `.config/nix/nix.conf` is the single source of truth for nix settings.
- **`programs.zsh.enable = false`** / **`programs.bash.enable = false`** — these generate `/etc/zshrc`, `/etc/zshenv`, `/etc/zprofile`, and `/etc/bashrc`. The generated `/etc/zprofile` drops the `path_helper` call, and the generated `/etc/zshenv` hard-sets `PATH` to a fixed list that does **not** contain `/opt/homebrew/bin` — so enabling them would knock every Homebrew binary (including the casks this layer installs) out of `PATH`. Shell config stays entirely in `.config/zsh`.

Same rule as the Home Manager layer: nix-darwin manages *system state*, never config text for a tool whose config lives in `.config/`.

## KDE Plasma (ParrotOS)

`modules/plasma.nix` uses plasma-manager's `programs.plasma` — the deliberate exception to the no-`programs.*` rule. KDE rewrites its own rc files constantly (window geometry, recent files, per-screen IDs), so they cannot be symlinked from `.config/`; instead plasma-manager writes only the declared keys via `kwriteconfig` at activation, like `system.defaults` on the nix-darwin side. Keep `overrideConfig` off so undeclared keys stay with KDE, and do not link `kdeglobals`/`kwinrc`/`plasma-*rc` into `.config/`.

**.gitignore** uses a strict whitelist strategy — everything is ignored by default, specific paths are explicitly allowed.
