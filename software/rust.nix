{
  pkgs,
  pkgs-unstable,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [
    clippy
    openocd
    gdb
    udev
    bacon
    rusty-man # Rust in the MAN pages
  ];
}
