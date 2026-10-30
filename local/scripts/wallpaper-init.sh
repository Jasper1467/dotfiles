#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Available awww transitions
TRANSITIONS=(
    "fade"
    "wipe"
    "grow"
    "outer"
    "wave"
    "center"
    "any"
    "random"
)

# Transition settings
DURATION=2
FPS=60

# Check directory
if [[ ! -d "$WALLPAPER_DIR" ]]; then
    echo "Wallpaper directory not found: $WALLPAPER_DIR"
    exit 1
fi

# Check awww
if ! command -v awww &>/dev/null; then
    echo "awww is not installed."
    exit 1
fi

# Find wallpapers
mapfile -d '' WALLPAPERS < <(
    find "$WALLPAPER_DIR" -type f \
        \( -iname '*.jpg' -o -iname '*.jpeg' \
        -o -iname '*.png' -o -iname '*.webp' \
        -o -iname '*.gif' \) -print0
)

if [[ ${#WALLPAPERS[@]} -eq 0 ]]; then
    echo "No wallpapers found!"
    exit 1
fi

echo "Found ${#WALLPAPERS[@]} wallpapers."
echo "Starting wallpaper rotation..."

while true; do
    # Pick a random wallpaper
    WALLPAPER="${WALLPAPERS[RANDOM % ${#WALLPAPERS[@]}]}"

    # Pick a random transition
    TRANSITION="${TRANSITIONS[RANDOM % ${#TRANSITIONS[@]}]}"

    echo "Wallpaper: $(basename "$WALLPAPER")"
    echo "Transition: $TRANSITION"

    # Apply wallpaper
    awww img "$WALLPAPER" \
        --transition-type "$TRANSITION" \
        --transition-duration "$DURATION" \
        --transition-fps "$FPS"

    # Wait before changing wallpaper (seconds)
    sleep 120
done
