{ config, ... }:
let
  dotfilesDir = "${config.home.homeDirectory}/dotfiles";
  link = path: config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/${path}";
  linkConfig = path: link ".config/${path}";
in {
  home.file = {
    ".zshenv".source = link ".zshenv";
    ".gitconfig".source = link ".gitconfig";
    ".vimrc".source = link ".vimrc";
  };

  xdg.configFile = {
    "aerospace".source = linkConfig "aerospace";
    "alacritty".source = linkConfig "alacritty";
    "direnv".source = linkConfig "direnv";
    "gh".source = linkConfig "gh";
    "nvim".source = linkConfig "nvim";
    "tmux".source = linkConfig "tmux";
    "zsh".source = linkConfig "zsh";
    "nix/nix.conf".source = linkConfig "nix/nix.conf";
    "starship.toml".source = linkConfig "starship.toml";
  };
}
