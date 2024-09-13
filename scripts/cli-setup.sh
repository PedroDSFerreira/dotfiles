#!/usr/bin/env bash

echo "Installing cli packages..."
nix-env -f packages/cli.nix -i

echo "Creating cli symlinks..."
stow -d configs -t $HOME \
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
    nix-env -iA nixpkgs.zsh
fi

zsh_path=$(which zsh)
sudo sh -c "echo $zsh_path >> /etc/shells"
chsh -s $zsh_path

echo "Installing zsh plugins..."
source $HOME/.zshenv

echo "Installing neovim plugins..."
nvim +Lazy
