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

# these are wrong, can't figure out a working one for 165Hz instead of 120Hz...
# 2560x1440 164.90 Hz (CVT) hsync: 261.86 kHz; pclk: 938.50 MHz
xrandr --newmode "2560x1440_165.00"  938.50  2560 2792 3072 3584  1440 1443 1448 1588 -hsync +vsync

# 2560x1440 165.00Hz (GTF) hsync: 261.53 kHz; pclk: 941.49 MHz
# xrandr --newmode "2560x1440_165.00" 941.49 2560 2792 3080 3600  1440 1441 1444 1585 -hsync +vsync

xrandr --addmode DP-2   "2560x1440_165.00"
xrandr --addmode DP-1   "2560x1440_75.00"
xrandr --addmode HDMI-1 "2560x1440_75.00"
xrandr --addmode HDMI-2 "2560x1440_75.00"

# eventually:
# xrandr  --fb 7680x2880                                                                   \
#         --output DP-1   --crtc 0 --mode "2560x1440_75.00"  --pos 0x0                     \
#         --output DP-2   --crtc 1 --mode "2560x1440_165.00" --pos 2560x720 --primary      \
#         --output HDMI-1 --crtc 2 --mode "2560x1440_75.00"  --pos 5120x0   --rotate right \
#         --output HDMI-2 --crtc 3 --mode "2560x1440_75.00"  --pos 0x1440                  \

# workaround for 3x and no refresh rates !| 60Hz:
xrandr  \
        --fb 7680x2880                                      \
        --output DP-2   --auto --pos 2560x0 --primary       \
        --output HDMI-1 --auto --pos 5120x0 --rotate right  \
        --output HDMI-2 --auto --pos 0x0                    \
        --output DP-1   --off                               \

exec sxwm
