#!/bin/bash

if [ $HOSTNAME == pepparmint ]; then
    # Pepparmint config
    xrandr --output HDMI2 --mode 2560x1440 --output DP1 --mode 2560x1440 --rotate left --left-of HDMI2
    feh --bg-fill /home/malcolm/Pictures/background.jpg
else
    # Spearmint config
    xrandr --dpi 200
    synclient HorizEdgeScroll=1 VertEdgeScroll=1 VertScrollDelta=-111
    /usr/bin/python3 /home/malcolm/.config/i3/wallpaper.py
fi
