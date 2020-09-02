#!/usr/bin/env sh

set -e

echo Removing Old Configs...
sudo rm -rf /etc/nixos/{overlays,modules,packages}

echo Copying Modules...
sudo cp -r ./modules /etc/nixos/

echo Copying Services...
sudo cp -r ./services /etc/nixos/

echo Copying NixOS Config...
sudo cp ./machines/configuration.nix /etc/nixos/

echo Copying NixOS Machine Config...
sudo cp ./machines/hardware-configuration.nix /etc/nixos/

echo Adding Channels...
#sudo -i nix-channel --add https://nixos.org/channels/nixos-20.03 nixos
sudo -i nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo -i nix-channel --add https://nixos.org/channels/nixos-unstable unstable
sudo -i nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware

echo Updating Channels...
sudo -i nix-channel --update

echo Rebuilding...
sudo -i nixos-rebuild switch --upgrade --show-trace
