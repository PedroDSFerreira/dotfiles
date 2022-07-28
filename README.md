# Linux Config Files/ Installed Packages

---

## Contains configs for:
    - Alacritty
    - Fish
    - Nvim

## Import/export list of installed packages:

### Export:
> ``` bash
> pacman -Qqen > requirements.txt
> ```

### Import:
> ``` bash
> pacman -S - < requirements.txt
> ```


