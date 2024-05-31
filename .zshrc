DISABLE_MAGIC_FUNCTIONS=true

# Aliases
alias update="sudo zypper refresh && sudo zypper update -y && flatpak upgrade"
alias cd="z"
alias cdi="zi"
alias ls="eza"
alias azlogin="az acr login -n tdsacr2"

#Keybinds
bindkey -s "^f" "tmux-sessionizer.sh\n"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

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
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=$PATH:/opt/gradle/gradle-8.4/bin
[ -f "/home/juanix/.ghcup/env" ] && . "/home/juanix/.ghcup/env" # ghcup-env
export SUDO_EDITOR="nvim"

source /home/juanix/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source $(brew --prefix 2>/dev/null)/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
