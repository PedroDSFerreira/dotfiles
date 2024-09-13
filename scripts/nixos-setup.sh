#!/usr/bin/env bash

echo "Installing stow..."
nix-env -i stow

echo "Creating symlinks..."
stow -d configs -t $HOME \
    awesome \
    fonts \
    git \
    lazy \
    nixos \
    nvim \
    others \
    picom \
    polybar \
    starship \
    tmux \
    wezterm \
    yazi \
    zsh

echo "Copying hardware configurations..."
cp /etc/nixos/hardware-configuration.nix ~/.config/nixos/

echo "Removing default nixos folder..."
sudo rm -rf /etc/nixos/

echo "Building configurations..."
sudo nixos-rebuild switch -I nixos-config=/home/pedro/.config/nixos/configuration.nix
