#!/bin/bash

# Check if script is running with root permissions.
if [ "$EUID" -ne 0 ]
	then echo "Please run with root privileges."
	exit
fi

# DNF Config
echo "Configuring DNF..."
echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf
echo "fastestmirror=True" | sudo tee -a /etc/dnf/dnf.conf
echo "defaultyes=True" | sudo tee -a /etc/dnf/dnf.conf

# Enable Free and Nonfree repository
echo "Enable Free and Nonfree repositories..."
dnf in https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
dnf in https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# Update firmware
echo "Updating firmware..."
fwupdmgr refresh --force
fwupdmgr get-devices
fwupdmgr get-updates
fwupdmgr update

# Copr setup for wezterm
dnf copr enable wezfurlong/wezterm-nightly

# Package installs
echo "Installing packages..."
dnf in \
	stow \
	zsh \
	fastfetch \
	nodejs \
	npm \
	fd \
	ripgrep \
	btop \
	zoxide \
	eza \
	tmux \
	neovim \
	wezterm \
	discord \
	bat \
	steam \
	webkit2gtk4.0 \
	solaar \
	libreoffice \
	winetricks \
	-y \

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# Multimedia codecs
dnf swap -y ffmpeg-free ffmpeg --allowerasing
dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y

# Setup hostname
hostnamectl set-hostname --pretty "strawberry"
hostnamectl set-hostname --static strawberry
