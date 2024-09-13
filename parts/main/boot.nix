{ pkgs, ... }:

{
  # Bootloader.
#  boot.loader.systemd-boot.enable = true;
 # boot.loader.efi.canTouchEfiVariables = true;
boot.loader.systemd-boot.enable = false;
boot.loader.grub.enable = true;
boot.loader.grub.device = "nodev";
boot.loader.grub.useOSProber = true;
boot.loader.grub.efiSupport = true;
boot.loader.efi.canTouchEfiVariables = true;
boot.loader.efi.efiSysMountPoint = "/boot";
}