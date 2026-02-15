{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    gamedev.enable = lib.mkEnableOption "Enable GameDev software";
    gamedev.pixelart = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Add Pixelart software packages. ";
    };

    gamedev.engines = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Add engine software (Godot)";
    };
  };

  config = lib.mkIf config.gamedev.enable {
    environment.systemPackages = with pkgs;
      []
      ++ lib.optionals config.gamedev.pixelart [
		krita 
		aseprite
		pinta
      ]
      ++ lib.optionals config.gamedev.engines [
		godot
      ]
  };
}
