{ pkgs, ... }:
{
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
    wget
  ];
}
