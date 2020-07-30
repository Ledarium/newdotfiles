#!/bin/sh
xrandr --output DP-0 --primary & 
nm-applet &
sleep 1
xdg-open http:// &
telegram-desktop &
element-desktop-nightly &
