{
  pkgs,
  config,
  lib,
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

  users.groups = {
    plugdev = {};
    wireshark = {};
    syncthing = {};
    docker = {};
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    hector = {
      isNormalUser = true;
      description = "hector aa";
      extraGroups = ["networkmanager" "wheel" "docker" "syncthing" "wireshark" "video" "dialout" "plugdev"];
    };
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      vpl-gpu-rt # Replacement for intel-media-sdk
      # OpenCL support for intel CPUs before 12th gen
      # see: https://github.com/NixOS/nixpkgs/issues/356535
      intel-compute-runtime-legacy1
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      intel-vaapi-driver # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      libvdpau-va-gl
    ];
  };

  networking.firewall.enable = true;

  networking.firewall.allowedTCPPorts = [
    4040 # Apache NiFi
    2222 # SSH
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
    nerd-fonts.meslo-lg
  ];

  environment.systemPackages = [
    (
      pkgs.catppuccin-sddm.override {
        flavor = "macchiato";
        accent = "sapphire";
        font = "Iosevka";
        fontSize = "18";
      }
    )
  ];

  services = {
    displayManager = {
      sddm = {
        enable = true;
        theme = "catppuccin-macchiato-sapphire";
        package = pkgs.kdePackages.sddm;
        wayland = {
          enable = true;
        };
      };
      ly = {
        enable = false;
        package = pkgs.ly;
        settings = {
          animation = "none";
          bg = "0xFF223249";
          fg = "0xFF54546D";
          border_fg = "0xFF2D4F67";
          initial_info_text = "Welcome back";
          vi_mode = true;
          vi_default_mode = "insert";
        };
      };
      defaultSession = "none+i3";
    };

    xserver = {
      xkb = {
        layout = "us";
        options = "ctrl:nocaps";
      };
      enable = true;
      windowManager.dwm = {
        enable = true;
        package = pkgs.dwm;
      };
      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          dmenu
          i3status
          i3lock
          i3blocks
        ];
      };
    };
  };

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      swaylock
      swayidle
      wl-clipboard
      wf-recorder
      grim
      sway-contrib.grimshot
      slurp
      wofi

      # XDG Fix for waybar
      waybar
      xdg-utils
      xdg-user-dirs
      xdg-dbus-proxy
      # xdg-desktop-portal
      # xdg-desktop-portal-wlr
      # xdg-desktop-portal-gnome
    ];
    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      export _JAVA_AWT_WM_NONREPARENTING=1
      export MOZ_ENABLE_WAYLAND=1
    '';
  };

  programs.waybar.enable = true;

  # All below comes from https://www.reddit.com/r/swaywm/comments/uxqt8c/how_do_i_start_xdgdesktopportalwlr_properly/
  # See https://gitlab.com/jokeyrhyme/dotfiles/-/blob/main/usr/local/bin/dotfiles-sway.sh
  # See xdg checklist: https://github.com/emersion/xdg-desktop-portal-wlr/wiki/%22It-doesn't-work%22-Troubleshooting-Checklist
  # What a nightmare of a software.
  # If a problem arises, check the ~/.config/systemd/user/xdg-desktop-portal.service points to a valid service.
  # If not, manually link it (the correct one is always at /etc/systemd/usr/xdg-desktop-portal.service).
  # You can read that with:   readlink /etc/systemd/usr/xdg-desktop-portal.service
  # Or you can just execute: ln -f -s $(readlink /etc/systemd/user/xdg-desktop-portal.service) ~/.config/systemd/user/xdg-desktop-portal.service
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gnome
    ];
  };

  environment.systemPackages = with pkgs; [
    dunst # Notify service
    picom # Compositor

    yt-dlp

    zola # SSG

    qemu
  ];

  virtualisation.docker.enable = true;
  virtualisation.vmware.host.enable = true;
  virtualisation.vmware.guest.enable = true;

  # virtualisation.virtualbox.host.enable = true;
  # virtualisation.virtualbox.host.enableExtensionPack = true;
  # virtualisation.virtualbox.guest.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;
  system.stateVersion = "25.11"; # Did you read the comment?
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

  users.groups = {
    plugdev = {};
    wireshark = {};
    syncthing = {};
    docker = {};
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    hector = {
      isNormalUser = true;
      description = "hector aa";
      extraGroups = ["networkmanager" "wheel" "docker" "syncthing" "wireshark" "video" "dialout" "plugdev"];
    };
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      vpl-gpu-rt # Replacement for intel-media-sdk
      # OpenCL support for intel CPUs before 12th gen
      # see: https://github.com/NixOS/nixpkgs/issues/356535
      intel-compute-runtime-legacy1
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      intel-vaapi-driver # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      libvdpau-va-gl
    ];
  };

  networking.firewall.enable = true;

  networking.firewall.allowedTCPPorts = [
    4040 # Apache NiFi
    2222 # SSH
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
    nerd-fonts.meslo-lg
  ];

  environment.systemPackages = [
    (
      pkgs.catppuccin-sddm.override {
        flavor = "macchiato";
        accent = "sapphire";
        font = "Iosevka";
        fontSize = "18";
      }
    )
  ];

  services = {
    displayManager = {
      sddm = {
        enable = true;
        theme = "catppuccin-macchiato-sapphire";
        package = pkgs.kdePackages.sddm;
        wayland = {
          enable = true;
        };
      };
      ly = {
        enable = false;
        package = pkgs.ly;
        settings = {
          animation = "none";
          bg = "0xFF223249";
          fg = "0xFF54546D";
          border_fg = "0xFF2D4F67";
          initial_info_text = "Welcome back";
          vi_mode = true;
          vi_default_mode = "insert";
        };
      };
      defaultSession = "none+i3";
    };

    xserver = {
      xkb = {
        layout = "us";
        options = "ctrl:nocaps";
      };
      enable = true;
      windowManager.dwm = {
        enable = true;
        package = pkgs.dwm;
      };
      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          dmenu
          i3status
          i3lock
          i3blocks
        ];
      };
    };
  };

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      swaylock
      swayidle
      wl-clipboard
      wf-recorder
      grim
      sway-contrib.grimshot
      slurp
      wofi

      # XDG Fix for waybar
      waybar
      xdg-utils
      xdg-user-dirs
      xdg-dbus-proxy
      # xdg-desktop-portal
      # xdg-desktop-portal-wlr
      # xdg-desktop-portal-gnome
    ];
    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      export _JAVA_AWT_WM_NONREPARENTING=1
      export MOZ_ENABLE_WAYLAND=1
    '';
  };

  programs.waybar.enable = true;

  # All below comes from https://www.reddit.com/r/swaywm/comments/uxqt8c/how_do_i_start_xdgdesktopportalwlr_properly/
  # See https://gitlab.com/jokeyrhyme/dotfiles/-/blob/main/usr/local/bin/dotfiles-sway.sh
  # See xdg checklist: https://github.com/emersion/xdg-desktop-portal-wlr/wiki/%22It-doesn't-work%22-Troubleshooting-Checklist
  # What a nightmare of a software.
  # If a problem arises, check the ~/.config/systemd/user/xdg-desktop-portal.service points to a valid service.
  # If not, manually link it (the correct one is always at /etc/systemd/usr/xdg-desktop-portal.service).
  # You can read that with:   readlink /etc/systemd/usr/xdg-desktop-portal.service
  # Or you can just execute: ln -f -s $(readlink /etc/systemd/user/xdg-desktop-portal.service) ~/.config/systemd/user/xdg-desktop-portal.service
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gnome
    ];
  };

  environment.systemPackages = with pkgs; [
    dunst # Notify service
    picom # Compositor

    yt-dlp

    zola # SSG

    qemu
  ];

  virtualisation.docker.enable = true;
  virtualisation.vmware.host.enable = true;
  virtualisation.vmware.guest.enable = true;

  # virtualisation.virtualbox.host.enable = true;
  # virtualisation.virtualbox.host.enableExtensionPack = true;
  # virtualisation.virtualbox.guest.enable = true;

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
