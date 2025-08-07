{
  pkgs,
  config,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # Gui apps
    firefox
    alacritty
    alacritty-theme
    keepassxc

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
    git

    # BinUtils
    coreutils
    binutils
    pciutils
    inetutils
    dmidecode
    brightnessctl
    file

    # Image utils
    inkscape

    # Man pages
    man-pages
    man-pages-posix
  ];
}
