# Linux Config Files/ Installed Packages

## Contains configs for:
- [Alacritty](https://github.com/alacritty/alacritty)
- [AwesomeWM](https://awesomewm.org/)
- [Fish](https://fishshell.com/)
- [Nvim (NvChad)](https://nvchad.com/)
- [Tmux](https://github.com/tmux/tmux/wiki)
- [Picom](https://github.com/jonaburg/picom)
- [Polybar](https://github.com/polybar/polybar) (to properly work, install [Rofi](https://github.com/davatorium/rofi) and [this collection](https://github.com/adi1090x/rofi))
- [Starship](https://starship.rs/)
- [Zsh](https://www.zsh.org/) (with [oh-my-zsh](https://ohmyz.sh/))
- [Zathura](https://wiki.archlinux.org/title/zathura)
- [Xorg](https://www.x.org/wiki/)
- [feh](https://wiki.archlinux.org/title/feh)

---
## Packages

### Install:
``` bash
pacman -S - < requirements.txt
```

### Export:
``` bash
pacman -Qqen > requirements.txt
```

---
## Symlinks
 -  to create/remove symlinks, cd into `configs/`

### Create:
 ```bash
 stow -t ~/ *
 ```

### Remove:

```bash
 stow -D -t ~/ *
 ```

---

## Screenshot

![Screenshot](screenshot.png)
