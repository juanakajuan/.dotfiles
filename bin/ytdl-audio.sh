#!/bin/bash

if [ -z "$1" ]; then
    echo "Error: No YouTube URL provided."
    echo "Usage: ./ytdl-audio.sh [youtube_url]"
    exit 1
fi

yt-dlp -x --audio-format m4a --embed-metadata --embed-thumbnail --sleep-interval 5 --max-sleep-interval 10 --ignore-errors "$1"
