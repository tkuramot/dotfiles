{ config, ... }:
let
  dotfilesDir = "${config.home.homeDirectory}/dotfiles/.config";
  link = path: config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/${path}";
in {
  imports = [
    ./tmux.nix
    ./alacritty.nix
    ./starship.nix
    ./gh.nix
    ./nix.nix
  ];

  xdg.configFile = {
    "aerospace".source = link "aerospace";
    "nvim".source = link "nvim";
    "xournalpp".source = link "xournalpp";
    "zsh".source = link "zsh";
  };
}
