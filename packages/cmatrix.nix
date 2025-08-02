{ pkgs ? import <nixpkgs> {} }:


pkgs.stdenv.mkDerivation rec {
  pname = "cmatrix";
  version = "0.1.0";
  src = pkgs.fetchFromGitHub {
    owner = "salorak";
    repo = "cursed-matrix";
    rev = "0b19b94457dd7b74817017820f768b8791821561";
    hash = "sha256-Y98q2tl7L3IJpJOMo+6sr5Ykb7XF+iZ7SUz6pqDCZPA=";
  };

  buildInputs = with pkgs; [
    gcc
    gnumake
    ncurses5
  ];

  buildPhase =  ''
    make all
'';

  installPhase = ''
  mkdir -p $out/bin
  mv main $out/bin/cmatrix
'';
}
