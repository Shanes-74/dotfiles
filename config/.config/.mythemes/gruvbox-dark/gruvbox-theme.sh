#!/usr/bin/env bash
set -e

# -------------------------
# Cria symlinks
# -------------------------

# Kitty
ln -sf ~/.config/.mythemes/gruvbox-dark/kitty/colors.conf ~/.config/kitty/

# Rofi
ln -sf ~/.config/.mythemes/gruvbox-dark/rofi/colors.rasi ~/.config/rofi/

# Waybar
ln -sf ~/.config/.mythemes/gruvbox-dark/waybar/colors.css ~/.config/waybar/

# Hyprland
ln -sf ~/.config/.mythemes/gruvbox-dark/hyprland/colors.conf ~/.config/hypr/modulos/

# -------------------------
# Reload
# -------------------------

# GTK and Icons
gsettings set org.gnome.desktop.interface gtk-theme \
"Gruvbox-B-MB-Dark-Medium"

# QT (Kvantum)
KVANTUM_THEME="Gruvbox-Dark-Blue"
kvantummanager --set "$KVANTUM_THEME"

# SWWW (wallpaper)
swww img ~/.config/.mythemes/gruvbox-dark/wallpaper.png --transition-type grow --transition-fps 144 --transition-duration 1.5

#VScode
CODE_SETTINGS="$HOME/.config/Code - Insiders/User/settings.json"

sed -i \
  -e 's/"workbench.colorTheme": ".*"/"workbench.colorTheme": "Gruvbox Dark Medium"/' \
  -e 's/"workbench.iconTheme": ".*"/"workbench.iconTheme": "gruvbox-material-icon-theme"/' \
  "$CODE_SETTINGS"

# Hyprland
hyprctl reload

# Waybar
pkill waybar || true
waybar &

# Kitty (recarrega se estiver aberto)
pkill -USR1 kitty || true
