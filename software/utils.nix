{
  pkgs,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [
    e2fsprogs
    dosfstools

    # Pinentry (prompt for github password)
    wayprompt
  ];
}
