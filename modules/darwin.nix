{ ... }:
{
  system.stateVersion = 6;

  # nix 本体は既存の multi-user インストールに任せる。
  nix.enable = false;

  # 生成される /etc/zshenv が PATH を固定値で上書きし、
  # /opt/homebrew/bin と /Library/TeX/texbin が落ちるため off。
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
      wvous-br-corner = 1; # 右下ホットコーナー無効
    };

    WindowManager.EnableStandardClickToShowDesktop = false;
  };
}
