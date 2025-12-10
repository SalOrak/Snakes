{inputs, ...}: {
  additions = final: _prev: import ../pkgs final.pkgs;

  # nixpkgs.overlays = [
  #   inputs.rust-overlay.overlays.default
  # ];
}
