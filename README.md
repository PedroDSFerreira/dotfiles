# Linux Config Files/ Installed Packages


## Contains configs for:
- Alacritty
- Starship
- Zsh (with oh-my-zsh)
- Fish
- Nvim (write ':PlugInstall' in Nvim to install plugins)
- AwesomeWM
- Picom
- Polybar (to properly work, install [Rofi](https://github.com/davatorium/rofi) and [this collection](https://github.com/adi1090x/rofi))

---
## Import/export list of installed packages:

### Export:
> ``` bash
> pacman -Qqen > requirements.txt
> ```

### Import:
> ``` bash
> pacman -S - < requirements.txt
> ```


---
## Create symlinks (stow)
 1. cd into configs/
 2. run:  __`stow -t ~/ *`__


---
## Screenshots