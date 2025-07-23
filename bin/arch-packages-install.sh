#!/bin/bash

echo "Installing packages..."

pacman -S \
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
    mullvad-vpn \
    vlc \
    ghostty

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

flatpak install flathub com.github.iwalton3.jellyfin-media-player
flatpak install flathub com.github.IsmaelMartinez.teams_for_linux
flatpak install flathub com.vysp3r.ProtonPlus
flatpak install flathub org.vinegarhq.Sober
flatpak install flathub org.fedoraproject.MediaWriter
flatpak install flathub com.spotify.Client
flatpak install flathub com.core447.StreamController
