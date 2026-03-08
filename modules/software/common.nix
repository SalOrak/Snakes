{
  pkgs,
  config,
  lib,
  ...
}
: {
  options = {
    gui.enable = lib.mkEnableOption "Install GUI-based application";
    cli.enable = lib.mkEnableOption "Install CLI applications";
  };

  config = {
    environment.systemPackages = with pkgs;
      [
        coreutils
        binutils
        pciutils
        inetutils
        dmidecode
        brightnessctl
        file
      ]
      ++ lib.optionals config.gui.enable [
        librewolf
        alacritty
        alacritty-theme
        obsidian
        inkscape
        firefox
      ]
      ++ lib.optionals config.cli.enable [
        hut
        bat
        neovim
        starship
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
        wofi
		ueberzugpp # image support
      ];
  };
}
