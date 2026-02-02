#!/bin/sh
unset XCURSOR_THEME

# for 1x 1440p75Hz display over VirtualBox
# xrandr --newmode "2560x1440_75.00" 397.25  2560 2760 3040 3520  1440 1443 1448 1506 -hsync +vsync
# xrandr --addmode Virtual-1 "2560x1440_75.00"
# xrandr --output Virtual-1 --mode "2560x1440_75.00"

# for 4-Monitor setup:
# Display Arrangement:
# DP-1     DP-2   HDMI-1
# HDMI-2
#
# correspondence:
# DP-1   : crtc 0
# DP-2   : crtc 1
# HDMI-1 : crtc 2
# HDMI-2 : crtc 3

xrandr --newmode "2560x1440_75.00"  397.25  2560 2760 3040 3520  1440 1443 1448 1506 -hsync +vsync
xrandr --newmode "2560x1440_165.00" 941.49  2560 2792 3080 3600  1440 1441 1444 1585 -hsync +vsync

xrandr --addmode DP-2   "2560x1440_165.00"
xrandr --addmode DP-1   "2560x1440_75.00"
xrandr --addmode HDMI-1 "2560x1440_75.00"
xrandr --addmode HDMI-2 "2560x1440_75.00"

xrandr  --fb 7680x2880                                                                   \
        --output DP-1   --crtc 0 --mode "2560x1440_75.00"  --pos 0x0                     \
        --output DP-2   --crtc 1 --mode "2560x1440_165.00" --pos 2560x720 --primary      \
        --output HDMI-1 --crtc 2 --mode "2560x1440_75.00"  --pos 5120x0   --rotate right \
        --output HDMI-2 --crtc 3 --mode "2560x1440_75.00"  --pos 0x1440                  \

exec sxwm
