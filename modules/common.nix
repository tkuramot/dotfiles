{ config, ... }:
let
  dotfilesDir = "${config.home.homeDirectory}/dotfiles/.config";
  link = path: config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/${path}";
in {
  xdg.configFile = {
    "aerospace".source = link "aerospace";
    "alacritty".source = link "alacritty";
    "gh".source = link "gh";
    "nix".source = link "nix";
    "nvim".source = link "nvim";
    "tmux".source = link "tmux";
    "xournalpp".source = link "xournalpp";
    "zsh".source = link "zsh";
    "starship.toml".source = link "starship.toml";
  };
}
