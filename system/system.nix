{
  pkgs,
  config,
  ...
}: {
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "es_ES.UTF-8";
    LC_NUMERIC = "es_ES.UTF-8";
    LC_PAPER = "es_ES.UTF-8";
    LC_TELEPHONE = "es_ES.UTF-8";
    LC_TIME = "es_ES.UTF-8";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    hector = {
      isNormalUser = true;
      description = "hector";
      extraGroups = ["networkmanager" "wheel" "docker" "syncthing" "wireshark" "video" "dialout" "plugdev"];
    };
  };

  documentation = {
    enable = true;
    man = {
      enable = true;
      generateCaches = true;
    };
    nixos.enable = true;
    info.enable = true;
    doc.enable = true;
    dev.enable = true;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
    nerd-fonts.meslo-lg
  ];

  # All below comes from https://www.reddit.com/r/swaywm/comments/uxqt8c/how_do_i_start_xdgdesktopportalwlr_properly/
  # See https://gitlab.com/jokeyrhyme/dotfiles/-/blob/main/usr/local/bin/dotfiles-sway.sh
  # See xdg checklist: https://github.com/emersion/xdg-desktop-portal-wlr/wiki/%22It-doesn't-work%22-Troubleshooting-Checklist
  # What a nightmare of a software.
  # If a problem arises, check the ~/.config/systemd/user/xdg-desktop-portal.service points to a valid service.
  # If not, manually link it (the correct one is always at /etc/systemd/usr/xdg-desktop-portal.service).
  # You can read that with:   readlink /etc/systemd/usr/xdg-desktop-portal.service
  # Or you can just execute: ln -f -s $(readlink /etc/systemd/usr/xdg-desktop-portal.service) ~/.config/systemd/user/xdg-desktop-portal.service
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gnome
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;
  system.stateVersion = "25.11"; # Did you read the comment?
}
