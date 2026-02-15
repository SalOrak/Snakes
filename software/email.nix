{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {
  email.enable = lib.mkEnableOption "Enable local email";
  email.protonmail.enable = lib.mkEnableOption "Enable Protonmail service";

  config = lib.mkIf config.email.enable (lib.mkMerge [
    {
      environment.systemPackages = with pkgs; [
        aerc
      ];
    }
    (lib.mkIf config.email.protonmail.enable {
      services.protonmail-bridge = {
        enable = true;
        path = with pkgs; [keepassxc];
      };

      security.pki.certificateFiles = [
        /home/hector/opt/protonmail/cert.pem
      ];
    })
  ]);
}
