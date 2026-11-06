{
  description = "Home Manager configuration of kura";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      # nixpkgs の release と揃える
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl = {
      url = "github:nix-community/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };
  outputs = inputs@{ nixpkgs, home-manager, nix-darwin, plasma-manager, ... }:
  let
    profiles = import ./profiles.nix;
    mkHome = name: { system, username, homeDirectory }:
      home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./modules/home.nix
          { home.username = username; home.homeDirectory = homeDirectory; }
        ] ++ nixpkgs.lib.optionals (nixpkgs.lib.hasSuffix "-linux" system) [
          plasma-manager.homeModules.plasma-manager
          ./modules/plasma.nix
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
    darwinConfigurations = builtins.mapAttrs mkDarwin
      (nixpkgs.lib.filterAttrs (_: p: nixpkgs.lib.hasSuffix "-darwin" p.system) profiles);
  };
}
