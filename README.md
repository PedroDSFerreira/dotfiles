![Screenshot1](screenshot1.png)
![Screenshot2](screenshot2.png)

# Linux Config Files/ Installed Packages

## Contains configs for:

- [alacritty](configs/alacritty)
- [awesomeWM](configs/awesome)
- [lazygit & lazydocker](configs/lazy)
- [neovim](configs/nvim)
- [picom](configs/picom)
- [polybar](configs/polybar)
- [skhd](configs/skhd)
- [starship](configs/starship)
- [tmux](configs/tmux)
- [wezterm](configs/wezterm)
- [xorg](configs/x)
- [yabai](configs/yabai)
- [yazi](configs/yazi)
- [zsh](configs/zsh)

---

## MacOS setup

### Requirements

- Git
- Curl
- [Nix](https://nixos.org/download.html)
- [Brew](https://brew.sh/)

### Install:

```sh
git clone https://github.com/PedroDSFerreira/dotfiles.git ~/.dotfiles && \
    cd ~/.dotfiles && \
    ./macos-setup.sh
```

## Nix Packages (CLI tools only)

### Requirements

- Git
- Curl
- [Nix](https://nixos.org/download.html)

### Install:

```sh
git clone https://github.com/PedroDSFerreira/dotfiles.git ~/.dotfiles && \
    cd ~/.dotfiles && \
    ./cli-setup.sh
```

### Compatibility:

Tested with:

- Debian 12
- Arch Linux
- MacOS Sonoma 14.6.1

---

## Symlinks

- to create/remove symlinks, cd into `configs/`

### Create:

```bash
stow -t ~/ *
```

### Remove:

```bash
 stow -D -t ~/ *
```
