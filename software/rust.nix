{
  pkgs,
  pkgs-unstable,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [
    rustup
    clippy
    openocd
    gdb
    udev
  ];
}
