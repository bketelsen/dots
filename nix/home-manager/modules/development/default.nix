{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./go.nix
    ./nix.nix
    ./rust.nix
  ];

  
  # Enable zsh
  programs.zsh.enable = true;

  # Enable Oh-my-zsh
  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [ "git" "sudo" "docker" "kubectl" ];
    theme = "agnoster";
  };


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
