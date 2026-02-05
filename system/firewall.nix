{
  pkgs,
  config,
  ...
}: {
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [
    4040
  ];
}
