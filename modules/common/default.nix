{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./nix.nix
    ./nixld.nix
    ./audio.nix
    ./dbus.nix
    ./direnv.nix
    ./gnupg.nix
    ./documents.nix
    ./disk.nix
  ];
}
