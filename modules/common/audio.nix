{
  pkgs,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [
    ffmpeg
    vlc
    wireplumber
    pipewire
  ];
  # rtkit is optional but recommended
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true; # if not already enabled
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
    wireplumber = {
      enable = true;
    };
  };
}
