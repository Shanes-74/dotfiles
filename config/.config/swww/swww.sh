!/usr/bin/bash
#inicie o swww
WALLPAPERS_DIR=~/Imagens/Wallpapers
WALLPAPER=$(find "$WALLPAPERS_DIR" -type f | shuf -n 1)
swww img "$WALLPAPER"