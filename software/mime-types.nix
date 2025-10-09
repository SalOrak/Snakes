{
  pkgs,
  config,
  ...
}: {
  xdg.mime.defaultApplications = {
    "application/pdf" = "zathura.desktop";
    "application/msword" = "writer.desktop";
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "writer.desktop";
    "application/vnd.ms-excel" = "calc.desktop";
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = "calc.desktop";
    "audio/*" = "vlc.desktop";
    "video/*" = "vlc.desktop";
  };
}
