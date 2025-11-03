{
  pkgs,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [
    ninja
    ccache
    libffi
    dfu-util
    libusb1
    cmake
    flex
    bison
    gperf
  ];
}
