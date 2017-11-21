#!/bin/bash

if [ $HOSTNAME == Pepparmint ]; then
    # Pepparmint config
    xrandr --auto --output HDMI3 --mode 1920x1080 --right-of DP1
    feh --bg-fill /home/malcolm/Pictures/background.jpg
else
    # Spearmint config
    xrandr --dpi 200
    synclient VertScrollDelta=-70 
    feh --bg-fill /home/malcolm/Pictures/bakground.jpg
fi
