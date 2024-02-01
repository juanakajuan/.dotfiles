1. Clone repository to Home directory

2. Create symlinks in the Home directory to the real files in the repo.
```zsh
# There are better and less manual ways to do this;
# look into install scripts and bootstrapping tools.

ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
```
