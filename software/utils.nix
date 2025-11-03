{
  pkgs,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [
    e2fsprogs
    dosfstools
  ];

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      icu
      libusb1
    ]; # Fix Marksman problems
  };
}
