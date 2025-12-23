#!/usr/bin/env bash
set -e

# Notificação
notify-send "Aplicando Tema" "Aplicando Catppuccin Mocha Peach..."

# =================================
# Catppuccin Mocha Peach Theme
# =================================

# Kitty
ln -sf ~/.config/.mythemes/catppuccin-mocha-peach/kitty/colors.conf ~/.config/kitty/

# Rofi
ln -sf ~/.config/.mythemes/catppuccin-mocha-peach/rofi/colors.rasi ~/.config/rofi/

# Swaync
ln -sf ~/.config/.mythemes/catppuccin-mocha-peach/swaync/colors.css ~/.config/swaync/

# Waybar
ln -sf ~/.config/.mythemes/catppuccin-mocha-peach/waybar/colors.css ~/.config/waybar/

# Hyprland
ln -sf ~/.config/.mythemes/catppuccin-mocha-peach/hyprland/colors.conf ~/.config/hypr/modulos/

# -------------------------
# Reload
# -------------------------

#VScode
CODE_SETTINGS="$HOME/.config/Code - Insiders/User/settings.json"

sed -i \
  -e 's/"workbench.colorTheme": ".*"/"workbench.colorTheme": "Catppuccin Mocha"/' \
  "$CODE_SETTINGS"

# (GTK3 + GTK4)
./.config/scripts/gtk.sh catppuccin-mocha-peach-standard+default

# QT (Kvantum)
KVANTUM_THEME="catppuccin-mocha-peach#"
kvantummanager --set "$KVANTUM_THEME"

# SWWW (wallpaper)
swww img ~/.config/.mythemes/catppuccin-mocha-peach/wallpaper.png --transition-type grow --transition-fps 144 --transition-duration 1.5

# Hyprland
hyprctl reload

# Waybar
pkill waybar || true
waybar &

# Kitty (recarrega se estiver aberto)
pkill -USR1 kitty || true

# Swaync (recarrega se estiver aberto)
swaync-client -R -rs