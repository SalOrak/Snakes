{
  pkgs,
  pkgs-unstable,
  config,
  lib,
  ...
}: {
  options = {
    config.devops.terraform.enable = lib.mkEnableOption "Setup Terraform Programming";
    config.devops.terraform.pkgs = lib.mkOption {
      types = lib.types.listOf lib.types.package;
      default = with pkgs; [
        terraform
        terraform-ls # LSP
      ];
      description = "Packages for Terraform.";
    };

    config.devops.kubernetes.enable = lib.mkEnableOption "Setup Kubernetes Programming";
    config.devops.kubernetes.pkgs = lib.mkOption {
      types = lib.types.listOf lib.types.package;
      default = with pkgs; [
        kubernetes
        kubernetes-helm
        minikube
      ];
      description = "Packages for Kubernetes.";
    };
  };

  environment.systemPackages =
    []
    ++ lib.optionals config.devops.terraform.enable config.devops.terraform.pkgs
    ++ lib.optionals config.devops.kubernetes.enable config.devops.kubernetes.pkgs;
}
