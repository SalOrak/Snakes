{pkgs ? import <nixpkgs> {}}:
pkgs.stdenv.mkDerivation rec {
  pname = "dwm";
  version = "6.5";
  src = pkgs.fetchFromGitHub {
    owner = "salorak";
    repo = "dwm-build";
    rev = "master";
    hash = "sha256-E1YUrG2NBTH4UXYj9MLuwRN28kvlT5rBnAaZOV3XkbU=";
  };
  buildInputs = with pkgs; [
    gcc
    gnumake
    libx11
    libxinerama
    libxft
  ];

  buildPhase = ''
    make all -j$(nproc)
  '';

  installPhase = ''
    mkdir -p $out/bin
    mv dwm $out/bin/dwm
  '';
}
