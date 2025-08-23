#!/bin/bash

echo "Installing packages..."

sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf copr enable alternateved/eza -y
sudo dnf copr enable wezfurlong/wezterm-nightly -y
sudo dnf copr enable atim/lazygit -y
sudo dnf copr enable scottames/ghostty

sudo dnf config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld
sudo dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld
sudo dnf swap mesa-va-drivers.i686 mesa-va-drivers-freeworld.i686
sudo dnf swap mesa-vdpau-drivers.i686 mesa-vdpau-drivers-freeworld.i686

sudo dnf install \
    bat \
    stow \
    fish \
    fastfetch \
    nodejs \
    npm \
    pnpm \
    fd \
    ripgrep \
    btop \
    eza \
    neovim \
    discord \
    solaar \
    steam \
    winetricks \
    lazygit \
    ghostty \
    wl-clipboard \
    timeshift \
    gamemode \
    rocm-smi \
    cmake \
    clang \
    vlc \
    android-tools \
    webkit2gtk4.0 \
    perl \
    zoxide \
    cargo \
    gimp \
    webkit2gtk4.1

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Install zellij
cargo install --locked zellij

chsh -s $(which fish)

hostnamectl set-hostname strawberry
