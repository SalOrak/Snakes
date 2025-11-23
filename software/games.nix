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
    # Gaming
    moonlight-qt
    libva-utils
    ffmpeg-full
    mpv
  ];
}
