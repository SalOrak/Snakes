{
  pkgs,
  config,
  pkgs-unstable,
  ...
}: {
  environment.systemPackages = [
    #  IRC clients
    pkgs.irssi
    # Latex Replacements
    pkgs.typst

    # Tor
    pkgs.tor

    kitty
    neovide
  ];
}
