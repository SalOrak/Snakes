{
  pkgs,
  config,
  ...
}: {
  xdg.mime.defaultApplications = {
    "application/pdf" = "zathura.desktop";
    "application/msword" = "libreoffice-writer.desktop";
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "libreoffice-writer.desktop";
    "application/vnd.ms-excel" = "libreoffice-calc.desktop";
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = "libreoffice-calc.desktop";
    "audio/*" = "vlc.desktop";
    "video/*" = "vlc.desktop";
  };
}
