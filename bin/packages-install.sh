#!/bin/bash

echo "Installing packages..."
yay -S \
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
	eza \
	tmux \
	neovim \
	ghostty \
	discord \
	bat \
	steam \
	webkit2gtk4.1 \
	solaar \
	winetricks \

flatpak install app/com.github.iwalton3.jellyfin-media-player/x86_64/stable -y
flatpak install app/app.zen_browser.zen/x86_64/stable -y
flatpak install app/org.libreoffice.LibreOffice/x86_64/stable
flatpak install app/dev.vencord.Vesktop/x86_64/stable

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
