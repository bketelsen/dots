{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./go.nix
    ./nix.nix
    ./rust.nix
  ];

  
    programs.direnv.enable = true;
    programs.direnv.enableNixDirenvIntegration = true;

  home.packages = (with pkgs; [
  
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
