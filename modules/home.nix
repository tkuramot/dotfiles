{ config, inputs, lib, pkgs, ... }:
let
  inherit (pkgs.stdenv.hostPlatform) isDarwin isLinux;
  dotfilesDir = "${config.home.homeDirectory}/dotfiles";
  link = path: config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/${path}";
  linkConfig = path: link ".config/${path}";
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
    claude-code
  ] ++ lib.optionals isLinux [
    (config.lib.nixGL.wrap alacritty)
  ];

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
  } // lib.optionalAttrs isLinux {
    "plasma-workspace/env/nix.sh".source = linkConfig "plasma-workspace/env/nix.sh";
  };
}
