{
  pkgs,
  pkgs-unstable,
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
        pkgs.coreutils
        pkgs.binutils
        pkgs.pciutils
        pkgs.inetutils
        pkgs.dmidecode
        pkgs.brightnessctl
        pkgs.file
      ]
      ++ lib.optionals config.gui.enable [
        pkgs.librewolf
        pkgs.alacritty
        pkgs.alacritty-theme
        pkgs.obsidian
        pkgs.inkscape
        pkgs.firefox
      ]
      ++ lib.optionals config.cli.enable [
        pkgs.nb
        pkgs.hut
        pkgs.bat
		pkgs.yazi
        pkgs-unstable.neovim
        pkgs.nvimpager
        pkgs.starship
        pkgs.fzf
        pkgs.fd
        pkgs.ripgrep
        pkgs.feh
        pkgs.wget
        pkgs.curl
        pkgs.tmux
        pkgs.zip
        pkgs.unzip
        pkgs.jq
        pkgs.gitFull
        pkgs.wofi
        pkgs.ueberzugpp # image support
      ];
  };
}
