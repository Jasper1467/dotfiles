#!/bin/bash
MPV_FILE="$HOME/Wallpapers/Live/minecraft-dog.1920x1080.mp4"

nohup mpvpaper ALL "$MPV_FILE" -- mpv --loop-file=inf --no-audio --really-quiet >/dev/null 2>&1 &

