#!/usr/bin/env bash

THEME=$(printf "Gruvbox Dark\nCatppuccin Mocha Peach" | \
        rofi -dmenu -p "Select theme")

case "$THEME" in
  "Gruvbox Dark")
    ~/.config/.mythemes/gruvbox-dark/gruvbox-theme.sh
    ;;
  "Catppuccin Mocha Peach")
    ~/.config/.mythemes/catppuccin-mocha-peach/catppuccin-theme.sh
    ;;
esac
