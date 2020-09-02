{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ./modules/bjk
    ./modules/desktop
    ./services
  ];

  # nixpkgs.overlays = [ (import ./overlays/fingerprint-reader.nix) ];

  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
  '';


    # nix options for derivations to persist garbage collection
    environment.pathsToLink = [
     "/share/nix-direnv"
   ];
   
  
 
  # # Enable fprintd
  # services.fprintd.enable = true;

  services.hardware.bolt.enable = true;


  hardware.bluetooth.enable = true;

  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };

   # useSandbox = true;
  };

  


  services.blueman.enable = true;
  environment.interactiveShellInit = ''
    if [[ "$VTE_VERSION" > 3405 ]]; then
      source "${pkgs.gnome3.vte}/etc/profile.d/vte.sh"
    fi
  '';



  # services.pcscd.enable = true;



 
  console.useXkbConfig = true;

  nixpkgs.config = { allowUnfree = true; };

  system.stateVersion = "20.03";
}
