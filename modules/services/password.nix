{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    password-manager.enable = lib.mkEnableOption "Enable password manager";
    password-manager.secret-service = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Enable secret service integration";
    };
  };
  config = lib.mkIf config.password-manager.enable {
    environment.systemPackages = with pkgs;
      [
        keepassxc
      ]
      ++ lib.optionals password-manager.secret-service [
        wayprompt # Prompt for git password
        libsecret
      ];
  };
}
