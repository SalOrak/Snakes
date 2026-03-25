{
  pkgs,
  pkgs-unstable,
  config,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./bootloader.nix
    ./system.nix
    ./extra-packages.nix

    # Modules
    ../../modules/common

    # Services
    ../../modules/services/bluetooth.nix
    ../../modules/services/password.nix
    ../../modules/services/power-management.nix
    ../../modules/services/remote-drive.nix
    ../../modules/services/ssh.nix
    ../../modules/services/udev.nix

    # Syncthing
    ./syncthing.nix

    # Software
    ../../modules/software/common.nix
    ../../modules/software/email.nix
    ../../modules/software/gaming.nix
    ../../modules/software/gtk.nix
    ../../modules/software/manual.nix
    ../../modules/software/network.nix
    ../../modules/software/programming.nix
    ../../modules/software/utils.nix
    ../../modules/software/wacom.nix

    # Testing
    ../../modules/software/gamedev.nix
  ];

  # Services Options
  password-manager.enable = true;

  remoteDrive.enable = true;
  remoteDrive.work = false;

  # Software options

  gui.enable = true;
  cli.enable = true;

  email.enable = true;
  email.mbsync = true;

  games.client.enable = true;
  gamedev.enable = true;

  manual.enable = true;

  programming = {
    rust.enable = true;
    zig.enable = true;
    java.enable = true;
    nix.enable = true;
    c.enable = true;
    embedded.enable = true;
    markdown.enable = true;
    web.enable = true;
  };

  utils = {
    enable = true;
    wayland = true;
    x11 = true;
    libs = true;
  };

  wacom.enable = true;
}
