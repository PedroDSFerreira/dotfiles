#!/usr/bin/env bash

set -e

echo "Installing Nix unstable channel..."
nix-channel --add https://nixos.org/channels/nixpkgs-unstable unstable
nix-channel --update

echo "Installing cli packages..."
nix-env -f packages/cli.nix -i

echo "Creating symlinks..."
stow -d configs -t $HOME \
    btop \
    fonts \
	git \
    glow \
    k9s \
	lazy \
	nvim \
    others \
	starship \
	tmux \
    wezterm \
    yazi \
    zsh

echo "Setting up zsh as default shell..."
if ! command -v zsh >/dev/null 2>&1; then
    nix-env -iA nixpkgs.zsh
fi

zsh_path=$(which zsh)
sudo sh -c "echo $zsh_path >> /etc/shells"
chsh -s $zsh_path

echo "Installing yazi plugins..."
ya pkg install

echo "Installing zsh plugins..."
source $HOME/.zshenv

echo "Installing neovim plugins..."
nvim +Lazy
