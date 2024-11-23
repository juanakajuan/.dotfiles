DISABLE_MAGIC_FUNCTIONS=true
setopt inc_append_history
setopt share_history

# Aliases
alias azlogin='az acr login -n tdsacr2'
alias qnote='nvim '$(date +%F)'.md'
alias ls='eza --icons'
alias ll='eza -l --icons'
alias la='eza -la --icons'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias du='ncdu'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'

#Keybinds
bindkey '^R' history-incremental-search-backward

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

export EDITOR=nvim

export PATH=$PATH:~/bin
export PATH=$PATH:/home/juanix/.local/bin
export PATH=/home/juanix/.cargo/bin:$PATH
export PATH=/usr/bin/flutter/bin:$PATH
export PATH="$PATH":"$HOME/.pub-cache/bin"
export ANDROID_HOME=/home/juanix/Android/Sdk/
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH="$PATH:/usr/lib/dart/bin"
export PATH=$PATH:/var/lib/flatpak/exports/share
export PATH=$PATH:/home/juanix/.local/share/flatpak/exports/share
export PATH=/home/juanix/.nimble/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=$PATH:/opt/gradle/gradle-8.4/bin
[ -f "/home/juanix/.ghcup/env" ] && . "/home/juanix/.ghcup/env" # ghcup-env
export SUDO_EDITOR="nvim"
export HISTSIZE=1000
export HISTFILESIZE=2000

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

bindkey -e
bindkey -s "^f" "tmux-sessionizer.sh\n"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
