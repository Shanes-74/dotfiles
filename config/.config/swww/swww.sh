#!/usr/bin/bash
#inicie o swww
WALLPAPERS_DIR=~/Imagens/Wallpapers-catppuccin
WALLPAPER=$(find "$WALLPAPERS_DIR" -type f | shuf -n 1)

# Mude para wave e defina 60 frames por segundo
swww img "$WALLPAPER" --transition-type grow --transition-fps 144