#! /bin/bash

./.scripts/screen.setup.horizontal
xset r rate 200 30
nitrogen --restore 

# Increase watch limit...
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

xbindkeys
exec awesome
