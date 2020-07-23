{ config, pkgs, ... }:

{
 
  nix.trustedUsers = [ "bjk" ];

  users.groups.bjk = { };

  users.users.bjk = {
    isNormalUser = true;
    home = "/home/bjk";
    description = "Brian Ketelsen";
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
