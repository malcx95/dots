#!/bin/bash

if [ $HOSTNAME == pepparmint ]; then
    # Pepparmint config
    xrandr --auto --output HDMI3 --mode 1920x1080 --right-of DP1
    feh --bg-fill /home/malcolm/Pictures/background.jpg
else
    # Spearmint config
    xrandr --dpi 200
    synclient HorizEdgeScroll=1 VertEdgeScroll=1 VertScrollDelta=-111
    feh --bg-fill /home/malcolm/Pictures/background.jpg
fi
