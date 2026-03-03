{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./nix.nix
    ./audio.nix
    ./dbus.nix
    ./direnv.nix
    ./gnupg.nix
    ./documents.nix
  ];
}
