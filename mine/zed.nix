{
  # Zed udev rules configuration
  services.udev.extraRules = ''
    # HIDAPI/libusb
    SUBSYSTEM=="usb", ATTRS{idVendor}=="2b03", ATTRS{idProduct}=="f681", MODE="0666"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="2b03", ATTRS{idProduct}=="f781", MODE="0666"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="2b03", ATTRS{idProduct}=="f881", MODE="0666"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="df11", MODE="0666"

    # HIDAPI/hidraw
    KERNEL=="hidraw*", ATTRS{busnum}=="1", ATTRS{idVendor}=="2b03", ATTRS{idProduct}=="f681", MODE="0666"
    KERNEL=="hidraw*", ATTRS{busnum}=="1", ATTRS{idVendor}=="2b03", ATTRS{idProduct}=="f781", MODE="0666"
    KERNEL=="hidraw*", ATTRS{busnum}=="1", ATTRS{idVendor}=="2b03", ATTRS{idProduct}=="f881", MODE="0666"
    KERNEL=="hidraw*", ATTRS{busnum}=="1", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="df11", MODE="0666"

    # Kernel I2C //For ZED-GMSL
    KERNEL=="i2c-0", GROUP="i2c", MODE="0666"
    KERNEL=="i2c-1", GROUP="i2c", MODE="0666"
    KERNEL=="i2c-2", GROUP="i2c", MODE="0666"
    KERNEL=="i2c-3", GROUP="i2c", MODE="0666"
    KERNEL=="i2c-4", GROUP="i2c", MODE="0666"
    KERNEL=="i2c-5", GROUP="i2c", MODE="0666"
    KERNEL=="i2c-6", GROUP="i2c", MODE="0666"
    KERNEL=="i2c-7", GROUP="i2c", MODE="0666"
    KERNEL=="i2c-8", GROUP="i2c", MODE="0666"
    KERNEL=="i2c-9", GROUP="i2c", MODE="0666"
    KERNEL=="i2c-10", GROUP="i2c", MODE="0666"
    KERNEL=="i2c-11", GROUP="i2c", MODE="0666"
    KERNEL=="i2c-12", GROUP="i2c", MODE="0666"
    KERNEL=="i2c-30", GROUP="i2c", MODE="0666"
    KERNEL=="i2c-31", GROUP="i2c", MODE="0666"
    KERNEL=="i2c-32", GROUP="i2c", MODE="0666"
    KERNEL=="i2c-33", GROUP="i2c", MODE="0666"
    KERNEL=="i2c-34", GROUP="i2c", MODE="0666"
    KERNEL=="i2c-35", GROUP="i2c", MODE="0666"
    KERNEL=="i2c-36", GROUP="i2c", MODE="0666"
    KERNEL=="i2c-37", GROUP="i2c", MODE="0666"

    # blacklist for usb autosuspend
    # http://kernel.org/doc/Documentation/usb/power-management.txt
    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="2b03", ATTRS{idProduct}=="f780", TEST=="power/control", ATTR{power/control}="on"
    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="2b03", ATTRS{idProduct}=="f781", TEST=="power/control", ATTR{power/control}="on"
    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="2b03", ATTRS{idProduct}=="f881", TEST=="power/control", ATTR{power/control}="on"
    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="0424", ATTRS{idProduct}=="2512", TEST=="power/control", ATTR{power/control}="on"
    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="2b03", ATTRS{idProduct}=="f880", TEST=="power/control", ATTR{power/control}="on"
    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="2b03", ATTRS{idProduct}=="f582", TEST=="power/control", ATTR{power/control}="on"
    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="2b03", ATTRS{idProduct}=="f682", TEST=="power/control", ATTR{power/control}="on"

    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="2b03", ATTRS{idProduct}=="f780", TEST=="power/autosuspend", ATTR{power/autosuspend}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="2b03", ATTRS{idProduct}=="f781", TEST=="power/autosuspend", ATTR{power/autosuspend}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="2b03", ATTRS{idProduct}=="f881", TEST=="power/autosuspend", ATTR{power/autosuspend}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="0424", ATTRS{idProduct}=="2512", TEST=="power/autosuspend", ATTR{power/autosuspend}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="2b03", ATTRS{idProduct}=="f880", TEST=="power/autosuspend", ATTR{power/autosuspend}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="2b03", ATTRS{idProduct}=="f582", TEST=="power/autosuspend", ATTR{power/autosuspend}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="2b03", ATTRS{idProduct}=="f682", TEST=="power/autosuspend", ATTR{power/autosuspend}="-1"

    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="2b03", ATTRS{idProduct}=="f780", TEST=="power/autosuspend_delay_ms", ATTR{power/autosuspend_delay_ms}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="2b03", ATTRS{idProduct}=="f781", TEST=="power/autosuspend_delay_ms", ATTR{power/autosuspend_delay_ms}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="2b03", ATTRS{idProduct}=="f881", TEST=="power/autosuspend_delay_ms", ATTR{power/autosuspend_delay_ms}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="0424", ATTRS{idProduct}=="2512", TEST=="power/autosuspend_delay_ms", ATTR{power/autosuspend_delay_ms}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="2b03", ATTRS{idProduct}=="f880", TEST=="power/autosuspend_delay_ms", ATTR{power/autosuspend_delay_ms}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="2b03", ATTRS{idProduct}=="f582", TEST=="power/autosuspend_delay_ms", ATTR{power/autosuspend_delay_ms}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="2b03", ATTRS{idProduct}=="f682", TEST=="power/autosuspend_delay_ms", ATTR{power/autosuspend_delay_ms}="-1"
  '';
}