hl.on("hyprland.start", function ()
    hl.exec_cmd("waybar")
    hl.exec_cmd("dunst")

    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprsunset")

    hl.exec_cmd("~/.config/hypr/scripts/wallpaper.sh")
end)
