{ pkgs, muxrun, ... }:
{
  home.packages = with pkgs; [
    zoxide
    tree
    ripgrep
    jq
    fzf
    ghq
    muxrun.packages.${pkgs.system}.default
  ];
}
