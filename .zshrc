DISABLE_MAGIC_FUNCTIONS=true
setopt inc_append_history
setopt share_history

# Aliases
alias azlogin='az acr login -n tdsacr2'
alias qnote='nvim '$(date +%F)'.md'
alias cd='z'
alias la='exa -la --icons'
alias ls='exa --icons'
alias ll='exa -l --icons'
alias lg='lazygit'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias du='ncdu'
alias gs='git status'
alias ga='git add'
alias gc='git commit -a'
alias gp='git push'
alias gl='git pull'
alias up='flatpak update -y; eos-update'
alias upa='sudo apt update && sudo apt upgrade'

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

bindkey -s '^f' 'tmux-sessionizer.sh\n'

#Keybinds
bindkey '^R' history-incremental-search-backward

export EDITOR=nvim

export PATH=$PATH:~/bin
export PATH=$PATH:/home/juanix/.local/bin
export PATH=/home/juanix/.cargo/bin:$PATH
export PATH=/usr/bin/flutter/bin:$PATH
export PATH="$PATH":"$HOME/.pub-cache/bin"
export ANDROID_HOME=$HOME/Android/Sdk/
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH="$PATH:/usr/lib/dart/bin"
export PATH=$PATH:/var/lib/flatpak/exports/share
export PATH=$PATH:/home/juanix/.local/share/flatpak/exports/share
export PATH=/home/juanix/.nimble/bin:$PATH
export PATH="$PATH:/home/juanix/.dotnet/tools"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=$PATH:/opt/gradle/gradle-8.4/bin
[ -f "/home/juanix/.ghcup/env" ] && . "/home/juanix/.ghcup/env" # ghcup-env
export SUDO_EDITOR="nvim"
export HISTSIZE=1000
export HISTFILESIZE=2000

# Add Flatpak paths to XDG_DATA_DIRS
if [ -d "/var/lib/flatpak/exports/share" ] || [ -d "$HOME/.local/share/flatpak/exports/share" ]; then
    export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:/home/$USER/.local/share/flatpak/exports/share:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
fi

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

fastfetch

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# pnpm
export PNPM_HOME="/home/juanix/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH=~/.npm-global/bin:$PATH
