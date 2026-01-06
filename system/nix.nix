{
  pkgs,
  config,
  ...
}: {
  nix = {
    settings = {
      auto-optimise-store = true;

      # Enable flakes
      experimental-features = ["nix-command" "flakes"];
    };
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };

    # Easy access to custom templates (nix flake init -t orak#)
    # To update: `nix flake update --flake orak`
    registry = {
      orak = {
        from = {
          type = "indirect";
          id = "orak";
        };
        to = {
          type = "git";
          url = "https://github.com/salorak/nix-orak";
        };
      };
    };
  };

  nixpkgs.config.allowUnfree = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Fix Marksman LSP problems
    icu
    libusb1
  ];
}
