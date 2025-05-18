#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Installing stow..."
nix-env -iA stow

echo "Creating symlinks..."
stow -d configs -t $HOME \
    awesome \
    btop \
    fonts \
    git \
    k9s \
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
