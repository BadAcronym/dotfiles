#!/bin/sh
unset XCURSOR_THEME
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# for 4-Monitor setup:
# Display Arrangement:
# DP-1     DVI-I  HD
#          DP-2   MI
# HDMI-2          -1

# CVT

# CVT-RB
xrandr --newmode "2560x1440_165" 699.5 2560 2608 2640 2720 1440 1443 1448 1559 +HSync -VSync
xrandr --newmode "2560x1440_75" 304.25 2560 2608 2640 2720 1440 1443 1448 1492 +HSync -VSync

# CVT-RBv2

xrandr --addmode DP-2      "2560x1440_165"
xrandr --addmode DP-1      "2560x1440_75"
xrandr --addmode HDMI-1    "2560x1440_75"
xrandr --addmode HDMI-2    "2560x1440_75"

xrandr  \
        --fb 6560x2880                                                         \
        --output DP-2      --mode "2560x1440_165" --pos 2560x720 --primary     \
        --output HDMI-1    --mode "2560x1440_75"  --pos 5120x0 --rotate right  \
        --output HDMI-2    --mode "2560x1440_75"  --pos 0x1440                 \
        --output DP-1      --mode "2560x1440_75"  --pos 0x0

mount //192.168.0.217/Fede

$HOME/repository/bash-collection/nitrogen-profile random
picom -b --config ~/.config/picom/picom.conf &

setxkbmap us colemak

exec i3
