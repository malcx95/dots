import random
import time as t
import os
import subprocess
import imageio
import matplotlib.colors as colors
import matplotlib.pyplot as plt
import numpy as np

I3_COLORS_TEMPLATE = """
set $bgcolor    {focus}
set $in-bgcolor {unfocus}
set $text       #ffffff
set $u-bgcolor  #ff0000
set $indicator  {indicator}
set $in-text    #969696

#                       border          background      text            indicator (a line which shows where the next window will be placed)
client.focused          $bgcolor        $bgcolor        $text           $indicator
client.unfocused        $in-bgcolor     $in-bgcolor     $in-text        $in-bgcolor
client.focused_inactive $in-bgcolor     $in-bgcolor     $in-text        $in-bgcolor
client.urgent           $u-bgcolor      $u-bgcolor      $text           $u-bgcolor

"""

POLYBAR_CONFIG = """
[colors]
background = {background}
background-alt = {background_alt}
foreground = #C5C8C6
primary = {primary}
secondary = #8ABEB7
alert = #A54242
disabled = #707880
"""


WALLPAPER_DIR = '/home/malcolm/Pictures/wallpapers'
SWITCH_FILE = "/tmp/switch"

SWITCH_TIME = 3600
REFRESH_TIME = 3

SATURATION_THRESHOLD = 0.1
VALUE_THRESHOLD = 70

FOCUS_SATURATION = 0.5
FOCUS_VALUE = 0.6

UNFOCUS_SATURATION = 0.9
UNFOCUS_VALUE = 0.2

INDICATOR_SATURATION = 1.0
INDICATOR_VALUE = 1.0

BACKGROUND_SATURATION = 1.0
BACKGROUND_VALUE = 0.1

PRIMARY_SATURATION = 0.5
PRIMARY_VALUE = 0.6


def switch_wallpaper():
    files = None
    for root, _, fs in os.walk(WALLPAPER_DIR):
        files = [os.path.join(root, f) for f in fs]

    wallpaper = random.choice(files)
    subprocess.run(['feh', '--bg-fill', wallpaper], stdout=subprocess.PIPE)
    change_theme(wallpaper)


def change_theme(wallpaper_path):
    image = imageio.imread_v2(wallpaper_path)
    hsv = colors.rgb_to_hsv(image)
    hue = hsv[:, :, 0]
    saturation = hsv[:, :, 1]
    value = hsv[:, :, 2]

    mask = (saturation > SATURATION_THRESHOLD) * (value > VALUE_THRESHOLD)

    histogram, edges = np.histogram(hue[mask], bins=50)
    max_index = np.argmax(histogram)
    max_hue = edges[max_index]

    apply_color(max_hue)


def apply_color(hue):
    color_focused, = colors.hsv_to_rgb([[hue, FOCUS_SATURATION, FOCUS_VALUE]])
    color_unfocused, = colors.hsv_to_rgb([[hue, UNFOCUS_SATURATION, UNFOCUS_VALUE]])
    color_indicator, = colors.hsv_to_rgb([[hue, INDICATOR_SATURATION, INDICATOR_VALUE]])
    color_background, = colors.hsv_to_rgb([[hue, BACKGROUND_SATURATION, BACKGROUND_VALUE]])
    color_primary, = colors.hsv_to_rgb([[hue, PRIMARY_SATURATION, PRIMARY_VALUE]])

    i3_config_text = I3_COLORS_TEMPLATE.format(
        focus=rgb_to_hex(color_focused),
        unfocus=rgb_to_hex(color_unfocused),
        indicator=rgb_to_hex(color_indicator),
    )

    with open("/home/malcolm/.config/i3/colors.conf", "w") as f:
        f.write(i3_config_text)

    polybar_config_text = POLYBAR_CONFIG.format(
        background=rgb_to_hex(color_background),
        background_alt=rgb_to_hex(color_unfocused),
        primary=rgb_to_hex(color_primary),
    )
    with open("/home/malcolm/.config/polybar/colors.conf", "w") as f:
        f.write(polybar_config_text)

    subprocess.run(["i3-msg", "reload"])



def rgb_to_hex(rgb):
    rgb_int = (rgb * 255).astype(np.uint8)
    return '#{:02x}{:02x}{:02x}'. format(*rgb_int)


def main():
    time = SWITCH_TIME
    while True:
        if time >= SWITCH_TIME:
            time = 0
            switch_wallpaper()
        elif os.path.isfile(SWITCH_FILE):
            os.remove(SWITCH_FILE)
            switch_wallpaper()

        time += REFRESH_TIME
        t.sleep(REFRESH_TIME)


if __name__ == "__main__":
    try:
        main()
    except Exception as e:
        with open('/home/malcolm/error', 'w') as f:
            f.write(str(e))
