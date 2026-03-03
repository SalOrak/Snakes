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
        vpl-gpu-rt # Replacement for intel-media-sdk
        # OpenCL support for intel CPUs before 12th gen
        # see: https://github.com/NixOS/nixpkgs/issues/356535
        intel-compute-runtime-legacy1
        intel-media-driver # LIBVA_DRIVER_NAME=iHD
        intel-vaapi-driver # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
        libvdpau-va-gl
      ];
    };
  };
}
