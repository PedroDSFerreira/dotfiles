#!/usr/bin/env bash

set -e

echo "Installing yazi plugins..."
ya pkg install

echo "Installing zsh plugins..."
source $HOME/.zshenv

echo "Installing neovim plugins..."
nvim +Lazy

echo "Done. Install tmux plugins with '<leader> + I'"
