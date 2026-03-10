{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: let
  mbsync-notmuch-script = pkgs.writeShellScriptBin "mbsync-notmuch-script" ''
    	MBSYNC=$(pgrep mbsync)
    NOTMUCH=$(pgrep notmuch)

    	if [ -n "$MBSYNC" -o -n "$NOTMUCH" ]; then
    	echo "Already running one instance of mbsync or notmuch. Exiting..."
    	exit 0
    	fi

    	echo "Deleting messages tagged as *deleted*"
    	${pkgs.notmuch} search --format=text0 --output=files tag:deleted | xargs -0 --no-run-if-empty rm -v

    	${pkgs.isync} -Va
    	${pkgs.notmuch} new
  '';
in {
  options = {
    email.enable = lib.mkEnableOption "Enable local email";
    email.pkg = lib.mkOption {
      type = lib.types.package;
      default = pkgs.aerc;
      example = lib.literalExpression "pkgs.aerc";
      description = "The package to use for the local email client.";
    };
    email.mbsync = lib.mkEnableOption "Enable Mbsync service";
    email.notmuch.path = lib.mkOption {
      type = lib.types.path;
      default = "~/.mail/";
      example = lib.literalExpression "/home/user/path/to/notmuch/db";
      description = "Path to the notmuch database.";
    };
    email.protonmail.enable = lib.mkEnableOption "Enable Protonmail service";
    email.protonmail.certPath = lib.mkOption {
      type = lib.types.path;
      default = "~/opt/protonmail/cert.pem";
      example = lib.literalExpression "/home/user/path/to/cert.pem";
      description = "Path to protonmail-bridge certificate file.";
    };
  };

  config = lib.mkIf config.email.enable (lib.mkMerge [
    {
      environment.systemPackages = [
        config.email.pkg
        pkgs.isync
        pkgs.notmuch
        pkgs.msmtp

        # Filters
        pkgs.catimg
        pkgs.bat
        pkgs.pandoc
      ];
    }
    (lib.mkIf config.email.mbsync {
      systemd.user = {
        services = {
          mbsync = {
            description = "Mailbox sync with Notmuch integration.";
            wantedBy = ["graphical-session.target" "network-online.target"];
            after = ["graphical-session.target" "network-online.target"];
            serviceConfig = {
              Type = "oneshot";
              ExecStart = "${mbsync-notmuch-script}/bin/mbsync-notmuch-script";
            };
          };
        };
        timers = {
          mbsync = {
            description = "Run mbsync every 3 min";
            wantedBy = ["timers.target"];
            timerConfig = {
              OnStartupSec = "3m";
              OnUnitActiveSec = "3m";
              Unit = "mbsync.service";
              Persistent = false;
            };
          };
        };
        paths = {
          notmuch = {
            description = "Notmuch sync on changes.";
            pathConfig = {
              PathChanged = config.email.notmuch.path;
              Unit = "mbsync.service";
            };
          };
        };
      };
    })
    (lib.mkIf config.email.protonmail.enable {
      services.protonmail-bridge = {
        enable = true;
        path = with pkgs; [keepassxc];
      };

      security.pki.certificateFiles = [
        config.email.protonmail.certPah
      ];
    })
  ]);
}
