{ pkgs ? import <nixpkgs> {} }:

pkgs.rustPlatform.buildRustPackage rec {
  pname = "dot";
  version = "0.1.0";
  src = pkgs.fetchFromGitHub {
    owner = "salorak";
    repo = "dot";
    rev = "master";
    hash = "sha256-I7sqeIkos6P1WRvCKwikTqJYP0cu8C5BbMKoD2AMOI4=";
  };
  
  cargoSha256 = "1kfdgh8dra4jxgcdb0lln5wwrimz0dpp33bq3h7jgs8ngaq2a9wp";
  buildInputs = with pkgs; [
    pkg-config
    openssl
  ];

  installPhase = ''
  mv target/release/dot $out/bin/dot
'';
}
