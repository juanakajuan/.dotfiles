#!/usr/bin/env zsh

echo "Setting up your computer..."

# Zsh
sudo rm -rf ~/.zshrc > /dev/null 2>&1
ln -s ~/.dotfiles/.zshrc ~/.zshrc
# ln -s ~/.dotfiles/.zprofile ~/.zprofile

# Git
sudo rm -rf ~/.gitconfig > /dev/null 2>&1
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

# Tmux
sudo rm -rf ~/.config/tmux > /dev/null 2>&1
ln -s ~/.dotfiles/.config/tmux ~/.config/tmux

# Starship
sudo rm ~/.config/starship.toml > /dev/null 2>&1
ln -s ~/.dotfiles/.config/starship.toml ~/.config/starship.toml

# i3
sudo rm -rf ~/.config/i3 > /dev/null 2>&1
sudo rm -rf ~/.config/i3status > /dev/null 2>&1
ln -s ~/.dotfiles/.config/i3 ~/.config/i3
ln -s ~/.dotfiles/.config/i3status ~/.config/i3status

# Wezterm
sudo rm ~/.wezterm.lua > /dev/null 2>&1
ln -s ~/.dotfiles/.wezterm.lua ~/.wezterm.lua


# Scripts
sudo rm -rf ~/bin/tmux-sessionizer.sh > /dev/null 2>&1
sudo ln -s ~/.dotfiles/bin/tmux-sessionizer.sh ~/bin/tmux-sessionizer.sh
