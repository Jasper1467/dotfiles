#!/bin/bash
set -e

cp ~/.zshrc .zshrc

KITTY_SRC="$HOME/.config/kitty"
KITTY_DST="config/kitty"
mkdir -p "$KITTY_DST"

find "$KITTY_SRC" -maxdepth 1 -type f -exec cp {} "$KITTY_DST/" \;

NVIM_SRC="$HOME/.config/nvim"
NVIM_DST="config/nvim"
mkdir -p "$NVIM_DST"

rsync -a --exclude='.*' "$NVIM_SRC/" "$NVIM_DST/"

ETC_DST="etc"
mkdir -p "$ETC_DST"
sudo cp /etc/pacman.conf "$ETC_DST/"
sudo cp /etc/makepkg.conf "$ETC_DST/"
sudo cp /etc/nanorc "$ETC_DST/"

echo "Dotfiles updated successfully."

