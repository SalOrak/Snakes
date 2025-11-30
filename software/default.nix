{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./base.nix
    ./packages.nix
    ./utils.nix
    ./cmatrix.nix
    ./email.nix
    ./remote-drive.nix
    ./mime-types.nix
    ./test.nix
    ./work.nix
    ./games.nix
    ./embedded.nix
    ./virtualization.nix
    ./rust.nix
  ];

  games.enable = true;
  games.pokemonHacking = true;
}
