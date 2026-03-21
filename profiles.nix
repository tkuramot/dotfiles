{
  air = {
    system = "aarch64-darwin";
    username = "kura";
    homeDirectory = "/Users/kura";
    extraModules = [];
  };
  work = {
    system = "aarch64-darwin";
    username = "taisei-kuramoto";
    homeDirectory = "/Users/taisei-kuramoto";
    extraModules = [ ./modules/colima.nix ];
  };
}
