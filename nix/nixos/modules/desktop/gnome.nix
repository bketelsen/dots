{ pkgs, ... }:

{
  # Enable GNOME 3
  services.dbus.packages = [ pkgs.gnome3.dconf ];
  services.udev.packages = with pkgs; [ gnome3.gnome-settings-daemon ];

  security.pam.services.gdm.enableGnomeKeyring = true;
  services.gnome3.gnome-keyring.enable = true;

  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    layout = "us";

    displayManager = {
      defaultSession = "gnome";

      gdm = {
        enable = true;
        wayland = false;
      };
    };

    desktopManager = { gnome3 = { enable = true; }; };

    libinput = {
      enable = true;

      naturalScrolling = true;
      scrollMethod = "twofinger";
      tapping = true;
      clickMethod = "clickfinger";
      disableWhileTyping = true;
    };
  };

  environment.gnome3.excludePackages = with pkgs.gnome3; [
    epiphany
    geary
    gnome-software
  ];
}
