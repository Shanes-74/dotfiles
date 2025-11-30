#!/usr/bin/env bash
set -e  # Para o script parar caso algo dê errado

# =========================
#   FUNÇÕES
# =========================

clonar_dotfiles() {
    echo -e "\n==> Clonando dotfiles..."
    if [[ ! -d ~/dotfiles ]]; then
        git clone https://github.com/Shanes-74/dotfiles.git ~/dotfiles
    else
        echo "Pasta ~/dotfiles já existe, pulando clone..."
    fi
}

instalar_stow() {
    echo -e "\n==> Instalando stow..."
    sudo pacman -Syy --noconfirm --needed stow
}

aplicar_stow() {
    echo -e "\n==> Aplicando stow (stow config)..."
    cd ~/dotfiles
    stow config || echo "⚠️  stow falhou (verifique conflitos em ~/.config)"
}

instalar_pacotes() {
    echo -e "\n==> Instalando pacotes oficiais..."
    sudo pacman -Syyu --noconfirm --needed \
        git base-devel ttf-dejavu noto-fonts-emoji ttf-liberation \
        noto-fonts noto-fonts-cjk \
        gst-plugins-{bad,base,good,ugly} \
        libdvdread libdvdnav libdvdcss a52dec libde265 x264 x265 xvidcore \
        xdg-desktop-portal xdg-desktop-portal-hyprland intel-ucode stow \
}

Instalador_programas() {
    echo -e "\n==> Instalando programas..."
    sudo pacman -S --noconfirm --needed \
    dolphin waybar rofi swww \
}

instalar_paru() {
    echo -e "\n==> Instalando o Paru (AUR helper)..."
    
    if command -v paru &> /dev/null; then
        echo "Paru já instalado!"
        return
    fi

    git clone https://aur.archlinux.org/paru.git /tmp/paru
    cd /tmp/paru

    makepkg -si --noconfirm
    cd ~
    rm -rf /tmp/paru
}

reload_hyprland() {
    if command -v hyprctl &> /dev/null; then
        echo -e "\n==> Recarregando Hyprland..."
        hyprctl reload || echo "Hyprland não parece estar rodando."
    fi
}

# =========================
#   EXECUÇÃO
# =========================

clonar_dotfiles
instalar_stow
aplicar_stow

instalar_pacotes
Instalador_programas
instalar_paru
reload_hyprland

echo -e "\n🎉 Concluído com sucesso!"