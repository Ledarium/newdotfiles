#!/bin/sh
setxkbmap -layout "us,ru" -option grp:win_space_toggle &
nm-applet &
sleep 3
xdg-open http:// &
telegram-desktop &
