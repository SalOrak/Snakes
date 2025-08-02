{
    description = "A simple NixOS flake";

    inputs = {
        # NixOS offical package source.
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
        nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
        system = "x86_64-linux";
    };

    outputs = { self, nixpkgs, system, ... }@inputs: {

        formatter = nixpkgs.legacyPackages.${system}.alejandra;
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "${system}";
            modules = [
                # Main Nixos Configuration file
                ./nixos/configuration.nix
            ];
        };
    };

}

