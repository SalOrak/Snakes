{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./bootloader.nix
    ./nix.nix
    ./system.nix
    ./hardware.nix
    ./display-manager.nix
    ./programs.nix
    ./services.nix
    ./udev.nix
    ./firewall.nix
  ];
}
