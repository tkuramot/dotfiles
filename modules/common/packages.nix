{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zoxide
    tree
    ripgrep
    jq
    fzf
    ghq
  ];
}
