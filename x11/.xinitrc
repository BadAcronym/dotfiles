#!/bin/sh
unset XCURSOR_THEME
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# for 4-Monitor setup:
# Display Arrangement:
# DP-2            HD
#          DP-1   MI
# HDMI-2          -1

# CVT-RB
xrandr --newmode "3840x2160_144" 1332.75 3840 3888 3920 4000 2160 2163 2168 2314 +HSync -VSync
xrandr --newmode "3840x2160_240" 2331.75 3840 3888 3920 4000 2160 2163 2168 2429 +HSync -VSync

xrandr --newmode "2560x1440_75" 304.25 2560 2608 2640 2720 1440 1443 1448 1492 +HSync -VSync

# configs that work:
# 1543    + 0 x 0                <- works!
# 1543    + 3 x 138.5  = 1958.5  <- doesn't work :(
# 1332.75 + 3 x 241.5  = 2057.7  <- works!
# 1332.75 + 3 x 304.25 = 2245.5  <- barely doesn't work :/
# 1543    + 3 x 241.5  = 2267.5  <- doesn't work :(
# 2331.75 + 0 x 0                <- works!

xrandr --addmode DP-1      "3840x2160_144"
xrandr --addmode DP-1      "3840x2160_240"

xrandr --addmode DP-2      "2560x1440_75"
xrandr --addmode HDMI-1    "2560x1440_75"
xrandr --addmode HDMI-2    "2560x1440_75"

# TODO: for when I get one or two more cards to drive the other displays ^^
# xrandr  \
#         --fb 7840x2880                                                          \
#         --output DP-1      --mode "3840x2160_240" --pos 2560x360 --primary      \
#         --output DP-2      --mode "2560x1440_75"  --pos 0x0                     \
#         --output HDMI-1    --mode "2560x1440_75"  --pos 6400x180   --rotate right \
#         --output HDMI-2    --mode "2560x1440_75"  --pos 0x1440

xrandr  \
        --fb 7840x2880                                                              \
        --output DP-1      --mode "3840x2160_144" --pos 2560x360                    \
        --output DP-2      --mode "2560x1440_75"  --pos 0x0                         \
        --output HDMI-1    --mode "2560x1440_75"  --pos 6400x180   --rotate right   \
        --output HDMI-2    --mode "2560x1440_75"  --pos 0x1440

mount //192.168.0.217/Fede

$HOME/repository/bash-collection/nitrogen-profile random
picom -b --config ~/.config/picom/picom.conf &

setxkbmap us colemak

exec i3
