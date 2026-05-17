local mod = "SUPER"

local function bind(key, action, opts)
	hl.bind(key, action, opts)
end

local function exec(key, command, opts)
	bind(key, hl.dsp.exec_cmd(command), opts)
end

local function app(key, command)
	exec(mod .. " + " .. key, command)
end

local function focus(key, direction)
	bind(mod .. " + " .. key, hl.dsp.focus({ direction = direction }))
end

local function workspace(num)
	local key = num % 10

	bind(mod .. " + " .. key, hl.dsp.focus({ workspace = num }))

	bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = num }))
end

local function media(key, command)
	bind(key, hl.dsp.exec_cmd(command), { locked = true })
end

local function media_repeat(key, command)
	bind(key, hl.dsp.exec_cmd(command), { locked = true, repeating = true })
end

app("T", "kitty")
app("E", "dolphin")
app("D", "rofi -show drun -theme ~/.config/rofi/theme.rasi")

exec(mod .. " + M", "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit")

bind(mod .. " + Q", hl.dsp.window.close())

bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" }))

bind(mod .. " + P", hl.dsp.window.pseudo())

bind(mod .. " + J", hl.dsp.layout("togglesplit"))

exec(mod .. "+ Print", 'grim -g "$(slurp -d)" - | wl-copy')

focus("left", "left")
focus("right", "right")
focus("up", "up")
focus("down", "down")

for i = 1, 10 do
	workspace(i)
end

bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))

bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })

bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

media_repeat("XF86AudioRaiseVolume", "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+")

media_repeat("XF86AudioLowerVolume", "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")

media_repeat("XF86AudioMute", "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")

media_repeat("XF86AudioMicMute", "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")

media_repeat("XF86MonBrightnessUp", "brightnessctl -e4 -n2 set 5%+")

media_repeat("XF86MonBrightnessDown", "brightnessctl -e4 -n2 set 5%-")

media("XF86AudioNext", "playerctl next")
media("XF86AudioPause", "playerctl play-pause")
media("XF86AudioPlay", "playerctl play-pause")
media("XF86AudioPrev", "playerctl previous")
