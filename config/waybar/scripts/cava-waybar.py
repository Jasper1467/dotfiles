#!/usr/bin/env python3

import subprocess
import json
import sys

CAVA_CONFIG = "/home/" + __import__("getpass").getuser() + "/.config/cava/waybar"

BARS = ["▁", "▂", "▃", "▄", "▅", "▆", "▇", "█"]

def main():
    process = subprocess.Popen(
        ["cava", "-p", CAVA_CONFIG],
        stdout=subprocess.PIPE,
        stderr=subprocess.DEVNULL,
        text=True,
        bufsize=1
    )

    try:
        for line in process.stdout:
            values = line.strip().split(";")

            levels = []
            for value in values:
                try:
                    level = int(value)
                    level = max(0, min(7, level))
                    levels.append(BARS[level])
                except ValueError:
                    continue

            if levels:
                print(json.dumps({
                    "text": "".join(levels),
                    "tooltip": "Nebula Audio Visualizer"
                }), flush=True)

    except BrokenPipeError:
        pass
    finally:
        process.terminate()
        process.wait()

if __name__ == "__main__":
    main()

