{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      general.import = [
        "${pkgs.alacritty-theme}/share/alacritty-theme/solarized_light.toml"
      ];
      window = {
        padding = { x = 8; y = 8; };
        dynamic_padding = true;
        decorations = "Buttonless";
      };
      scrolling = {
        history = 10000;
        multiplier = 3;
      };
      font = {
        size = 12.0;
        bold.style = "Bold";
        italic.style = "Italic";
      };
      selection.save_to_clipboard = true;
      keyboard.bindings = [
        {
          key = "N";
          mods = "Command|Shift";
          action = "CreateNewWindow";
        }
      ];
    };
  };
}
