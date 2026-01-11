{
  pkgs,
  config,
  input,
  ...
}: {
  environment.systemPackages = with pkgs; [
    libwacom
  ];
}
