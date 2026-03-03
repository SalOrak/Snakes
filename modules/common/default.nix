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
    ./services.nix
    ./documents.nix
  ];
}
