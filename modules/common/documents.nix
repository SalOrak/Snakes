{
  pkgs,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [
    zathura
    libreoffice

    texliveFull # TeX live environment
    typst

    pandoc

    imagemagick
  ];
}
