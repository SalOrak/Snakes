{
  pkgs,
  pkgs-unstable,
  config,
}: {
  environment.systemPackages = with pkgs; [
    rustup
    clippy
    openocd
    pkg-config-unwrapped
    gdb
    udev
  ];
}
