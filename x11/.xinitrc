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
# HDMI-2          -1  DVI-I-1-1

# CVT
# CVT-RB
xrandr --newmode "2560x1440_165" 699.5 2560 2608 2640 2720 1440 1443 1448 1559 +HSync -VSync
xrandr --newmode "2560x1440_75" 304.25 2560 2608 2640 2720 1440 1443 1448 1492 +HSync -VSync
xrandr --newmode "1024x600_60" 43.75 1024 1072 1104 1184 600 603 613 619 +HSync -VSync
# CVT-RBv2

xrandr --addmode DP-2      "2560x1440_165"
xrandr --addmode DP-1      "2560x1440_75"
xrandr --addmode HDMI-1    "2560x1440_75"
xrandr --addmode HDMI-2    "2560x1440_75"
xrandr --addmode DVI-I-1-1 "1024x600_60"

xrandr  \
        --fb 7584x2880                                                         \
        --output DP-2      --mode "2560x1440_165" --pos 2560x720 --primary     \
        --output HDMI-1    --mode "2560x1440_75"  --pos 5120x0 --rotate right  \
        --output HDMI-2    --mode "2560x1440_75"  --pos 0x1440                 \
        --output DP-1      --mode "2560x1440_75"  --pos 0x0                    \
        --output DVI-I-1-1 --mode "1024x600_60"   --pos 6560x0                 \

mount //192.168.0.217/Fede

setxkbmap us colemak

nitrogen --restore &
picom -b --config ~/.config/picom/picom.conf &
~/repository/bash-collection/start-aw.sh &
exec i3
