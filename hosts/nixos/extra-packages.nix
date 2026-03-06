{
  pkgs,
  config,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    dunst # Notify service
    picom # Compositor

    yt-dlp

    zola # SSG

    qemu
  ];
}
