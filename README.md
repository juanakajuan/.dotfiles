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

### For KDE
- https://github.com/eatsu/kwin-script-virtual-desktops-only-on-primary
