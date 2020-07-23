{ pkgs, ... }:

let theme = (import ./themes/brewer.nix).theme;
in {
  home.packages = (with pkgs;
    [

    ]);

  gtk = {
    enable = true;

    font = { name = "Cascadia Code 11"; };

    theme = { name = "Nordic-blue"; };

    iconTheme = { name = "Arc"; };
  };
}
