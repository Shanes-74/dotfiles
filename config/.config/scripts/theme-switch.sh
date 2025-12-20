#!/usr/bin/env bash

THEME=$(printf "Gruvbox Dark\nCatppuccin Mocha Peach" | \
        rofi -dmenu -p "Select theme")

case "$THEME" in
  "Gruvbox Dark")
    ~/.config/scripts/gruvbox-theme.sh
    ;;
  "Catppuccin Mocha Peach")
    ~/.config/scripts/catppuccin-theme.sh
    ;;
esac
