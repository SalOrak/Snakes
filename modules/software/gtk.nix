{
  pkgs,
  config,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # gtk
    gtk-engine-murrine
    gtk_engines
    gsettings-desktop-schemas
    lxappearance
    glib
  ];
}
