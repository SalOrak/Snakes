{
  pkgs,
  config,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    picom # Compositor

    yt-dlp

    zola # SSG

    qemu

    dunst

  ];
}
