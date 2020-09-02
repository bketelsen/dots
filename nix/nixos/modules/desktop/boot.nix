{ config, pkgs, ... }:

{

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" ];
  boot.kernelModules = [ "kvm-amd" ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    # Activate acpi_call module for TLP ThinkPad features
    extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];



    cleanTmpDir = true;
  };

}






