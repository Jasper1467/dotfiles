#!/bin/bash
last=""

while true; do
  wp=$(find ~/Pictures/Wallpapers -type f | shuf -n 1)
  [[ "$wp" == "$last" ]] && continue
  last="$wp"

  swww img "$wp" \
    --transition-type grow \
    --transition-duration 1

  sleep 60
done

