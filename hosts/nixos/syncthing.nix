{
  pkgs,
  config,
  ...
}: {
  services.syncthing = {
    enable = true;
    dataDir = "/home/hector/syncthing";
    key = "${/home/hector/syncthing/config/key.pem}";
    cert = "${/home/hector/syncthing/config/cert.pem}";
    openDefaultPorts = true;
    configDir = "/home/hector/.config/syncthing";
    guiAddress = "0.0.0.0:8384";
    user = "hector";
    group = "syncthing";
    overrideDevices = false;
    overrideFolders = false;
    settings = {
      gui = {
        user = "user";
        password = "$2b$12$wvHTk8gdzixlGQ67qgwz3uYfCHxTh1ENaRPVeYDk8LzFyEwkuQ7PS";
      };
      devices = {
        "mobile" = {id = "CD2YOGC-PL6IVWC-TW3RGC4-AW6UPPI-LZGFIWB-7DNCN6G-QL4RZBS-HD65RQQ";};
      };
    };
  };
}
