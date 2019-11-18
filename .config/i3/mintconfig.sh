#!/bin/bash

if [ $HOSTNAME == pepparmint ]; then
    # Pepparmint config
    xrandr --auto --output HDMI3 --mode 1920x1080 --right-of DP1
    feh --bg-fill /home/malcolm/Pictures/background.jpg
elif [ $HOSTNAME == spearmint ]; then
    # Spearmint config
    xrandr --dpi 200
    synclient HorizEdgeScroll=1 VertEdgeScroll=1 VertScrollDelta=-111
    /usr/bin/python3 /home/malcolm/.config/i3/wallpaper.py
else
    # attentec config
    xrandr --output Virtual1 --mode 1920x1080 --pos 0x0 --output Virtual2 --mode 2560x1440 --right-of Virtual1 --output Virtual3 --mode 1920x1200 --right-of Virtual2
    synclient HorizEdgeScroll=1 VertEdgeScroll=1 VertScrollDelta=-111
    
    xrdb /home/malcolm/.Xresources

    /usr/bin/python3 /home/malcolm/.config/i3/wallpaper.py
    # feh --bg-fill /home/malcolm/Pictures/wallpaper.jpg
fi
