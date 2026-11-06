# dotfiles

## Setup (macOS)

```bash
# Dependencies
xcode-select --install

# Homebrew (nix-darwin does not install it)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Nix (restart the shell afterwards)
curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install | sh

# dotfiles
git clone https://github.com/tkuramot/dotfiles ~/dotfiles && cd ~/dotfiles

# Home Manager (first run only; use `make home-switch` afterwards)
NIX_CONFIG='experimental-features = nix-command flakes' nix run home-manager/master -- switch --flake .#macos -b backup

# nix-darwin (first run only; use `make darwin-switch` afterwards)
sudo nix --extra-experimental-features 'nix-command flakes' run nix-darwin/master#darwin-rebuild -- switch --flake .#macos
```

## Setup (ParrotOS)

```bash
# Dependencies
sudo apt install -y git curl zsh

# Nix, multi-user (restart the shell afterwards)
curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install | sh -s -- --daemon

# dotfiles
git clone https://github.com/tkuramot/dotfiles ~/dotfiles && cd ~/dotfiles

# Home Manager (first run only; use `make home-switch` afterwards)
NIX_CONFIG='experimental-features = nix-command flakes' nix run home-manager/master -- switch --flake .#parrot -b backup

# Login shell (log out and back in afterwards)
chsh -s "$(which zsh)"
```
