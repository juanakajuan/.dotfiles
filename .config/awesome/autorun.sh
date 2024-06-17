#!/usr/bin/env bash

function run {
	if ! pgrep -f $1 ;
	then
		$@&
	fi
}

run picom --experimental-backends -b
run /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1
run setxkbmap -option ctrl:nocaps
run ~/.screenlayout/screens.sh
