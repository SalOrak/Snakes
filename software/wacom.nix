{
  pkgs,
  config,
  input,
  ...
}: {
  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };
}
