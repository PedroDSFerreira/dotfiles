#!/usr/bin/env bash

echo "Installing stow"
nix-env -i stow

echo "Creating symlinks"
# Create an array with folder names from ../configs
folders=($(find ../configs -maxdepth 1 -mindepth 1 -type d -exec basename {} \;))
stow -d ../configs -t $HOME "${folders[@]}"

echo "Copying hardware configurations"
cp /etc/nixos/hardware-configuration.nix ~/.config/nixos/

echo "Removing default nixos folder"
sudo rm -rf /etc/nixos/

echo "Building configurations"
sudo nixos-rebuild switch -I nixos-config=/home/pedro/.config/nixos/configuration.nix
