{pkgs ? import <nixpkgs> {}}:
pkgs.stdenv.mkDerivation rec {
  pname = "cmatrix";
  version = "0.1.0";
  src = pkgs.fetchFromGitHub {
    owner = "salorak";
    repo = "cursed-matrix";
    rev = "85b6514d83ef141fc6f2e94beb013f81db44966e";
    hash = "sha256-Ku9mz4C8kKW+wI+Bx1rw8OuRIEdpzngZXaT7NXlp/80=";
  };

  buildInputs = with pkgs; [
    gcc
    gnumake
    ncurses5
  ];

  buildPhase = ''
    make all
  '';

  installPhase = ''
    mkdir -p $out/bin
    mv main $out/bin/cmatrix
  '';
}
