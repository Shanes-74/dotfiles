#!/bin/bash

# Caminho para o arquivo gerado pelo Matugen (SAÍDA)
COLORS_FILE="$HOME/.config/waybar/colors.css"

# Caminho para o arquivo de estilo principal da Waybar (DESTINO)
STYLE_FILE="$HOME/.config/waybar/style.css"

# Caminho para o template de estilo base (o que o Matugen NÃO deve sobrescrever)
# Crie este arquivo contendo todo o seu CSS principal da Waybar, MENOS as cores.
BASE_STYLE_TEMPLATE="$HOME/.config/waybar/base_style.css"

# Verifica se os arquivos base existem
if [ ! -f "$COLORS_FILE" ] || [ ! -f "$BASE_STYLE_TEMPLATE" ]; then
    echo "Erro: Arquivos de cores ou template base não encontrados."
    exit 1
fi

# 1. Combina os arquivos:
#    - Começa com o conteúdo do COLORS_FILE (gerado pelo Matugen, que tem o @define-color)
#    - Adiciona o conteúdo do BASE_STYLE_TEMPLATE (o seu CSS principal)
#    - Redireciona tudo para o STYLE_FILE (o arquivo que a Waybar lê)
cat "$COLORS_FILE" "$BASE_STYLE_TEMPLATE" > "$STYLE_FILE"

# 2. Recarrega a Waybar (post_hook)
pkill -SIGUSR2 waybar