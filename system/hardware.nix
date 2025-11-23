{
  pkgs,
  config,
  ...
}: {
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
    enableAllFirmware = true;
    xpadneo.enable = true; # driver for XboxOne Wireless Controller
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        # your Open GL, Vulkan and VAAPI drivers
        # vpl-gpu-rt          # for newer GPUs on NixOS >24.05 or unstable
        # onevpl-intel-gpu  # for newer GPUs on NixOS <= 24.05
        intel-media-sdk # for older GPUs
        intel-media-driver # LIBVA_DRIVER_NAME=iHD
        intel-vaapi-driver # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
        libvdpau-va-gl
      ];
    };
  };
}
