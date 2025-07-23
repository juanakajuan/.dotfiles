#!/bin/bash

echo "Installing packages..."

sudo pacman -S \
    bat \
    stow \
    zsh \
    fastfetch \
    nodejs \
    npm \
    pnpm \
    fd \
    flatpak \
    firefox \
    ripgrep \
    btop \
    zoxide \
    eza \
    tmux \
    neovim \
    discord \
    solaar \
    steam \
    webkit2gtk \
    webkit2gtk-4.1 \
    webkitgtk-6.0 \
    winetricks \
    lazygit \
    vlc \
    ghostty \
    wl-clipboard \
    timeshift

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

flatpak install -y --noninteractive flathub com.github.iwalton3.jellyfin-media-player
flatpak install -y --noninteractive flathub com.github.IsmaelMartinez.teams_for_linux
flatpak install -y --noninteractive flathub com.vysp3r.ProtonPlus
flatpak install -y --noninteractive flathub org.vinegarhq.Sober
flatpak install -y --noninteractive flathub org.fedoraproject.MediaWriter
flatpak install -y --noninteractive flathub com.spotify.Client
flatpak install -y --noninteractive flathub com.core447.StreamController
