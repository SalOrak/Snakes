{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS offical package source.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    ...
  } @ inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
    hostname = "nixos";
    user = "hector";
  in {
    packages."${system}" = import ./pkgs nixpkgs.legacyPackages."${system}";

    # Formatter for your nix files, available through 'nix fmt'
    formatter."${system}" = nixpkgs.legacyPackages."${system}".alejandra;

    # Your custom packages and modifications, exported as overlays
    overlays = import ./overlays {inherit inputs;};

    nixosConfigurations."${hostname}" = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs outputs system;

        pkgs-unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      };

      modules = [
        # Main Nixos Configuration file
        ./system
        ./software
        # ./overlays
        ({pkgs, ...}: {nixpkgs.overlays = [inputs.rust-overlay.overlays.default];})
      ];
    };
  };
}
