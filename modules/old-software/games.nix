{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    games.enable = lib.mkEnableOption "enables client game";
    games.moonlight = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Add Moonlight client packages. ";
    };
    games.pokemonHacking = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = "Add Pokemon hacking tools and packages";
    };
  };

  config = lib.mkIf config.games.enable {
    environment.systemPackages = with pkgs;
      [yazi]
      ++ lib.optionals config.games.pokemonHacking [
        wineWowPackages.waylandFull
        winetricks
        bottles
        pokefinder
        desmume
      ]
      ++ lib.optionals config.games.moonlight [
        # Gaming
        moonlight-qt
        libva-utils
        ffmpeg-full
        mpv
      ];
  };
}
