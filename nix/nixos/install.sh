#!/usr/bin/env sh

set -e

sudo rm -rf /etc/nixos/{overlays,modules,packages}

sudo cp -r ./modules /etc/nixos/
sudo cp ./machines/configuration.nix /etc/nixos/

#sudo -i nix-channel --add https://nixos.org/channels/nixos-20.03 nixos
sudo -i nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo -i nix-channel --add https://nixos.org/channels/nixos-unstable unstable
sudo -i nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
sudo -i nix-channel --update

sudo -i nixos-rebuild switch --upgrade
