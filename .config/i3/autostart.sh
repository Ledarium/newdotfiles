#!/bin/sh
setxkbmap -layout "us,ru" -variant ",typewriter" -option grp:shift_caps_switch &
nm-applet &
sleep 3
xdg-open http:// &
telegram-desktop &
