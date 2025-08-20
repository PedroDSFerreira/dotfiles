# Linux Config Files/ Installed Packages

![Screenshot2](screenshot2.png)

---

## NixOS setup

### Requirements

- Git
- [NixOS](https://nixos.org/download.html)

### Install:

```sh
git clone https://github.com/PedroDSFerreira/dotfiles.git ~/.dotfiles && \
    cd ~/.dotfiles && \
    sh scripts/nixos-setup.sh
```

After running the installation script, cd into `~/.dotfiles` and run:
```sh
sh scripts/post-install.sh

```

## MacOS setup

### Requirements

- Git
- [Nix](https://nixos.org/download.html)
- [Brew](https://brew.sh/)

### Install:

```sh
git clone https://github.com/PedroDSFerreira/dotfiles.git ~/.dotfiles && \
    cd ~/.dotfiles && \
    sh scripts/macos-setup.sh
```

## CLI tools setup

### Requirements

- Git
- [Nix](https://nixos.org/download.html)

### Install:

```sh
git clone https://github.com/PedroDSFerreira/dotfiles.git ~/.dotfiles && \
    cd ~/.dotfiles && \
    sh scripts/cli-setup.sh
```

---

## Symlinks

### Create:

```bash
cd ~/.dotfiles
stow -d configs -t ~/ <config-folder-name>
```

### Remove:

```bash
cd ~/.dotfiles
stow -D -d configs -t ~/ <config-folder-name>
```

---

## Screenshots

![Screenshot1](screenshot1.png)
![Screenshot2](screenshot2.png)
