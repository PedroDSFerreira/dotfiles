#!/usr/bin/env bash

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

