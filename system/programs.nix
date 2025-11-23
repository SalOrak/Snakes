{
  pkg,
  config,
  ...
}: {
  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
    };
  };

  programs.mtr.enable = true;
  programs.gnupg = {
    agent = {
      enable = true;
      enableSSHSupport = true;
      settings = {
        default-cache-ttl = 86400;
        default-cache-ttl-ssh = 86400;
        max-cache-ttl = 2592000;
        max-cache-ttl-ssh = 2592000;
      };
    };
  };
}
