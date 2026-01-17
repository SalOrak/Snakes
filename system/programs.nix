{
  pkgs,
  config,
  ...
}: {
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = false;
    enableFishIntegration = false;
    loadInNixShell = true;
    # This depends on `direnvrc` file hack in dotfiles repo.
    # Check out the first comment
    # See https://github.com/SalOrak/dotfiles/blob/main/files/direnv/direnvrc
    nix-direnv.enable = true;
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
