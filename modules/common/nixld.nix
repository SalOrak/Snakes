{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    icu # International Components for Unicode
    libusb1 # USB Access
  ];
}
