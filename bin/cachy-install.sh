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
    git-delta \
    teams-for-linux-bin \
    mullvad-vpn-bin

# Install starship
curl -sS https://starship.rs/install.sh | sh

flatpak install -y flathub com.github.iwalton3.jellyfin-media-player
flatpak install -y flathub com.vysp3r.ProtonPlus
flatpak install -y flathub org.vinegarhq.Sober
flatpak install -y flathub org.fedoraproject.MediaWriter
flatpak install -y flathub net.lutris.Lutris
flatpak install -y flathub org.libreoffice.LibreOffice
flatpak install -y flathub org.kde.elisa
flatpak install -y flathub com.github.taiko2k.tauonmb
flatpak install -y flathub org.videolan.VLC
flatpak install -y flathub com.obsproject.Studio
flatpak install -y flathub org.gimp.GIMP
flatpak install -y flathub org.blender.Blender
