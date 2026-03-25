{
  pkgs,
  config,
  lib,
  ...
}: {
  networking.hostName = "gaming"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
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

  # Configure keymap in X11
  services = {
    displayManager = {
      autoLogin = {
        enable = true;
        user = "user";
      };
      sddm = {
        enable = true;
      };
    };

    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        options = "ctrl:nocaps";
      };
      videoDrivers = ["nvidia"];
    };
    desktopManager.plasma6.enable = true;
  };

  hardware.enableAllFirmware = true;
  hardware.graphics.enable = true;
  hardware.nvidia = {
    open = true;
    modesetting.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = ["networkmanager" "wheel" "docker" "dialout" "syncthing"];
  };

  users.users.server = {
    isNormalUser = true;
    description = "user";
    extraGroups = ["docker" "shared"];
  };

  users.groups = {
    shared = {};
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      kdePackages.fcitx5-qt
      fcitx5-nord
    ];
  };

  fonts.packages = with pkgs; [
    pkgs.nerd-fonts.iosevka
    pkgs.nerd-fonts.meslo-lg
  ];

  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  services.syncthing = {
    enable = true;
    dataDir = "/home/user/syncthing";
    openDefaultPorts = true;
    #   Generate a new configuration with key and pem using
    #   nix-shell -p syncthing --run "syncthing generate --config
    #   ~/.config/syncthing"
    configDir = "/home/user/.config/syncthing";
    guiAddress = "0.0.0.0:8384";
    user = "user";
    group = "syncthing";
    overrideDevices = false;
    overrideFolders = false;
    settings = {
      gui = {
        user = "user";
        password = "$2b$12$6uH.uX4MI0W0OszE2c10S.8SddNdZKrQE5xHGLujc8zEGtFnNWM5a";
      };
    };
  };

  networking = {
	  interfaces.enp34s0.wakeOnLan.enable = true; # WoL Nixos
	  firewall.allowedUDPPorts = [ 9 ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
