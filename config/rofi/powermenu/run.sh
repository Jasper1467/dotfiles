#!/bin/bash

options=" Lock
󰍃 Logout
󰤄 Suspend
󰜉 Reboot
 Shutdown"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power" \
  -config ~/.config/rofi/powermenu/config.rasi)

case "$chosen" in
  " Lock") hyprlock ;;
  "󰍃 Logout") hyprctl dispatch exit ;;
  "󰤄 Suspend") systemctl suspend ;;
  "󰜉 Reboot") systemctl reboot ;;
  " Shutdown") systemctl poweroff ;;
esac

