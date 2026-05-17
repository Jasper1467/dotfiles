#!/usr/bin/env bash
set -euo pipefail

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
DELAY=60
TRANSITION_TIME=3

# Start swww daemon if needed
if ! pgrep -x "swww-daemon" >/dev/null; then
    awww-daemon &
    
    # wait until daemon is ready
    sleep 1
fi

mapfile -t WALLPAPERS < <(
    find "$WALLPAPER_DIR" -type f \
        \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | shuf
)

if [ ${#WALLPAPERS[@]} -eq 0 ]; then
    echo "No wallpapers found"
    exit 1
fi

INDEX=0

while true; do
    WALL="${WALLPAPERS[$INDEX]}"

    echo "Setting wallpaper: $WALL"

    awww img "$WALL" \
        --transition-type grow \
        --transition-duration "$TRANSITION_TIME"

    INDEX=$(((INDEX + 1) % ${#WALLPAPERS[@]}))

    sleep "$DELAY"
done
