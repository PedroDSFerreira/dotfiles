# Install nixpkgs
sh <(curl -L https://nixos.org/nix/install) --daemon

# Install packages
nix-env -f packages.nix -i

# Create symlinks
cd configs && stow -t $HOME \
	git \
	lazygit \
	lf \
	nvim \
	starship \
	tmux \
	zsh \
	fonts

# Apply fonts
fc-cache -f -v

# Choose default shell
chsh -s $(which zsh)

# Install zsh plugins
source $HOME/.zshenv

# Install tmux plugins
$HOME/.tmux/plugins/tpm/bin/install_plugins

# Install nvim plugins
nvim +Lazy
