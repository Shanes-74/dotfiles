#!/usr/bin/env bash
set -e

THEME="$1"
[ -z "$THEME" ] && echo "uso: $0 <tema-gtk>" && exit 1

# GSettings (notify)
gsettings set org.gnome.desktop.interface gtk-theme "$THEME"

# GTK3
mkdir -p ~/.config/gtk-3.0
sed -i '/^gtk-theme-name=/d' ~/.config/gtk-3.0/settings.ini
printf "[Settings]\ngtk-theme-name=%s\n" "$THEME" >> ~/.config/gtk-3.0/settings.ini

# GTK4
mkdir -p ~/.config/gtk-4.0
sed -i '/^gtk-theme-name=/d' ~/.config/gtk-4.0/settings.ini
printf "[Settings]\ngtk-theme-name=%s\n" "$THEME" >> ~/.config/gtk-4.0/settings.ini

# XSETTINGS
mkdir -p ~/.config/xsettingsd
cat > ~/.config/xsettingsd/xsettingsd.conf <<EOF
Net/ThemeName "$THEME"
EOF

pkill xsettingsd || true
xsettingsd &