{
  pkgs,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [
    e2fsprogs
    dosfstools
  ];
}
