#!/bin/sh
unset XCURSOR_THEME
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# for 1x 1440p75Hz display over VirtualBox
# xrandr --newmode "2560x1440_75.00" 397.25  2560 2760 3040 3520  1440 1443 1448 1506 -hsync +vsync
# xrandr --addmode Virtual-1 "2560x1440_75.00"
# xrandr --output Virtual-1 --mode "2560x1440_75.00"

# for 4-Monitor setup:
# Display Arrangement:
# DP-1            HD
#          DP-2   MI
# HDMI-2          -1

# CVT
# xrandr --addmode "2560x1440_165" 938.5 2560 2792 3072 3584 1440 1443 1448 1588 -HSync +VSync
# CVT-RB
xrandr --newmode "2560x1440_165" 699.5 2560 2608 2640 2720 1440 1443 1448 1559 +HSync -VSync
xrandr --newmode "2560x1440_75" 304.25 2560 2608 2640 2720 1440 1443 1448 1492 +HSync -VSync
# CVT-RBv2
# xrandr --newmode "2560x1440_165" 679.1 2560 2568 2600 2640 1440 1545 1553 1559 +HSync -VSync
# Custom
# xrandr --newmode "2560x1440_165" 629.878 2560 2568 2600 2640 1440 1545 1553 1559 +HSync -VSync

xrandr --addmode DP-2   "2560x1440_165"
xrandr --addmode DP-1   "2560x1440_75"
xrandr --addmode HDMI-1 "2560x1440_75"
xrandr --addmode HDMI-2 "2560x1440_75"

xrandr  \
        --fb 7680x2880                                                      \
        --output DP-2   --mode "2560x1440_165" --pos 2560x720 --primary     \
        --output HDMI-1 --mode "2560x1440_75"  --pos 5120x0 --rotate right  \
        --output HDMI-2 --mode "2560x1440_75"  --pos 0x1440                 \
        --output DP-1   --mode "2560x1440_75"  --pos 0x0                    \

mount //192.168.0.217/Fede

setxkbmap us colemak

nitrogen --restore &
picom -b --config ~/.config/picom/picom.conf &
~/repository/bash-collection/start-aw.sh &
exec i3
