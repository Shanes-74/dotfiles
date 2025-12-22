#!/bin/sh

MODE="$1"   # full | region

DIR="$HOME/Imagens/Screenshots"
TIMESTAMP="$(date +'%Y-%m-%d_%H-%M-%S')"
FILE="$DIR/screenshot-$TIMESTAMP.png"

mkdir -p "$DIR"

notify_cancel() {
  notify-send \
    -a "Screenshot" \
    -u low \
    "Captura de tela cancelada"
}

case "$MODE" in
  full)
    if ! grim - | tee "$FILE" | wl-copy; then
      notify_cancel
      exit 1
    fi
    ;;
  region)
    GEOM="$(slurp)"
    if [ -z "$GEOM" ]; then
      notify_cancel
      exit 1
    fi

    if ! grim -g "$GEOM" - | tee "$FILE" | wl-copy; then
      notify_cancel
      exit 1
    fi
    ;;
  *)
    exit 1
    ;;
esac

ACTION=$(notify-send \
  -a "Screenshot" \
  -i "$FILE" \
  -h string:image-path:"$FILE" \
  -A open="Abrir" \
  "Screenshot capturada" \
  "Clique para abrir")

if [ "$ACTION" = "open" ]; then
  xdg-open "$FILE"
fi