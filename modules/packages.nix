{ pkgs, muxrun, mcp-server-pdf, ... }:
{
  home.packages = with pkgs; [
    zoxide
    tree
    ripgrep
    jq
    fzf
    ghq
    muxrun.packages.${pkgs.system}.default
    mcp-server-pdf.packages.${pkgs.system}.default
  ];
}
