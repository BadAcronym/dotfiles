#!/bin/sh
unset XCURSOR_THEME

xrandr --newmode "2560x1440_75.00" 397.25  2560 2760 3040 3520  1440 1443 1448 1506 -hsync +vsync
xrandr --addmode Virtual-1 "2560x1440_75.00"
xrandr --output Virtual-1 --mode "2560x1440_75.00"

exec sxwm
