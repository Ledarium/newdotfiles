#!/bin/sh
xrandr --output DP-0 --primary & 
nm-applet &
sleep 1
xdg-open http:// &
telegram-desktop &
element-desktop-nightly &
nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }" &

