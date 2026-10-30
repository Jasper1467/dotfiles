#!/usr/bin/env python3

import json
import subprocess

def get_mute():
    try:
        result = subprocess.run(
            ["pactl", "get-source-mute", "@DEFAULT_SOURCE@"],
            capture_output=True,
            text=True,
            timeout=2
        )

        if result.returncode == 0:
            return "yes" in result.stdout.lower()

    except Exception:
        pass

    return None


muted = get_mute()

if muted is True:
    text = "󰍭"
    css_class = "muted"
    tooltip = "Headset microphone: MUTED"

elif muted is False:
    text = "󰍬"
    css_class = "ready"
    tooltip = "Headset microphone: UNMUTED"

else:
    text = "󰍬"
    css_class = "unknown"
    tooltip = "Microphone status unavailable"

print(json.dumps({
    "text": text,
    "class": css_class,
    "tooltip": tooltip
}))
