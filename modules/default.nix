{ ... }:
{
  imports = [
    ./packages.nix
    ./tmux.nix
    ./alacritty.nix
    ./starship.nix
    ./gh.nix
    ./nix.nix
    ./vim.nix
    ./direnv.nix
    ./dotfiles.nix
  ];

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
