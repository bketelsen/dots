{ config, pkgs, ... }:

{
  imports = [ ./git.nix ./go.nix ./nix.nix ./rust.nix ];

  home.packages = (with pkgs; [

    # Go
    go

    # JavaScript
    nodejs
    yarn

    # Python
    python3

    # Editing
    emacs
    neovim

    vscode

  ]);
}
