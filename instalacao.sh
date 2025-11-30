#!\bin\bash

sudo pacman -Syyu --noconfirm git base-devel ttf-dejavu noto-fonts-emoji ttf-liberation noto-fonts noto-fonts-cjk gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly libdvdread libdvdnav libdvdcss a52dec libde265 x264 x265 xvidcore xdg-desktop-portal xdg-desktop-portal-hyprland intel-ucode
sudo pacman -S --noconfirm --needed dolphin stow waybar rofi swww

cd ~/dotfiles
stow hyprland
hyprctl reload