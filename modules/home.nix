{ config, inputs, lib, pkgs, ... }:
let
  inherit (pkgs.stdenv.hostPlatform) isDarwin isLinux;
  dotfilesDir = "${config.home.homeDirectory}/dotfiles";
  link = path: config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/${path}";
  linkConfig = path: link ".config/${path}";
  alacrittyGL = config.lib.nixGL.wrap pkgs.alacritty;
in {
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    tmux
    starship
    gh
    zoxide
    tree
    ripgrep
    jq
    fzf
    ghq
    direnv
    nix-direnv
    vim
    neovim
    lua-language-server
    go
    gopls
    clang-tools
    bear
    typescript
    watchman
    wget
  ] ++ lib.optionals isLinux [
    alacrittyGL
  ];

  # Plasma's session env drops XDG_DATA_DIRS from environment.d, so the menu never sees ~/.nix-profile/share
  xdg.dataFile = lib.optionalAttrs isLinux {
    "applications/Alacritty.desktop".source = "${alacrittyGL}/share/applications/Alacritty.desktop";
  };

  targets.genericLinux = lib.mkIf isLinux {
    enable = true;
    nixGL.packages = inputs.nixgl.packages;
  };

  home.file = {
    ".zshenv".source = link ".zshenv";
    ".gitconfig".source = link ".gitconfig";
    ".vimrc".source = link ".vimrc";
  };

  xdg.configFile = {
    "alacritty".source = linkConfig "alacritty";
    "direnv".source = linkConfig "direnv";
    "gh".source = linkConfig "gh";
    "nvim".source = linkConfig "nvim";
    "tmux".source = linkConfig "tmux";
    "zsh".source = linkConfig "zsh";
    "nix/nix.conf".source = linkConfig "nix/nix.conf";
    "starship.toml".source = linkConfig "starship.toml";
  } // lib.optionalAttrs isDarwin {
    "aerospace".source = linkConfig "aerospace";
  };
}
