{
  pkgs,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [
    bluez
    bluez-alsa
    bluez-tools
  ];
  hardware = {
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
    bluetooth.settings.General = {
      Enable = "Source,Sink,Media,Socket";
      experimental = true; # Show Battery
      # For pairing bluetooth controllers
      Privacy = "device";
      JustWorksRepairing = "always";
      Class = "0x000100";
      FastConnectable = true;
    };
  };
}
