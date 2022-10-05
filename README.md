# Linux Config Files/ Installed Packages


## Contains configs for:
- [Alacritty](https://github.com/alacritty/alacritty)
- [AwesomeWM](https://awesomewm.org/)
- [Fish](https://fishshell.com/)
- [Nvim](https://neovim.io/) (write ':PlugInstall' in Nvim to install plugins)
- [Picom](https://github.com/jonaburg/picom)
- [Polybar](https://github.com/polybar/polybar) (to properly work, install [Rofi](https://github.com/davatorium/rofi) and [this collection](https://github.com/adi1090x/rofi))
- [Starship](https://starship.rs/)
- [Zsh](https://www.zsh.org/) (with [oh-my-zsh](https://ohmyz.sh/))
- [Zathura](https://wiki.archlinux.org/title/zathura)
- [Xorg](https://www.x.org/wiki/)


---
## Import/export list of installed packages:

### Export:
``` bash
pacman -Qqen > requirements.txt
```

### Import:
``` bash
pacman -S - < requirements.txt
```


---
## Create symlinks (stow)
 1. cd into configs/
 2. run:  __`stow -t ~/ *`__


---
## Screenshot

![Screenshot](screenshot.png)