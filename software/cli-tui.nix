{
  pkgs,
  config,
  pkgs-unstable,
  ...
}: {
  environment.systemPackages = with pkgs; [
    ghostty
  ];
}
