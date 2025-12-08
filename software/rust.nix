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
    bacon
    rusty-man # Rust in the MAN pages
  ];
}
