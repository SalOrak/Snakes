{pkgs ? import <nixpkgs> {}}:
pkgs.stdenv.mkDerivation rec {
  pname = "dwm-bar";
  version = "0.4";
  src = ./scripts;

  buildInputs = with pkgs; [
    gawk
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp  dwm-bar.sh $out/bin/dwm-bar
    chmod +x $out/bin/dwm-bar
  '';
  meta = {
    description = "DWM Status bash script";
    license = pkgs.lib.licenses.mit;
  };
}
