#! /bin/bash

xrandr --output HDMI-1 --left-of DVI-D-0 --output DVI-D-0 --left-of DVI-I-1

xset r rate 200 30

nitrogen --restore 

xbindkeys
exec awesome
