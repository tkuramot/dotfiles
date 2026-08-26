{
  description = "Home Manager configuration of kura";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      # nixpkgs の release と揃える必要がある (現在 26.05)
      url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, nix-darwin, ... }:
  let
    profiles = import ./profiles.nix;
    mkHome = name: { system, username, homeDirectory }:
      home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          ./modules/default.nix
          { home.username = username; home.homeDirectory = homeDirectory; }
        ];
      };
    mkDarwin = name: { system, username, ... }:
      nix-darwin.lib.darwinSystem {
        modules = [
          ./modules/darwin.nix
          { nixpkgs.hostPlatform = system; system.primaryUser = username; }
        ];
      };
  in {
    homeConfigurations = builtins.mapAttrs mkHome profiles;
    darwinConfigurations = builtins.mapAttrs mkDarwin profiles;
  };
}
