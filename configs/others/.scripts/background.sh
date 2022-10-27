#!/bin/sh

# Folder with wallpapers
dir=$HOME/Pictures/Wallpapers/

wallpaper=$dir$(ls $dir | shuf -n 1)

feh --no-fehbg --bg-fill $wallpaper