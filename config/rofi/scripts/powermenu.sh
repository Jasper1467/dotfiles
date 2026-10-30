#!/usr/bin/env bash

THEME="$HOME/.config/rofi/powermenu-style.rasi"

choice=$(
    printf '%s\n' \
        '󰌾  Lock' \
        '󰤄  Suspend' \
        '󰍃  Log Out' \
        '󰜉  Reboot' \
        '󰐥  Shut Down' |
        rofi -dmenu -i -no-custom -p "POWER" \
            -theme "$THEME" \
            -click-to-exit
)

case "$choice" in
"󰌾  Lock") hyprlock ;;
"󰤄  Suspend") systemctl suspend ;;
"󰍃  Log Out") hyprshutdown ;;
"󰜉  Reboot") systemctl reboot ;;
"󰐥  Shut Down") systemctl poweroff ;;
esac
