{
  pkgs,
  config,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # Gui apps
    firefox
    librewolf
    ungoogled-chromium
    ghostty
    alacritty
    alacritty-theme
    keepassxc
    libsecret

    # Temperature wise
    lm_sensors

    # Image utils
    inkscape

    # Man pages
    man-pages
    man-pages-posix
  ];
}
