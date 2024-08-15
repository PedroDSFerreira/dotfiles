#!/usr/bin/env bash

# Install packages
nix-env -f packages.nix -i

# Create symlinks
cd configs && stow -t $HOME \
	git \
	lazy \
	lf \
	nvim \
	starship \
	tmux \
    others

# Choose default shell
zsh_path=$(which zsh)
sudo sh -c "echo $zsh_path >> /etc/shells"
chsh -s $zsh_path

# Install zsh plugins
source $HOME/.zshenv

# Install nvim plugins
nvim +Lazy
