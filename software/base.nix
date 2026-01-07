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
    obsidian

    # Cli apps
    vim
    neovim
    fzf
    fd
    ripgrep
    feh
    wget
    curl
    tmux
    zip
    unzip
    jq
    gitFull

    # BinUtils
    coreutils
    binutils
    pciutils
    inetutils
    dmidecode
    brightnessctl
    file

    # Temperature wise
    lm_sensors

    # Image utils
    inkscape

    # Man pages
    man-pages
    man-pages-posix
  ];
}
