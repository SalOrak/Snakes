{
  pkgs,
  config,
  ...
}: {
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [
    4040 # Apache NiFi
    2222 # SSH
  ];
}
