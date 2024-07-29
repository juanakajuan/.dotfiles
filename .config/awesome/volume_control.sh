#!/bin/bash

# Define a notification ID file
NOTIFICATION_ID_FILE="$HOME/.config/awesome/volume_notification_id"

# Function to read the notification ID from file
get_notification_id() {
    if [[ -f "$NOTIFICATION_ID_FILE" ]]; then
        cat "$NOTIFICATION_ID_FILE"
    else
        echo 0
    fi
}

# Adjust volume
wpctl set-volume @DEFAULT_AUDIO_SINK@ $1

# Get the current volume level
VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')

# Get the previous notification ID
NOTIFICATION_ID=$(get_notification_id)

# Send notification and capture the new notification ID
NEW_NOTIFICATION_ID=$(notify-send -u low -h int:value:"$VOLUME" -r "$NOTIFICATION_ID" "Volume: ${VOLUME}%" -p)

echo $NEW_NOTIFICATION_ID > "$NOTIFICATION_ID_FILE"
