#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Installing Nix unstable channel..."
nix-channel --add https://nixos.org/channels/nixpkgs-unstable unstable
nix-channel --update

echo "Installing cli packages..."
nix-env -f packages/cli.nix -i

echo "Creating cli symlinks..."
stow -d configs -t $HOME \
    btop \
    fonts \
	git \
	lazy \
	nvim \
    others \
	starship \
	tmux \
    wezterm \
    yazi \
    zsh

echo "Setting up zsh as default shell..."
if which zsh >/dev/null 2>&1; then
    nix-env -i nixpkgs.zsh
fi

zsh_path=$(which zsh)
sudo sh -c "echo $zsh_path >> /etc/shells"
chsh -s $zsh_path

echo "Installing zsh plugins..."
source $HOME/.zshenv

echo "Installing neovim plugins..."
nvim +Lazy
