{ ... }:
{
  system.stateVersion = 6;

  # nix 本体は既存の multi-user インストールに任せる。
  # nix.conf は .config/nix/nix.conf のシンボリックリンクが単一ソース。
  nix.enable = false;

  # /etc/zshrc, /etc/zprofile, /etc/bashrc を nix-darwin に生成させない。
  # 生成版は PATH を固定値で上書きするため path_helper 経由の
  # /opt/homebrew/bin と /Library/TeX/texbin が PATH から落ちる。
  # シェル設定の単一ソースは .config/zsh のまま。
  programs.zsh.enable = false;
  programs.bash.enable = false;

  homebrew = {
    enable = true;
    onActivation.cleanup = "none";
    casks = [
      "aerospace"
      "alacritty"
    ];
  };

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
  };

  system.defaults = {
    NSGlobalDomain = {
      KeyRepeat = 2;
      InitialKeyRepeat = 15;
      ApplePressAndHoldEnabled = false;
      AppleShowAllExtensions = true;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
    };

    finder.FXEnableExtensionChangeWarning = false;

    dock = {
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.2;
      tilesize = 27;
      show-recents = false;
      mru-spaces = false; # AeroSpace: Space の自動並べ替えを止める
      wvous-br-corner = 1; # 右下ホットコーナー(クイックメモ)を無効化
    };

    WindowManager.EnableStandardClickToShowDesktop = false;
  };
}
