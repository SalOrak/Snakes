{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    rclone
  ];

  #  Personal Drive Sync
  systemd.user = {
    services = {
      rclone-personal-drive = {
        description = "Bidirection sync Personal drives";
        wantedBy = ["graphical-session.target" "network-online.target"];
        after = ["graphical-session.target" "network-online.target"];
        serviceConfig = {
          Type = "oneshot";
          ExecStart = ''
            ${pkgs.rclone}/bin/rclone bisync ~/drive/personal/dev dev-personal:/ &;
            ${pkgs.rclone}/bin/rclone bisync ~/drive/personal/proton proton-personal:/ &;
          '';
        };
      };
      rclone-personal-drive--logout = {
        description = "Bidirection sync Personal drives at logout";
        before = ["exit.target"];
        serviceConfig = {
          Type = "oneshot";
          ExecStart = ''
            ${pkgs.rclone}/bin/rclone bisync ~/drive/personal/dev dev-personal:/ &;
            ${pkgs.rclone}/bin/rclone bisync ~/drive/personal/proton proton-personal:/ &;
          '';
        };
      };
    };

    timers = {
      rclone-personal-drive-boot = {
        description = "Run personal rclone at boot and every 15 min.";
        wantedBy = ["timers.target"];
        timerConfig = {
          OnBooSec = "1m";
          OnUnitActiveSec = "15m";
          Unit = "rclone-personal-drive.service";
          Persistent = true;
        };
      };
    };
  };

  #  Work Drive Sync
  systemd.user = {
    services = {
      rclone-work-drive = {
        description = "Bidirection sync work drives";
        wantedBy = ["graphical-session.target" "network-online.target"];
        after = ["graphical-session.target" "network-online.target"];
        serviceConfig = {
          Type = "oneshot";
          ExecStart = ''
            ${pkgs.rclone}/bin/rclone bisync ~/drive/work/proven work-proven:/ &;
          '';
        };
      };
      rclone-work-drive--logout = {
        description = "Bidirection sync work drives at logout";
        before = ["exit.target"];
        serviceConfig = {
          Type = "oneshot";
          ExecStart = ''
            ${pkgs.rclone}/bin/rclone bisync ~/drive/work/proven work-proven:/ &;
          '';
        };
      };
    };

    timers = {
      rclone-work-drive-boot = {
        description = "Run work rclone at boot and every 15 min.";
        wantedBy = ["timers.target"];
        timerConfig = {
          OnBooSec = "1m";
          OnUnitActiveSec = "15m";
          Unit = "rclone-work-drive.service";
          Persistent = true;
        };
      };
    };
  };
}
