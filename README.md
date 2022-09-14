# Linux Config Files/ Installed Packages


## Contains configs for:
- Alacritty
- AwesomeWM
- Fish
- Nvim (write ':PlugInstall' in Nvim to install plugins)
- Picom
- Polybar (to properly work, install [Rofi](https://github.com/davatorium/rofi) and [this collection](https://github.com/adi1090x/rofi))
- Starship
- Zsh (with oh-my-zsh)
- Startup


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
## Screenshot

![Screenshot](screenshot.png)