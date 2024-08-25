#!/usr/bin/env bash

brew tap Homebrew/bundle

brew bundle --file=packages/Brewfile

stow -d configs -t $HOME \
    skhd \
    yabai

skhd --install-service
yabai --install-service

sh cli-setup.sh

