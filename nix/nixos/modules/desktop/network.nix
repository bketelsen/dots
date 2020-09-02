{ pkgs, ... }:

{
  networking = {
    useDHCP = false; 
    hostName = "galactica";
    firewall.enable = false ;
    networkmanager = { enable = true; };
    interfaces = {
      enp6s0.useDHCP = true;
      wlp3s0.useDHCP = false;
    };
  };

}
