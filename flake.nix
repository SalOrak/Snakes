{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS offical package source.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
  in {
    packages."${system}" = import ./pkgs nixpkgs.legacyPackages."${system}";
    # Formatter for your nix files, available through 'nix fmt'
    formatter."${system}" = nixpkgs.legacyPackages."${system}".alejandra;

    # Your custom packages and modifications, exported as overlays
    overlays = import ./overlays {inherit inputs;};

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs outputs;};
      modules = [
        # Main Nixos Configuration file
        ./nixos/configuration.nix
        ./software
      ];
    };
  };
}
