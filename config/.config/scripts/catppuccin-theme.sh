#!/usr/bin/env bash
set -e

# =================================
# Catppuccin Mocha Peach Theme
# =================================

# Kitty
rm -f ~/.config/kitty/colors.conf

ln -s ~/.mythemes/catppuccin-mocha-peach/kitty/colors.conf \
      ~/.config/kitty/colors.conf

# Rofi
rm -f ~/.config/rofi/colors.rasi

ln -s ~/.mythemes/catppuccin-mocha-peach/rofi/colors.rasi \
      ~/.config/rofi/colors.rasi

# Waybar
rm -f ~/.config/waybar/colors.css


ln -s ~/.mythemes/catppuccin-mocha-peach/waybar/colors.css \
      ~/.config/waybar/colors.css

# Wallpapers
rm -rf ~/Imagens/Wallpapers/

cp -rf ~/.mythemes/catppuccin-mocha-peach/Wallpapers ~/Imagens/

# Hyprland
rm -f ~/.config/hypr/modulos/colors.conf

ln -s ~/.mythemes/catppuccin-mocha-peach/hyprland/colors.conf \
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