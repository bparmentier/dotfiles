#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xmodmap ~/.Xmodmap

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

eval $(cat ~/.fehbg) &

mpd ~/.mpdconf

# Set fonts directories
xset +fp /usr/share/fonts/local
xset fp rehash

# Screen powersave
xset +dpms
xset dpms 0 0 300

#(sleep 5 && devmon) &

exec i3
