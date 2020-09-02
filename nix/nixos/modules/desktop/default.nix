{ config, pkgs, ... }:


{ imports = [
            ./gnome.nix
            ./filesystems.nix
            ./network.nix
            ./virt.nix

            ./boot.nix
            ./sound.nix
            ];

 # Set your time zone.
  time.timeZone = "America/New_York";

  hardware.cpu.amd.updateMicrocode = true;

  environment.systemPackages = (with pkgs; [
    avahi
    blueman
    # fprintd
    # libfprint
    fwupd
    networkmanagerapplet
    pipewire
    xdg-desktop-portal
    bibata-cursors-translucent
    curl
    wget
    vim
    nix-direnv
  ]);

}
