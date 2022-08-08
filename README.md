# Linux Config Files/ Installed Packages

---

## Contains configs for:
    - Alacritty
    - Starship
    - Fish
    - Nvim (write ':PlugInstall' in Nvim to install plugins)

## Import/export list of installed packages:

### Export:
> ``` bash
> pacman -Qqen > requirements.txt
> ```

### Import:
> ``` bash
> pacman -S - < requirements.txt
> ```


