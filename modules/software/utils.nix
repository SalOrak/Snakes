{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    utils.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Install utils";
    };
    utils.wayland = lib.mkEnableOption "Install Wayland utils";
    utils.x11 = lib.mkEnableOption "Install x11 utils";
    utils.libs = lib.mkEnableOption "Install libraries.";
  };
  config = lib.mkIf config.utils.enable {
    environment.systemPackages = with pkgs;
      [
        zlib
        e2fsprogs
        dosfstools

        # Temperature wise
        lm_sensors

        # Theme
        gruvbox-dark-icons-gtk

        # Util apps
        pavucontrol
        flameshot
        peek
      ]
      ++ lib.optionals config.utils.wayland [
        wayland-utils
        wl-clipboard
        scrot
      ]
      ++ lib.optionals config.utils.x11 [
        xclip
        freeglut
        xorg.libXi
        xorg.libXmu
        xorg.libXext
        xorg.libX11
        xorg.libXv
        xorg.libXrandr
      ]
      ++ lib.optionals config.utils.x11 [
        libtool
        libvterm
      ];
  };
}
