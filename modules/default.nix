{ ... }:
{
  imports = [
    ./packages.nix
    ./direnv.nix
    ./dotfiles.nix
  ];

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
