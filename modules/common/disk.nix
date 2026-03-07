{
  pkgs,
  config,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    ntfs3g # NTFS Mount
    caligula # TUI Disk Burner
      android-tools
  ];
}
