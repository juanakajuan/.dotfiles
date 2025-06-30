#!/bin/bash

echo "Installing packages..."
dnf install \
	stow \
	zsh \
	fastfetch \
	nodejs \
	npm \
	pnpm \
	fd \
	flatpak \
	ripgrep \
	btop \
	zoxide \
	tmux \
	neovim \
	discord \
	bat \
	steam \
	webkit2gtk4.0 \
	webkit2gtk4.1 \
	solaar \
	winetricks \

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
