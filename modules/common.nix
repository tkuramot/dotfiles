{ config, ... }:
let
  dotfilesDir = "${config.home.homeDirectory}/dotfiles/.config";
  link = path: config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/${path}";
in {
  imports = [
    ./common/packages.nix
    ./common/tmux.nix
    ./common/alacritty.nix
    ./common/starship.nix
    ./common/gh.nix
    ./common/nix.nix
    ./common/vim.nix
  ];

  xdg.configFile = {
    "aerospace".source = link "aerospace";
    "nvim".source = link "nvim";
    "xournalpp".source = link "xournalpp";
    "zsh".source = link "zsh";
  };
}
