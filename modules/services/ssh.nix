{
  pkgs,
  config,
  lib,
  ...
}: {
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      Port = 2222;
      PermitRootLogin = "no";
      Banner = toString ./ssh/Banner.txt;
    };
  };
}
