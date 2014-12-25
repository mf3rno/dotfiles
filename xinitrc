#! /bin/bash

if ["$HOSTNAME" = alice]; then
  xrandr --output HDMI-2 --left-of DVI-0 --output DVI-0 --left-of DVI-1
fi

xset r rate 200 30

nitrogen --restore 

xbindkeys
exec awesome
