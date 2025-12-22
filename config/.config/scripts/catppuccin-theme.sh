#!/usr/bin/env bash
set -e

# =================================
# Catppuccin Mocha Peach Theme
# =================================

# Kitty
rm ~/.config/kitty/colors.conf

ln -s ~/.config/.mythemes/catppuccin-mocha-peach/kitty/colors.conf \
      ~/.config/kitty/colors.conf

# Rofi
rm ~/.config/rofi/colors.rasi

ln -s ~/.config/.mythemes/catppuccin-mocha-peach/rofi/colors.rasi \
      ~/.config/rofi/colors.rasi

# Waybar
rm ~/.config/waybar/colors.css


ln -s ~/.config/.mythemes/catppuccin-mocha-peach/waybar/colors.css \
      ~/.config/waybar/colors.css

# Wallpapers
rm -r ~/Imagens/Wallpapers/

cp -r ~/.config/.mythemes/catppuccin-mocha-peach/Wallpapers ~/Imagens/

# Hyprland
rm ~/.config/hypr/modulos/colors.conf

ln -s ~/.config/.mythemes/catppuccin-mocha-peach/hyprland/colors.conf \
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
"catppuccin-mocha-peach-standard+default"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"

# QT (Kvantum)
KVANTUM_THEME="catppuccin-mocha-peach#"
kvantummanager --set "$KVANTUM_THEME"
