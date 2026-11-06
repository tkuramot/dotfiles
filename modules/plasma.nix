{ ... }:
{
  programs.plasma = {
    enable = true;
    workspace = {
      lookAndFeel = "org.kde.breeze.desktop";
      colorScheme = "BreezeLight";
      theme = "default";
      iconTheme = "breeze";
      cursor.theme = "breeze_cursors";
    };
  };
}
