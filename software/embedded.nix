{pkgs, config, ...}: {
    environment.systemPackages = with pkgs [
       ninja 
       ccache
       libffi
       dfu-utils
       libusb1
       cmake
       flex
       bison
       gperf
    ];
}
