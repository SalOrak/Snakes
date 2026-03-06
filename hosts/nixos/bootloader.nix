{
  pkgs,
  config,
  ...
}: {
  boot.loader = {
    # systemd-boot.enable = true;
    # systemd-boot.configurationLimit = 5;
    # systemd-boot.consoleMode = "auto";
    efi.canTouchEfiVariables = true;
    grub.enable = true;
    grub.efiSupport = true;
    # grub.useOSProber = true;
    grub.device = "nodev";
    # grub.theme = "${pkgs.grub-theme}";
  };

  # Connect xbox controller
  boot.extraModprobeConfig = ''
    options bluetooth disable_ertm=Y
  '';
}
