{ ... }:
{
  system.stateVersion = 6;

  # nix 本体は既存の multi-user インストールに任せる。
  nix.enable = false;

  # 生成される /etc/zshenv が PATH を固定値で上書きし、
  # /opt/homebrew/bin が落ちるため off。
  programs.zsh.enable = false;
  programs.bash.enable = false;

  homebrew = {
    enable = true;
    onActivation.cleanup = "none";
    casks = [
      "aerospace"
      {
        name = "alacritty";
        args.no_quarantine = true;
      }
      "bitwarden"
      "claude"
      "clipy"
      "discord"
      "google-chrome"
      "google-drive"
      "google-japanese-ime"
      "iterm2"
      "libreoffice"
      "obsidian"
      "spotify"
      "virtualbox"
      "visual-studio-code"
      "zoom"
    ];
  };

  security.pam.services.sudo_local.touchIdAuth = true;

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
      persistent-apps = [
        "/System/Applications/Apps.app"
        "/Applications/Arc.app"
        "/Applications/Google Chrome.app"
        "/Users/kura/Applications/Chrome Apps.localized/Oreilly.app"
        "/System/Applications/Maps.app"
        "/Applications/Alacritty.app"
        "/Applications/Discord.app"
        "/System/Applications/Photos.app"
        "/System/Applications/Notes.app"
        "/System/Applications/App Store.app"
        "/Applications/Bitwarden.app"
        "/System/Applications/System Settings.app"
        "/System/Applications/iPhone Mirroring.app"
        "/Applications/iTerm.app"
        "/Applications/Obsidian.app"
        "/Applications/LibreOffice.app"
      ];
    };

    WindowManager.EnableStandardClickToShowDesktop = false;
  };
}
