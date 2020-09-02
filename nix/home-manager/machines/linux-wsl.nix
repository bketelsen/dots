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

    ./modules/development
    ./modules/emacs
    ./modules/terminal

  ];
}
