{
  pkgs,
  pkgs-unstable,
  config,
  lib,
  ...
}:
{
  options = {
    comms.gui.enable = lib.mkEnableOption "Install GUI-based comms apps";
    comms.cli.enable = lib.mkEnableOption "Install CLI-based comms apps";
  };


  config = {
    environment.systemPackages = 
    [
    ]
    ++ lib.optionals config.comms.gui.enable [
      pkgs-unstable.discord
      pkgs-unstable.signal-desktop
    ]
    ++ lib.optionals config.comms.cli.enable [
      pkgs-unstable.halloy # IRC
      pkgs-unstable.mutt # mutt
    ];
  };

}
