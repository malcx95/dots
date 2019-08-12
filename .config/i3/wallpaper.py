import random
import time as t
import os
import subprocess

WALLPAPER_DIR = '/home/malcolm/Pictures/wallpapers'
SWITCH_FILE = "/tmp/switch"

SWITCH_TIME = 3600
REFRESH_TIME = 3

def switch_wallpaper():
    files = None
    for root, _, fs in os.walk(WALLPAPER_DIR):
        files = [os.path.join(root, f) for f in fs]

    wallpaper = random.choice(files)
    subprocess.run(['feh', '--bg-fill', wallpaper], stdout=subprocess.PIPE)

try:
    time = 0
    while True:
        if time >= SWITCH_TIME:
            time = 0
            switch_wallpaper()
        elif os.path.isfile(SWITCH_FILE):
            os.remove(SWITCH_FILE)
            switch_wallpaper()

        time += REFRESH_TIME
        t.sleep(REFRESH_TIME)
except Exception as e:
    with open('/home/malcolm/error', 'w') as f:
        f.write(str(e))

