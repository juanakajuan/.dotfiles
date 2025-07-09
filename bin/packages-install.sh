#!/bin/bash

echo "Installing packages..."

sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf copr enable alternateved/eza
sudo dnf copr enable wezfurlong/wezterm-nightly

dnf install \
	bat \
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
	discord \
	solaar \
	steam \
	webkit2gtk4.0 \
	webkit2gtk4.1 \
	wezterm \
	winetricks \

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
