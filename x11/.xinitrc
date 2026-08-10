#!/bin/sh

unset XCURSOR_THEME
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

## from /etc/X11/xinit/xinitrc
prefix="/usr"
exec_prefix="${prefix}"
xrdb="xrdb"
xinitdir="/etc/X11/xinit"
xclock="xclock"
xterm="xterm"
twm="twm"
xmodmap="xmodmap"

userresources="$HOME/.Xresources"
usermodmap="$HOME/.Xmodmap"
sysresources="$xinitdir/.Xresources"
sysmodmap="$xinitdir/.Xmodmap"

if [[ -f "$sysresources" ]]
then
    if [[ -x /usr/bin/cpp ]]
    then
        "$xrdb" -merge "$sysresources"
    else
        "$xrdb" -nocpp -merge "$sysresources"
    fi
fi

if [[ -f "$sysmodmap" ]]
then
    "$xmodmap" "$sysmodmap"
fi

if [[ -f "$userresources" ]]
then
    if [[ -x /usr/bin/cpp ]]
    then "$xrdb" -merge "$userresources"
    else
        "$xrdb" -nocpp -merge "$userresources"
    fi
fi

if [[ -f "$usermodmap" ]]
then
    "$xmodmap" "$usermodmap"
fi

if [[ -d "$xinitdir"/xinitrc.d ]]
then
    for f in "$xinitdir/xinitrc.d"/?*.sh
    do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi
##

# for 4-Monitor setup:
# Display Arrangement:
# DisplayPort-1                   HDM
#                 DisplayPort-0    I-
# HDMI-A-1                        A-0

# CVT-RB
xrandr --newmode "3840x2160_144" 1332.75 3840 3888 3920 4000 2160 2163 2168 2314 +HSync -VSync
xrandr --newmode "3840x2160_240" 2331.75 3840 3888 3920 4000 2160 2163 2168 2429 +HSync -VSync

xrandr --newmode "2560x1440_75" 304.25 2560 2608 2640 2720 1440 1443 1448 1492 +HSync -VSync

# 1543    + 3 x 138.5  = 1958.5  <- doesn't work :(
# 1332.75 + 3 x 241.5  = 2057.7
# 1332.75 + 3 x 304.25 = 2245.5  <- barely doesn't work :/
# 1543    + 3 x 241.5  = 2267.5  <- doesn't work :(
# 2331.75 + 0 x 0

xrandr --addmode DisplayPort-0 "3840x2160_144"
xrandr --addmode DisplayPort-0 "3840x2160_240"

xrandr --addmode DisplayPort-1 "2560x1440_75"
xrandr --addmode HDMI-A-0      "2560x1440_75"
xrandr --addmode HDMI-A-1      "2560x1440_75"

# TODO: for when I get one or two more cards to drive the other displays ^^
# xrandr  \
#         --fb 7840x2880                                                              \
#         --output DisplayPort-0 --mode "3840x2160_240" --pos 2560x360 --primary      \
#         --output DisplayPort-1 --mode "2560x1440_75"  --pos 0x0                     \
#         --output HDMI-A-0      --mode "2560x1440_75"  --pos 6400x180 --rotate right \
#         --output HDMI-A-1      --mode "2560x1440_75"  --pos 0x1440

xrandr  \
        --fb 7840x2880                                                              \
        --output DisplayPort-0 --mode "3840x2160_144" --pos 2560x480                \
        --output DisplayPort-1 --mode "2560x1440_75"  --pos 0x0                     \
        --output HDMI-A-0      --mode "2560x1440_75"  --pos 6400x0 --rotate right   \
        --output HDMI-A-1      --mode "2560x1440_75"  --pos 0x1440

mount //192.168.0.217/Fede

$HOME/repository/bash-collection/nitrogen-profile random
picom -b --config ~/.config/picom/picom.conf &

setxkbmap us colemak

exec i3
