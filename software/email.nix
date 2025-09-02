{
  pkgs,
  config,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    aerc
  ];

  services.protonmail-bridge = { 
      enable = true;
      path = with pkgs; [ keepassxc ];
  };

  security.pki.certificateFiles= [
    /home/hector/opt/protonmail/cert.pem
  ];
}
