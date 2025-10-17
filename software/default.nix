{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./base.nix
    ./utils.nix
    ./cmatrix.nix
    ./email.nix
    ./remote-drive.nix
    ./mime-types.nix
    ./test.nix
    ./work.nix
  ];
}
