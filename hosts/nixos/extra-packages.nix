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

    # Signal desktop
    signal-desktop

    # discord
    discord

    kitty # for yazi manager
	helix # Pau likes it. So do I
  ];
}
