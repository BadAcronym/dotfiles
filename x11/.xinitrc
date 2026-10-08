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

# CVT-RB
xrandr --newmode "3840x2160_146" 1352.5 3840 3888 3920 4000 2160 2163 2168 2316 +HSync -VSync

xrandr --newmode "3840x2160_240" 2331.75 3840 3888 3920 4000 2160 2163 2168 2429 +HSync -VSync
xrandr --newmode "2560x1440_75"  304.25 2560 2608 2640 2720 1440 1443 1448 1492 +HSync -VSync

xrandr --addmode DP-1 "3840x2160_146"
xrandr --addmode DP-1 "3840x2160_240"

xrandr --addmode DP-2   "2560x1440_75"
xrandr --addmode HDMI-1 "2560x1440_75"
xrandr --addmode HDMI-2 "2560x1440_75"

$HOME/repository/bash-collection/displaymode $(cat $HOME/.displaymode)

mount //192.168.0.217/Fede
mount //192.168.0.217/Shared

nitrogen --restore 2>/dev/null &
picom -b --config ~/.config/picom/picom.conf &

setxkbmap us colemak

exec i3
