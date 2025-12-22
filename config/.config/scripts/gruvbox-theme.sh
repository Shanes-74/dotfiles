#!/usr/bin/env bash
set -e

# -------------------------
# Cria symlinks
# -------------------------

# Kitty
rm ~/.config/kitty/colors.conf

ln -s ~/.mythemes/gruvbox-dark/kitty/colors.conf \
      ~/.config/kitty/colors.conf

# Rofi
rm ~/.config/rofi/colors.rasi

ln -s ~/.mythemes/gruvbox-dark/rofi/colors.rasi \
      ~/.config/rofi/colors.rasi

# Waybar
rm ~/.config/waybar/colors.css

ln -s ~/.mythemes/gruvbox-dark/waybar/colors.css \
      ~/.config/waybar/colors.css

# Wallpapers
rm -r ~/Imagens/Wallpapers

cp -r ~/.mythemes/gruvbox-dark/Wallpapers ~/Imagens/

# Hyprland
rm ~/.config/hypr/modulos/colors.conf

ln -s ~/.mythemes/gruvbox-dark/hyprland/colors.conf \
      ~/.config/hypr/modulos/colors.conf

# -------------------------
# Reload
# -------------------------

# Hyprland
hyprctl reload

# Swww
./.config/swww/swww.sh &

# Waybar
pkill waybar || true
waybar &

# Kitty (recarrega se estiver aberto)
pkill -USR1 kitty || true

# GTK and Icons
gsettings set org.gnome.desktop.interface gtk-theme \
"Gruvbox-B-MB-Dark-Medium"

# QT (Kvantum)
KVANTUM_THEME="Gruvbox-Dark-Blue"
kvantummanager --set "$KVANTUM_THEME"
