{ config, pkgs, ... }:

{
  home.packages = (with pkgs; [ 
    discord 
    remmina
    slack 
    signal-desktop 
   ]);
}
