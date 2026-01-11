{
  pkgs,
  config,
  input,
  ...
}: {
  environment.systemPackages = with pkgs; [
    libwacom
    xf86_input_wacom
  ];
}
