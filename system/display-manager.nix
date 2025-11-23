{
  pkgs,
  config,
  ...
}: {
  services = {
    displayManager = {
      ly.enable = true;
      ly.package = pkgs.ly;
      ly.settings = {
        animation = "none";
        #border_fg = "0x00FFFFFF";
        initial_info_text = "Welcome back";
        vi_mode = true;
        vi_default_mode = "insert";
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
}
