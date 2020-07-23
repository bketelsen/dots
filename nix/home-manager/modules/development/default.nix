{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./go.nix
    ./nix.nix
    ./rust.nix
  ];

  
  home.packages = (with pkgs; [

    direnv
    # Go
    go
    htop
    neovim
    starship
    synergy
    quicksynergy
    rsync
    git
      # Make

    # JavaScript
    nodejs
    yarn

    unison
  
    # Python
    pipenv
    python
    pythonPackages.virtualenv

  ]);
}
