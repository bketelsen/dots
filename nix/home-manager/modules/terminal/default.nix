{ config, pkgs, ... }:

{
  home.packages = (with pkgs; 
  [ 

emacs
htop
jq
mosh
nix-prefetch-github
unison
unzip
ripgrep
    ]);
}
