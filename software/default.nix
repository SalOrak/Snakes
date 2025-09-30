{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./base.nix
    ./cmatrix.nix
    ./email.nix
    ./remote-drive.nix
    ./mime-types.nix
    ./test.nix
  ];
}
