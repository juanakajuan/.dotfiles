#!/usr/bin/env bash

# 1. Place the script in your path
# 2. Create an alias to call this script in your shells .rc config:
#    bindkey -s ^f "zellij_sessionizer\n"
# 3. Update where you want to search:
#    I'm using `fd` to perform the search inside a specific dir, you can use that or `find`

# Use an argument if passed
if [[ $# -eq 1 ]]; then
    selected_path=$1
else
    # If no argument was provided, interactively choose a directory
    selected_path=$(fd . ~/Dev ~/.dotfiles ~/.dotfiles/.config --min-depth 1 --max-depth 2 --type d | fzf)
fi

# If no directory was selected, exit the script
if [[ -z $selected_path ]]; then
    exit 0
fi

# Get the name of the selected directory, replacing "." with "_"
session_name=$(basename "$selected_path" | tr . _)

# We're outside of zellij, so lets create a new session or attach to a new one.
if [[ -z $ZELLIJ ]]; then
    cd $selected_path

    # -c will make zellij to either create a new session or to attach into an existing one
    zellij attach $session_name -c
    exit 0
fi

# We're inside zellij so we'll open a new pane and move into the selected directory
zellij action new-pane

# Hopefully they'll someday support specifying a directory and this won't be as laggy
# thanks to @msirringhaus for getting this from the community some time ago!
zellij action write-chars "cd $selected_path" && zellij action write 10
