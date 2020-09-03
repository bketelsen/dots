{ config, pkgs, ... }:

{
  home.packages = (with pkgs; 
  [ 
    # Utilities
    unzip
    ripgrep
    direnv
    jq
    mosh
    nix-prefetch-github
    unison
    jq
    htop
    mosh
    starship
    rsync
    git
    ]);
}
