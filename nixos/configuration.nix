# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  pkgs-unstable,
  ...
}: let
  emacsTree = (pkgs.emacsPackagesFor pkgs.emacs).emacsWithPackages (
    epkgs:
      with epkgs; [
        (treesit-grammars.with-all-grammars)
      ]
  );
in {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];
}
