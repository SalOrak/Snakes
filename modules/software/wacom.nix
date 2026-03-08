{
  pkgs,
  config,
  input,
  lib,
  ...
}: {
  options = {
    wacom.enable = lib.mkEnableOption "Enable Wacom software (opentablet)";
  };

  config = lib.mkIf config.wacom.enable {
    hardware.opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
  };
}
