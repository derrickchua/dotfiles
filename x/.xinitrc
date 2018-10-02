#!/bin/sh

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

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

start xrdb ~/.Xresources
start-pulseaudio-x11
xmodmap ~/.Xmodmap
# sh ~/.fehbg
xinput --set-prop "Asus TouchPad" "libinput Natural Scrolling Enabled" 1
xinput --set-prop "Asus TouchPad" "libinput Horizontal Scroll Enabled" 1
xinput --set-prop "Asus TouchPad" "libinput Tapping Enabled" 1
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

exec i3
#exec i3 -V >> ~/.i3/i3log 2>&1
