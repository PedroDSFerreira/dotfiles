#!/usr/bin/env bash

set -e

echo "Setting up NixOS channels..."
sudo nix-channel --add https://channels.nixos.org/nixos-25.05 nixos
sudo nix-channel --add https://channels.nixos.org/nixos-unstable unstable
sudo nix-channel --update

echo "Installing stow..."
nix-env -iA nixos.stow

echo "Creating symlinks..."
stow -d configs -t $HOME \
    awesome \
    btop \
    fonts \
    git \
    glow \
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
sudo nixos-rebuild switch -I nixos-config=$HOME/.config/nixos/configuration.nix

echo "Installing yazi plugins..."
sh $HOME/.config/yazi/install.sh

echo "Installing zsh plugins..."
source $HOME/.zshenv

echo "Installing neovim plugins..."
nvim +Lazy
