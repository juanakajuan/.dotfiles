eval "$(starship init zsh)"

DISABLE_MAGIC_FUNCTIONS=true

# Aliases
alias update="sudo apt update && sudo apt upgrade -y && flatpak upgrade"

#Keybinds
bindkey -s ^f "tmux-sessionizer.sh\n"


source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH=$PATH:~/bin
export PATH=/home/juanix/.cargo/bin:$PATH
export PATH=/home/juanix/flutter/bin:$PATH
export PATH="$PATH":"$HOME/.pub-cache/bin"
export ANDROID_HOME=/home/juanix/Android/Sdk/
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH="$PATH:/usr/lib/dart/bin"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f "/home/juanix/.ghcup/env" ] && . "/home/juanix/.ghcup/env" # ghcup-env

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export SUDO_EDITOR="nvim"

