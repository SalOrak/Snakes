{
  pkgs,
  config,
  ...
}: {
  services.dbus.enable = true;
  services.openssh = {
    enable = false;
    settings = {
      PasswordAuthentication = true;
      # Port = 2222;
      PermitRootLogin = "no";
      # AuthorizedKeys2File = "/home/hector/.ssh/authorized_keys";
    };
    listenAddresses = [
      {
        addr = "192.168.1.136";
        port = 2222;
      }
    ];
    banner = "

//////////////////////////////////////////////
//                                          //
//    ▒█████   ██▀███   ▄▄▄       ██ ▄█▀    //
//   ▒██▒  ██▒▓██ ▒ ██▒▒████▄     ██▄█▒     //
//   ▒██░  ██▒▓██ ░▄█ ▒▒██  ▀█▄  ▓███▄░     //
//   ▒██   ██░▒██▀▀█▄  ░██▄▄▄▄██ ▓██ █▄     //
//   ░ ████▓▒░░██▓ ▒██▒ ▓█   ▓██▒▒██▒ █▄    //
//   ░ ▒░▒░▒░ ░ ▒▓ ░▒▓░ ▒▒   ▓▒█░▒ ▒▒ ▓▒    //
//     ░ ▒ ▒░   ░▒ ░ ▒░  ▒   ▒▒ ░░ ░▒ ▒░    //
//   ░ ░ ░ ▒    ░░   ░   ░   ▒   ░ ░░ ░     //
//       ░ ░     ░           ░  ░░  ░       //
//                                          //
//////////////////////////////////////////////

	";
  };
  # Custom Systemd Services
  systemd.user.services = {
    dunst = {
      description = "Dunst: Notification server";
      wantedBy = ["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        ExecStart = ''${pkgs.dunst}/bin/dunst'';
        RestartSec = 3;
        Restart = "always";
      };
    };
  };
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
        password = "$2y$12$r5OyOjbLBGAijRtoQ31xBOf0OKtJKYi6Pgl4CU9UiDeGUM9CwBffy";
      };
      devices = {
        "mobile" = {id = "CD2YOGC-PL6IVWC-TW3RGC4-AW6UPPI-LZGFIWB-7DNCN6G-QL4RZBS-HD65RQQ";};
      };
    };
  };
  # Bluetooth
  services.blueman.enable = true; # bluetooth gui

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

  services.blocky = {
    enable = true;
    settings = {
      ports.dns = 53; # Port for incoming DNS Queries.
      upstreams.groups.default = [
        "1.1.1.1"
        "208.67.222.123"
        "8.8.8.8"
        "9.9.9.9"
      ];
      # For initially solving DoH/DoT Requests when no system Resolver is available.
      bootstrapDns = {
        upstream = "208.67.222.123";
      };
      #Enable blocking of certain domains.
      blocking = {
        denylists = {
          #Adblocking
          ads = ["https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"];
          #Another filter for blocking adult sites
          adult = [
            "https://blocklistproject.github.io/Lists/porn.txt"
            "https://blocklistproject.github.io/Lists/tiktok.txt"
            "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/porn-only/hosts"
            "https://raw.githubusercontent.com/Sinfonietta/hostfiles/master/pornography-hosts"
          ];
          #You can add additional categories
        };
        #Configure what block categories are used
        clientGroupsBlock = {
          default = ["ads" "adult"];
        };
      };
      caching = {
        minTime = "5m";
        maxTime = "30m";
        prefetching = true;
      };
    };
  };
  # Make blocky the DNS gateway
  networking.nameservers = ["127.0.0.1"];
  environment.etc = {
    "resolv.conf".text = "nameserver 127.0.0.1\n";
  };
}
