#! /bin/bash

./.scripts/screen.setup.horizontal

xset r rate 200 30

nitrogen --restore 

xbindkeys
exec awesome
