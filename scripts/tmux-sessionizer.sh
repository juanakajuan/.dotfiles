#!/usr/bin/env bash
if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/Dev ~/Dev/ODU ~/Dev/ODU/CS-417/Assignments ~/Dev/ODU/CS-417/Examples ~/Dev/ODU/CS-330/CS-330-Assignments ~/.config -mindepth 1 -maxdepth 1 -type d | fzf)
fi
if [[ -z $selected ]]; then
    exit 0
fi
selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -A -s $selected_name -c $selected
    exit 0
fi
if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi
tmux switch-client -t $selected_name
