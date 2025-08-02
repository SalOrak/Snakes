{pkgs ? import <nixpkgs> {}}:
pkgs.stdenv.mkDerivation rec {
  pname = "dwm-blocks";
  version = "0.1";
  src = pkgs.fetchFromGitHub {
    owner = "salorak";
    repo = "dwm-blocks";
    rev = "master";
    hash = "sha256-3245KgKqVxK+2ASE1kBFlR1eg5YTYMWIGZR56g//Tu0=";
  };
  buildInputs = with pkgs; [
    gcc
    gnumake
    xorg.libX11
    xorg.libXinerama
    xorg.libXft
  ];

  buildPhase = ''
    make all -j$(nproc)
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp -r status/* $out/bin/
    mv dwmblocks $out/bin/dwmblocks
     '';
}
