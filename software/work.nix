{
  pkgs,
  config,
  input,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # Version manager for Terraform, OpenTofu, TerraGrunt, Terramate and Atmos
    tenv

    # Latest version of AWS Cli
    awscli2

    # VSCode
    vscode
  ];
}
