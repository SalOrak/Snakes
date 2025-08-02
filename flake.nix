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
  } @ inputs: {
    formatter."x86_64-linux" = nixpkgs.legacyPackages."x86_64-linux".alejandra;
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Main Nixos Configuration file
        ./nixos/configuration.nix
      ];
    };
  };
}
