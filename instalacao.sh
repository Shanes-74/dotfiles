#!/usr/bin/env bash
set -e  # Para o script parar caso algo dê errado

# =========================
#   FUNÇÕES
# =========================

instalar_pacotes_base() {
    echo -e "\n==> Instalando pacotes essenciais..."
    sudo pacman -Syyu --noconfirm --needed git base-devel stow
}

clonar_dotfiles() {
    echo -e "\n==> Clonando dotfiles..."
    if [[ ! -d ~/dotfiles ]]; then
        git clone https://github.com/Shanes-74/dotfiles.git ~/dotfiles
    else
        echo "Pasta ~/dotfiles já existe, pulando clone..."
    fi
}

aplicar_stow() {
    echo -e "\n==> Aplicando stow (stow config)..."
    DOTFILES_DIR=~/dotfiles
    TARGET_DIR=~/.config

    # Remove arquivos conflitantes antes de aplicar
    for item in "$DOTFILES_DIR/config"/*; do
        nome=$(basename "$item")
        if [[ -e "$TARGET_DIR/$nome" ]]; then
            echo "⚠️  Arquivo/diretório $TARGET_DIR/$nome existe, removendo..."
            rm -rf "$TARGET_DIR/$nome"
        fi
    done

    # Aplica stow
    cd "$DOTFILES_DIR"
    stow config || echo "⚠️  Stow falhou."
}

instalar_pacotes_restantes() {
    echo -e "\n==> Instalando pacotes adicionais..."
    sudo pacman -S --noconfirm --needed \
        ttf-dejavu noto-fonts-emoji ttf-liberation \
        noto-fonts noto-fonts-cjk \
        gst-plugins-{bad,base,good,ugly} \
        libdvdread libdvdnav libdvdcss a52dec libde265 x264 x265 xvidcore \
        xdg-desktop-portal xdg-desktop-portal-hyprland intel-ucode \
        dolphin waybar rofi swww
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

# 1. Instalar pacotes essenciais (git, base-devel, stow)
instalar_pacotes_base

# 2. Clonar dotfiles
clonar_dotfiles

# 3. Aplicar stow com sobrescrita
aplicar_stow

# 4. Instalar pacotes restantes
instalar_pacotes_restantes

# 5. Instalar AUR helper
instalar_paru

# 6. Recarregar Hyprland (se estiver rodando)
reload_hyprland

echo -e "\n🎉 Concluído com sucesso!"