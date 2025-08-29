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
      path = with pkgs; [ pass ];
  };
}
