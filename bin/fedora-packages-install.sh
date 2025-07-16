#!/bin/bash

echo "Installing packages..."

dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

dnf copr enable alternateved/eza -y
dnf copr enable wezfurlong/wezterm-nightly -y
dnf copr enable atim/lazygit -y

sudo dnf config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo

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
  lazygit \
  mullvad-vpn

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

hostnamectl set-hostname strawberry
