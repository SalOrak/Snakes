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

    gamedev.godot = lib.mkOption {
      type = lib.types.package;
      default = pkgs.godotPackages_4_6.godot;
      example = lib.literalExpression "pkgs.godotPackages_4_6.godot";
      description = "Install Godot Game engine";
    };
  };

  config = lib.mkIf config.gamedev.enable {
    environment.systemPackages = 
      []
      ++ lib.optionals config.gamedev.pixelart [
        pkgs.krita
        pkgs.aseprite
        pkgs.pinta
		config.gamedev.godot
      ];
  };
}
