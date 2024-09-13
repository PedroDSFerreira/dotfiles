#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Installing stow..."
nix-env -i stow

echo "Installing homebrew bundle..."
brew tap Homebrew/bundle

echo "Installing brew packages..."
brew bundle --file=packages/Brewfile

echo "Creating symlinks..."
stow -d configs -t $HOME \
    skhd \
    yabai

skhd --install-service
yabai --install-service

echo "Executing cli setup..."
sh cli-setup.sh

