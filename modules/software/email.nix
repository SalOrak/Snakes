{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {
  options = {
    email.enable = lib.mkEnableOption "Enable local email";
    email.pkg = lib.mkOption {
      type = lib.types.package;
      default = pkgs.aerc;
      example = lib.literalExpression "pkgs.aerc";
      description = "The package to use for the local email client.";
    };
    email.protonmail.enable = lib.mkEnableOption "Enable Protonmail service";
    email.protonmail.certPath = lib.mkOption {
      type = lib.types.path;
      default = "~/opt/protonmail/cert.pem";
      example = lib.literalExpression "/home/user/path/to/cert.pem";
      description = "Path to protonmail-bridge certificate file.";
    };
  };

  config = lib.mkIf config.email.enable (lib.mkMerge [
    {
      environment.systemPackages = [
        config.email.pkg
        isync
        notmuch
      ];
    }
    (lib.mkIf config.email.protonmail.enable {
      services.protonmail-bridge = {
        enable = true;
        path = with pkgs; [keepassxc];
      };

      security.pki.certificateFiles = [
        config.email.protonmail.certPah
      ];
    })
  ]);
}
