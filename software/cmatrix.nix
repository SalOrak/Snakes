{
  pkgs,
  config,
  outputs,
  ...
}: {
  nixpkgs.overlays = [
    outputs.overlays.additions
  ];
  environment.systemPackages = with pkgs; [
    cmatrix
  ];
}
