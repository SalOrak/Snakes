{
  pkgs,
  pkgs-unstable,
  config,
  lib,
  ...
}: {
  options = {
    # Rust
    programming.rust.enable = lib.mkEnableOption "Setup Rust Programming";
    programming.rust.pkgs = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = with pkgs; [
        rust-bin.stable.latest.default
        clippy
        openocd
        udev
        bacon
      ];
      description = "Packages for Rust programming.";
    };

    programming.zig.enable = lib.mkEnableOption "Setup Zig Programming";
    programming.zig.pkgs = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = (with pkgs-unstable; [zig]) ++ (with pkgs; [zls]);
      description = "Packages for Zig programming.";
    };

    programming.markdown.enable = lib.mkEnableOption "Setup Markdown.";
    programming.markdown.pkgs = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = with pkgs; [
        marksman
      ];
      description = "Packages for Markdown.";
    };

    programming.java.enable = lib.mkEnableOption "Setup Java Programming";
    programming.java.pkgs = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = with pkgs; [
        maven
        gradle
        jdk21_headless
        spring-boot-cli
        jdt-language-server # lsp
      ];
      description = "Packages for Zig programming.";
    };

    programming.nix.enable = lib.mkEnableOption "Setup Nix Programming";
    programming.nix.pkgs = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = with pkgs; [
        alejandra # Formatter
        nil # LSP
      ];
      description = "Packages for Nix programming.";
    };

    programming.python.enable = lib.mkEnableOption "Setup Python Programming";
    programming.python.pkgs = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = with pkgs; [
        python314
        python314Packages.python-lsp-server # LSP
      ];
      description = "Packages for Python programming.";
    };

    programming.nasm.enable = lib.mkEnableOption "Setup Assembly Programming";
    programming.nasm.pkgs = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = with pkgs; [
        nasm
        nasmfmt
        asm-lsp # LSP
      ];
      description = "Packages for Assembly programming.";
    };

    programming.c.enable = lib.mkEnableOption "Setup C Programming";
    programming.c.pkgs = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = with pkgs; [
        clang
        gcc
      ];
      description = "Packages for C programming.";
    };

    programming.web.enable = lib.mkEnableOption "Setup Web Programming";
    programming.web.pkgs = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = with pkgs; [
        nodejs_24
        vscode-css-languageserver # CSS LSP
      ];
      description = "Packages for Web programming.";
    };

    programming.embedded.enable = lib.mkEnableOption "Setup Embedded Programming";
    programming.embedded.pkgs = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = with pkgs; [
        ninja
        ccache
        libffi
        dfu-util
        libusb1
        cmake
        flex
        bison
        gperf
        usbutils
      ];
      description = "Packages for Embedded programming.";
    };
  };

  config = {
    environment.systemPackages =
      [
        pkgs.gnumake
        pkgs.gdb
        pkgs.gf # GDB Frontend
      ]
      ++ lib.optionals config.programming.rust.enable config.programming.rust.pkgs
      ++ lib.optionals config.programming.zig.enable config.programming.zig.pkgs
      ++ lib.optionals config.programming.java.enable config.programming.java.pkgs
      ++ lib.optionals config.programming.nix.enable config.programming.nix.pkgs
      ++ lib.optionals config.programming.python.enable config.programming.python.pkgs
      ++ lib.optionals config.programming.nasm.enable config.programming.nasm.pkgs
      ++ lib.optionals config.programming.c.enable config.programming.c.pkgs
      ++ lib.optionals config.programming.embedded.enable config.programming.embedded.pkgs
      ++ lib.optionals config.programming.markdown.enable config.programming.markdown.pkgs
      ++ lib.optionals config.programming.web.enable config.programming.web.pkgs;
  };
}
