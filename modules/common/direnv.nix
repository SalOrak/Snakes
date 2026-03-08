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
}
