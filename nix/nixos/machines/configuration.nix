{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ./modules/bjk
    ./modules/desktop
  ];

  # nixpkgs.overlays = [ (import ./overlays/fingerprint-reader.nix) ];

  fileSystems."/".options = [ "noatime" "nodiratime" ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" ];
  boot.kernelModules = [ "kvm-intel" ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    # Activate acpi_call module for TLP ThinkPad features
    extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];

    loader = {
      systemd-boot = { enable = true; };

      efi = { canTouchEfiVariables = true; };
    };

    cleanTmpDir = true;
  };

  hardware.cpu.amd.updateMicrocode = true;



  # # Enable fprintd
  # services.fprintd.enable = true;

  services.hardware.bolt.enable = true;


  networking = {
    hostName = "galactica";
    firewall = { enable = "false" };
    networkmanager = { enable = true; };

    nameservers = [ "8.8.8.8" "8.8.4.4" ];
  };

  hardware.bluetooth.enable = true;

  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };

   # useSandbox = true;
  };

  # Set your time zone.
  time.timeZone = "America/New_York";


  environment.systemPackages = (with pkgs; [
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
  ]);

  services.blueman.enable = true;
  environment.interactiveShellInit = ''
    if [[ "$VTE_VERSION" > 3405 ]]; then
      source "${pkgs.gnome3.vte}/etc/profile.d/vte.sh"
    fi
  '';

  fonts = {
    enableFontDir = true;

    fonts = with pkgs; [
      cascadia-code
      corefonts
      emojione
      font-awesome
      google-fonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "Cascadia Code" ];
        sansSerif = [ "Bitter" ];
        serif = [ "Bitter" ];
      };
    };
  };

  services.printing.enable = true;
 # services.pcscd.enable = true;

  # docker
  virtualisation.docker.enable = true;

  sound.enable = true;

  hardware.pulseaudio = {
    enable = true;
    extraModules = [ pkgs.pulseaudio-modules-bt ];
    package = pkgs.pulseaudioFull;
  };

  console.useXkbConfig = true;

  nixpkgs.config = { allowUnfree = true; };

  system.stateVersion = "20.03";
}
