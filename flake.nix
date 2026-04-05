{
  description = "Home Manager configuration of kura";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    muxrun = {
      url = "github:tkuramot/muxrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mcp-server-pdf = {
      url = "github:tkuramot/mcp-server-pdf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, muxrun, mcp-server-pdf, ... }:
  let
    profiles = import ./profiles.nix;
    mkHome = name: { system, username, homeDirectory, extraModules ? [] }:
      home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = { inherit muxrun mcp-server-pdf; };
        modules = [
          ./modules/default.nix
          { home.username = username; home.homeDirectory = homeDirectory; }
        ] ++ extraModules;
      };
  in {
    homeConfigurations = builtins.mapAttrs mkHome profiles;
  };
}
