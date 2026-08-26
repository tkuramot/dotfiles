{ pkgs, ... }:
{
  home.packages = with pkgs; [
    alacritty
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
  ];
}
