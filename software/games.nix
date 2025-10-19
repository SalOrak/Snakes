{
  pkgs,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [
    wineWowPackages.waylandFull
    winetricks
    bottles
    pokefinder
    desmume
  ];
}
