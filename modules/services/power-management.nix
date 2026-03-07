{
  pkgs,
  config,
  lib,
  ...
}: {
  services.tlp = {
    enable = true;
    settings = {
      # Thinkpad
      ## Operation ##
      TLP_ENABLE = 1;
      TLP_WARN_LEVEL = 3;
      TLP_DEFAULT_MODE = "AC";

      ## Audio ##
      SOUND_POWER_SAVE_ON_AC = 0;
      SOUND_POWER_SAVE_ON_BAT = 1;
      SOUND_POWER_SAVE_CONTROLLER = "Y";

      ## Battery Care ##
      # Battery charge level below which charging will begin
      # when connecting the charger
      START_CHARGE_THRESH_BAT0 = 75;
      # Battery charge level above which charging will stop
      # while the charger is connected
      STOP_CHARGE_THRESH_BAT0 = 80;

      ## Optimization
      # Change CPU energy performance to power
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 75;

      # Enable platform profile on low-power
      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "low-power";

      # Disable turbo boost
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 1;

      # Increase ABM level
      AMDGPU_ABM_LEVEL_ON_AC = 0;
      AMDGPU_ABM_LEVEL_ON_BAT = 2;

      # Enable runtime power management
      # Set to `on` because it disconnects the keyboard
      ## auto -- enabled (power down idle devices)
      ## on -- disabled (devices powered on permanently)
      RUNTIME_PM_ON_AC = "on";
      RUNTIME_PM_ON_BAT = "on";

      # Autosuspend USB
      USB_AUTOSUSPEND = 0;
    };
  };
}
