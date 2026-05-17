#!/bin/bash

choice=$(printf "Lock\nSuspend\nReboot\nShutdown\nLogout" | rofi -dmenu -i -no-config -no items \
    -theme ~/.config/rofi/powermenu.rasi \
    -p "Power")

case "$choice" in
Lock) loginctl hyprlock ;;
Suspend) systemctl suspend ;;
Reboot) systemctl reboot ;;
Shutdown) systemctl poweroff ;;
Logout) hyprctl dispatch exit ;;
esac
