{
  pkgs,
  config,
  ...
}: {
  services.syncthing = {
    enable = true;
    dataDir = "/home/user/syncthing";
    openDefaultPorts = true;
    #   Generate a new configuration with key and pem using
    #   nix-shell -p syncthing --run "syncthing generate --config
    #   ~/.config/syncthing"
    configDir = "/home/user/.config/syncthing";
    guiAddress = "0.0.0.0:8384";
    user = "user";
    group = "syncthing";
    overrideDevices = false;
    overrideFolders = false;
    settings = {
      gui = {
        user = "user";
        password = "$2b$12$6uH.uX4MI0W0OszE2c10S.8SddNdZKrQE5xHGLujc8zEGtFnNWM5a";
      };
    };
  };
}
