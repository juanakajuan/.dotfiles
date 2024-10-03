#!/bin/bash

SESSION_NAME="Work"

# Check if the session already exists
tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? != 0 ]; then
    # If the session does not exist, create a new one and run SSH
    tmux new-session -d -s $SESSION_NAME
    tmux send-keys -t $SESSION_NAME "ssh tds" C-m
    echo "Started tmux session '$SESSION_NAME' and ssh connection."
else
    echo "Session '$SESSION_NAME' already exists. Attaching..."
fi

tmux attach -t $SESSION_NAME
