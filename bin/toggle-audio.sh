#!/bin/bash

# This script toggles the audio output.

SINK1="alsa_output.usb-BurrBrown_from_Texas_Instruments_USB_AUDIO_CODEC-00.analog-stereo"
SINK2="alsa_output.usb-Generic_USB_Audio-00.HiFi_7_1__Speaker__sink"

CURRENT_SINK=$(pactl get-default-sink)

# Toggle between sinks
if [ "$CURRENT_SINK" = "$SINK1" ]; then
    pactl set-default-sink "$SINK2"
else
    pactl set-default-sink "$SINK1"
fi
