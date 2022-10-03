#!/bin/zsh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
	[ -x "$f" ] && . "$f"
	done
	unset f
fi
/usr/lib/kdeconnectd &
/usr/lib/polkit-kde-authentication-agent-1 &
albert &
fusuma &
nitrogen --restore &
picom --config ~/.config/picom/picom.conf -f --experimental-backends &
~/.config/polybar/launch.sh --cuts
exec mybin/startdwm

