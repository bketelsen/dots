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
    ./modules/terminal
    ./modules/development
    #./modules/desktop/synergy.nix
    ./modules/desktop/vscode.nix
    ./modules/web-browsers
    ./modules/emacs
  ];



    # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";
}
