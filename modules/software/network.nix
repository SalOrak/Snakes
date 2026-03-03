{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    network.vpn.enable = lib.mkEnableOption "Install VPN apps";
    network.hacking.enable = lib.mkEnableOption "Install Hacking Network apps";
  };

  config = {
    environment.systemPackages = with pkgs;
      [
        networkmanagerapplet
      ]
      ++ lib.optionals config.network.vpn.enable [
        wireguard-tools
        openvpn
      ]
      ++ lib.optionals config.network.hacking.enable [
        nmap
        fping
        wireshark
      ];
  };
}
