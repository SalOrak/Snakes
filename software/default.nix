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
    ./wacom.nix
    ./gamedev.nix
  ];

  # Email
  email.enable = true;
  email.protonmail.enable = true;

  # Gaming (client)
  games.enable = true;
  games.pokemonHacking = true;

  # Gamedev Software
  gamedev.enable = true;

  # Wacom Support through opentablet
  wacom.enable = true;

  # Remote Drive (Google Drive*)
  remoteDrive.enable = true;
  remoteDrive.personal = true;
  remoteDrive.work = true;
}
