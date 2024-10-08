#!/usr/bin/env bash

function run {
	if ! pgrep -f $1 ;
	then
		$@&
	fi
}

run picom -b &
run /usr/libexec/polkit-gnome-authentication-agent-1 &
run setxkbmap -option ctrl:nocaps &
run ~/.screenlayout/screens.sh &
run nm-applet &
run pasystray &
xinput -set-prop 'Logitech USB Receiver' 'libinput Accel Speed' 0.8
xinput -set-prop 'Logitech USB Receiver' 'libinput Accel Profile Enabled' 0, 1
