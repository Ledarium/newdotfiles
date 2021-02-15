#!/bin/sh
sudo nvidia-settings --assign CurrentMetaMode="DPY-3: nvidia-auto-select @1920x1080 +3840+0 {Transform=(2.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,0.000000,1.000000), ViewPortIn=3840x2160, ViewPortOut=1920x1080+0+0, ResamplingMethod=Bilinear, ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}, DPY-4: nvidia-auto-select @3840x2160 +0+0 {ForceFullCompositionPipeline = On }" &
sudo nvidia-smi -i 0 -pl 140 &
sudo nvidia-smi -i 1 -pl 135 &

nm-applet &
sleep 1
blueman-applet &
xdg-open http:// &
element-desktop &
deluge &
safeeyes &
redshift-gtk -b 1.0:0.7 -t 6500:3700 &
mount /mnt/share &
