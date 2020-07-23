{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.home-manager = {
    enable = true;
    path = "https://github.com/rycee/home-manager/archive/master.tar.gz";
  };

  home.username = "bjk";
  home.homeDirectory = "/home/bjk";


  imports = [
    ./modules/communication
    ./modules/development
    ./modules/desktop/gnome.nix
    ./modules/web-browsers
  ];
}
