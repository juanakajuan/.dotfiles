#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

echo "---" | tee -a /tmp/polybar1.log
polybar --config=/home/juanix/.config/polybar/config.ini bar 2>&1 | tee -a /tmp/polybar1.log & disown
polybar --config=/home/juanix/.config/polybar/config.ini bottom_bar 2>&1 | tee -a /tmp/polybar1.log & disown
echo "Bars launched..."
