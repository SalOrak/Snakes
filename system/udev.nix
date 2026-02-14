{
  pkgs,
  config,
  lib,
  ...
}: {
  services.udev.extraRules =
    lib.fileContents ./udev/50-qmk.rules
    + "\n"
    + lib.fileContents ./udev/69-microbit.rules
    + "\n"
    + lib.fileContents ./udev/69-probe-rs.rules;
}
