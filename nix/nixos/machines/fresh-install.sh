#!/usr/bin/env bash

DISK=/dev/nvme0n1
SWAP_SIZE=17GB

parted ${DISK} -- mklabel gpt
parted $DISK -- mkpart primary 1024MiB -${SWAP_SIZE}KiB
parted $DISK -- mkpart primary linux-swap -${SWAP_SIZE}KiB 100%
parted $DISK -- mkpart ESP fat32 1MiB 1024MiB
parted $DISK -- set 3 boot on

mkswap -L swap ${DISK}p2
swapon ${DISK}p2

mkfs.fat -F 32 -n boot ${DISK}p3

DISK_PART_UUID=$(lsblk -o name,label,partuuid | grep p1 | awk '{print $2}')

cryptsetup luksFormat /dev/disk/by-partuuid/${DISK_PART_UUID}
cryptsetup luksOpen /dev/disk/by-partuuid/${DISK_PART_UUID} root

mkfs.btrfs /dev/mapper/root

mount /dev/mapper/root /mnt
mkdir /mnt/boot
mount ${DISK}p3 /mnt/boot

nixos-generate-config --root /mnt

cp ./configuration.nix /mnt/etc/nixos/configuration.nix

nixos-enter -c "nix-channel --add https://nixos.org/channels/nixos-20.03 nixos"
nixos-install
