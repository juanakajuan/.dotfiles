#!/usr/bin/env zsh

echo "Setting up your computer..."

# Zsh
ln -s ~/.dotfiles/.zshrc ~/.zshrc

# Git
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

# Neovim
ln -s ~/.dotfiles/nvchad-config/custom ~/.config/nvim/lua/custom

# Tmux
ln -s ~/.dotfiles/tmux ~/.config/tmux
