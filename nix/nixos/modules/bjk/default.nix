{ config, pkgs, ... }:

{
 
  nix.trustedUsers = [ "bjk" ];

  users.groups.bjk = { };
  
  users.mutableUsers = false;
  users.users.bjk = {
    isNormalUser = true;
    home = "/home/bjk";
    description = "Brian Ketelsen";
    hashedPassword = "$6$O2/RGKS.Fd$YPzCe00eYzBxlCFcMaR/CbfKc2izBAioc.1vDcbM5iscgNoJaSos2TAr.V24O/xkbpyXdsq880izmgm8B1ta30";

    extraGroups = [
      "bjk"
      "audio"
      "disk"
      "docker"
      "networkmanager"
      "plugdev"
      "wheel"
    ];
    shell = pkgs.bash;
  };
}
