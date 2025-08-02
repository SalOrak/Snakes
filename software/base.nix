{
  pkgs,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # Gui apps
    firefox
    alacritty
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

    # Man pages
    man-pages
    man-pages-posix
  ];
}
