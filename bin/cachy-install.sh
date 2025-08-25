#!/bin/bash

echo "Installing packages..."

paru -S \
    nodejs \
    npm \
    pnpm \
    flatpak \
    tmux \
    neovim \
    discord \
    solaar \
    webkit2gtk \
    webkitgtk-6.0 \
    lazygit \
    ghostty \
    wl-clipboard \
    gamemode \
    rocm-smi-lib \
    zellij \
    libxml2-legacy \
    cmake \
    vlc \
    android-tools \
    scrcpy \
    feishin-bin \
    teams-for-linux-bin \
    mullvad-vpn-bin \
    localsend-bin

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Install zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

flatpak install -y --noninteractive flathub com.github.iwalton3.jellyfin-media-player
flatpak install -y --noninteractive flathub com.vysp3r.ProtonPlus
flatpak install -y --noninteractive flathub org.vinegarhq.Sober
flatpak install -y --noninteractive flathub org.fedoraproject.MediaWriter
flatpak install -y --noninteractive flathub net.lutris.Lutris
flatpak install -y --noninteractive flathub org.libreoffice.LibreOffice
flatpak install -y --noninteractive flathub org.kde.elisa
flatpak install -y --noninteractive flathub com.github.taiko2k.tauonmb
