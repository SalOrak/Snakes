{
  pkgs,
  pkgs-unstable,
  ...
}: {
  environment.systemPackages = with pkgs; [
    oversteer
    usb-modeswitch

    dunst # Notify service
    kitty # for Yazi file manager
  ];

  hardware = {
    new-lg4ff = {
      enable = false;
    };
    usb-modeswitch = {
      enable = false;
    };
  };

  services.udev.extraRules = ''
    # Logitech G29 Driving Force
    ATTRS{idVendor}=="046D", ATTRS{idProduct}=="c24f", MODE="0666",  GROUP="users"
  '';
}
