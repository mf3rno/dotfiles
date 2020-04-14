#! /bin/bash

export GEM_HOME=~/.rvm/gem/ruby-2.7.0
export GEM_PATH=~/.rvm/gems/ruby-2.7.0/bin
export GOPATH=~/go
export PATH="$GEM_PATH:$GOPATH/bin:/snap/bin:~/bin:~/bin/bfx-hf-ui:~/.local/bin:~/.rvm/bin:/usr/local/bin:~/bin/dev-sessions:$PATH"

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
  xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
  xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
  xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
  xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --output DP-1 --set "Broadcast RGB" "Full"
xrandr --output DP-2 --set "Broadcast RGB" "Full"
./.screenlayout/pp.sh

xset r rate 200 30

# Increase watch limit...
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

twm &

# exec sway --my-next-gpu-wont-be-nvidia
exec i3
