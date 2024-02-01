#!/usr/bin/env zsh

echo "Setting up your computer..."

# Zsh
ln -s ~/.dotfiles/.zshrc ~/.zshrc

# Git
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

# Neovim
ln -s ~/.dotfiles/nvim ~/.config/nvim

# Tmux
ln -s ~/.dotfiles/tmux ~/.config/tmux
