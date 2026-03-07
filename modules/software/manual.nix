{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    manual.enable = lib.mkEnableOption "Enable documentation (man).";
  };

  config = lib.mkIf config.manual.enable {
    environment.systemPackages = with pkgs; [
      man-pages
      man-pages-posix
    ];

    documentation = {
      enable = true;
      man = {
        enable = true;
        generateCaches = true;
      };
      nixos.enable = true;
      info.enable = true;
      doc.enable = true;
      dev.enable = true;
    };
  };
}
