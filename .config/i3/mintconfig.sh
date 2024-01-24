#!/bin/bash

pkill -f wallpaper.py
/usr/bin/python3 $HOME/.config/i3/wallpaper.py &

echo "den stora kebaben" > /home/malcolm/hej
killall nm-applet
nm-applet

killall xidlehook

xidlehook \
  --not-when-audio \
  --timer 600 \
    '/home/malcolm/Programming/i3-sortlock/lock.sh' \
    '' \
  --timer 1000 \
    'systemctl suspend' \
    '' &
