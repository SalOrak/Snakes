{
  pkgs,
  pkgs-unstable,
  config,
  lib,
  ...
}: {
  imports = [
    /etc/hardware-configuration.nix
    ./bootloader.nix
    ./system.nix

    # Modules
    ../../modules/common

    # Services
    ../../modules/services/bluetooth.nix
    ../../modules/services/password.nix
    ../../modules/services/ssh.nix

    # Software
    ../../modules/software/common.nix
    ../../modules/software/email.nix
    ../../modules/software/gamedev.nix
    ../../modules/software/gaming.nix
    ../../modules/software/manual.nix
    ../../modules/software/network.nix
    ../../modules/software/programming.nix
    ../../modules/software/utils.nix
    ../../modules/software/wacom.nix
    ../../modules/software/server-gaming.nix
  ];

  # Services Options
  password-manager.enable = true;

  # Software options
  # common.nix
  gui.enable = true;
  cli.enable = true;

  # email.nix
  email.enable = true;

  # gamedev.nix
  gamedev.enable = true;

  # gaming.nix
  games.client.enable = true;

  # manual.nix
  manual.enable = true;

  # programming.nix
  programming = {
    rust.enable = true;
    zig.enable = true;
    nix.enable = true;
    web.enable = true;
  };

  # utils.nix
  utils = {
    enable = true;
    wayland = true;
    libs = true;
  };

  # wacom.nix
  wacom.enable = true;

  # server-gaming.nix (Sunshine)
  server-gaming.enable = true;
}
