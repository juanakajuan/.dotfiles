# Juan's Dotfiles

### Using stow to manage them now
```bash
stow .
```

### Change default shell to zsh
```bash
chsh -s $(which zsh)
```

### Commands to Generate Github SSH Key
```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

### Applications to install
- stow
- zsh
- zsh-autosuggestions (https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)
- fastfetch / neofetch
- nodejs
- npm
- fd
- ripgrep
- btop
- zoxide
- eza
- tmux
- starship (curl -sS https://starship.rs/install.sh | sh)
- neovim
- wezterm
- discord
- bat
- steam
- ktorrent
- mullvadvpn
- webkit2gtk4.0
- jellyfin
- solaar
- headsetcontrol
- chatbox
