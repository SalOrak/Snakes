{
  pkgs,
  config,
  outputs,
  lib,
  ...
}: {
  options = {
    cmatrix.enable = lib.mkEnableOption "Orak Cmatrix package";
  };

  config = lib.mkIf config.cmatrix.enable {
    nixpkgs.overlays = [
      outputs.overlays.additions
    ];
    environment.systemPackages = with pkgs; [
      cmatrix
    ];
  };
}
