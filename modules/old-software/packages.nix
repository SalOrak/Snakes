{
  pkgs,
  config,
  pkgs-unstable,
  ...
}: {
  environment.systemPackages =
    (with pkgs; [
      # Command Prompt
      starship
      android-tools

      # Cli Apps
      xorg.libXi
      xorg.libXmu
      freeglut
      xorg.libXext
      xorg.libX11
      xorg.libXv
      xorg.libXrandr
      zlib
      libtool
      libvterm
      scrot
      rofi
      rsync
      xclip
      caligula # TUI Disk Burner
      ntfs3g # NTFS mount
      bat
      ncurses

      # gtk
      gtk-engine-murrine
      gtk_engines
      gsettings-desktop-schemas
      lxappearance
      glib

      # PDF viewing and manipulation
      imagemagick

      isync # Mailbox Synchronizer
      notmuch # Mail Indexer
      pass # Command Line password  manager
      gnupg # GPG

      #Services
      #dwm-bar
      dunst
      #dwm-blocks
      picom

      # Theme
      gruvbox-dark-icons-gtk

      # Utils
      texliveFull # TeX Live Environment
      typst # Slowly replacing LaTex I guess
      pandoc

      # Video / Audio
      yt-dlp

      ## Other Gui Apps
      kdePackages.dolphin
      docker
      calibre
      discord

      # Programming
      gnumake
      gcc
      clang
      clippy
      python3
      alejandra
      nodejs_24
      nasm
      go

      # Java Programming
      maven
      gradle
      jdk21_headless
      spring-boot-cli
      kubernetes
      kubernetes-helm
      minikube
      kafkactl

      # SSG
      zola

      # Qemu
      qemu

      # Ansible
      ansible
      sshpass
    ])
    ++ (with pkgs-unstable; [
      zig
      exercism
    ]);
}
