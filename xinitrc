#! /bin/bash

xset r rate 200 30

# Increase watch limit...
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

