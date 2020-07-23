{ pkgs, ... }:

{
  home.packages =
    (with pkgs; [ arc-icon-theme arc-theme bibata-cursors-translucent ])
    ++ (with pkgs.gnome3; [ dconf-editor gnome-tweaks ])
    ++ (with pkgs.gnomeExtensions; [
      appindicator
      dash-to-panel
      paperwm
      sound-output-device-chooser
    ]);

  gtk = {
    enable = true;

    font = { name = "Cascadia Code 11"; };

    theme = { name = "Arc-Darker"; };

    iconTheme = { name = "Arc"; };
  };
}
