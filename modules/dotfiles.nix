{ config, ... }:
let
  dotfilesDir = "${config.home.homeDirectory}/dotfiles/.config";
  link = path: config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/${path}";
in {
  home.file.".zshenv".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.zshenv";
  home.file.".gitconfig".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.gitconfig";

  xdg.configFile = {
    "aerospace".source = link "aerospace";
    "nvim".source = link "nvim";
    "xournalpp".source = link "xournalpp";
    "zsh".source = link "zsh";
  };
}
