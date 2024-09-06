#!/usr/bin/env bash

# Install packages
nix-env -f packages/cli.nix -i

# Create symlinks
stow -d configs -t $HOME \
	git \
	lazy \
	nvim \
	starship \
	tmux \
    fonts \
    others \
    wezterm \
    yazi \
    zsh

# Install zsh, if necessary
if which zsh >/dev/null 2>&1; then
    nix-env -iA nixpkgs.zsh
fi

# Choose default shell
zsh_path=$(which zsh)
sudo sh -c "echo $zsh_path >> /etc/shells"
chsh -s $zsh_path

# Install zsh plugins
source $HOME/.zshenv

# Install nvim plugins
nvim +Lazy
