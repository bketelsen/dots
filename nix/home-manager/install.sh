#!/usr/bin/env sh
mkdir -p ${HOME}/.config/nixpkgs

if ! [ -x "$(command -v home-manager)" ]; then
    nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
    nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
    nix-channel --update

    nix-shell '<home-manager>' -A install
fi

rm -rf ${HOME}/.config/nixpkgs/home.nix ${HOME}/.config/nixpkgs/modules


if [ -z "${WSLENV}" ]; then
    cp ./machines/linux-desktop.nix ${HOME}/.config/nixpkgs/home.nix
else
    cp ./machines/linux-wsl.nix ${HOME}/.config/nixpkgs/home.nix
fi

cp -R modules ${HOME}/.config/nixpkgs/

nix-channel --update

home-manager switch
