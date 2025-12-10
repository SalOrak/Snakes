{
  pkgs,
  pkgs-unstable,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [
    rust-bin.stable.latest.default
    clippy
    openocd
    gdb
    udev
    bacon
    rusty-man # Rust in the MAN pages
  ];
}
