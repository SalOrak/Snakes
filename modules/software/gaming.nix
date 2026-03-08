{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    games.client.enable = lib.mkEnableOption "Enables Client game";
    games.client.moonlight = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Add Moonlight client packages.";
    };
    games.pokemonHacking = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = "Add Pokemon hacking tools and packages";
    };
  };

  config = lib.mkIf config.games.client.enable {
    environment.systemPackages = with pkgs;
      []
      ++ lib.optionals config.games.pokemonHacking [
        bottles # PKHex
        pokefinder
        desmume
      ]
      ++ lib.optionals config.games.client.moonlight [
        # Gaming
        moonlight-qt
        libva-utils
        ffmpeg-full
        mpv
      ];
  };
}
