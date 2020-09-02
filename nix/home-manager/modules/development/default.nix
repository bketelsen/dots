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

    emacs

jq
mosh
nix-prefetch-github
unison
vscode
unzip
ripgrep

  ]);
}
