{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    server-gaming.enable = lib.mkEnableOption "Enables Server-side Gaming Platform";

    server-gaming.steamCompatPath = lib.mkOption {
      type = lib.types.path;
      default = "/home/user/.steam/root/compatibilitytools.d";
      example = lib.literalExpression "/home/user/.steam/root/compatibilitytools.d";
      description = "Set the path for the Steam compatibility tooling.";
    };
  };

  config = lib.mkIf config.server-gaming.enable {
    environment.systemPackages = with pkgs; [
      # Wine
      wineWowPackages.stable
      winetricks
      wineWowPackages.waylandFull
    ];

    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = config.server-gaming.steamCompatPath;
    };

    services.avahi.publish = {
      enable = true;
      userServices = true;
    };

    services.sunshine = {
      enable = true;
      autoStart = true;
      capSysAdmin = true;
      applications = {
        env = {
          PATH = "$(PATH):$(HOME)/.local/bin";
        };
        apps = [
          {
            name = "Steam";
            detached = [
              "setsid steam"
            ];
            exclude-global-prep-cmd = "false";
          }
        ];
      };
    };

    programs.steam.enable = true;
    programs.steam.gamescopeSession.enable = true;
    programs.gamemode.enable = true;

    # Open ports for sunshine
    networking.firewall = {
      enable = true;
      allowedTCPPorts = [
        47984
        47989
        47990
        48010 # Sunshine
      ];
      allowedUDPPortRanges = [
        {
          from = 47998;
          to = 48000;
        }
      ];
    };
  };
}
