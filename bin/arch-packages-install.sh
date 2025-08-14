#!/bin/bash

echo "Installing packages..."

sudo pacman -S \
    bat \
    stow \
    fish \
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
    ghostty \
    wl-clipboard \
    timeshift \
    spotify-launcher \
    gamemode \
    rocm-smi-lib \
    zellij \
    libxml2-legacy \
    cmake \
    clang \
    vlc

chsh -s $(which fish)

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Install brave
curl -fsS https://dl.brave.com/install.sh | sh

# Install zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

flatpak install -y --noninteractive flathub com.github.iwalton3.jellyfin-media-player
flatpak install -y --noninteractive flathub com.vysp3r.ProtonPlus
flatpak install -y --noninteractive flathub org.vinegarhq.Sober
flatpak install -y --noninteractive flathub org.fedoraproject.MediaWriter
flatpak install -y --noninteractive flathub net.lutris.Lutris
flatpak install -y --noninteractive flathub org.libreoffice.LibreOffice
flatpak install -y --noninteractive flathub org.kde.elisa
