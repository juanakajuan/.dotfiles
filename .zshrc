# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

DISABLE_MAGIC_FUNCTIONS=true

ZSH_THEME="kafeitu"

# Aliases
alias update="sudo apt update && sudo apt upgrade -y"

#Keybinds
bindkey -s ^f "tmux-sessionizer.sh\n"

plugins=(
	git
	zsh-autosuggestions
	tmux
)

source $ZSH/oh-my-zsh.sh

export PATH=/home/juanix/.cargo/bin:$PATH
export PATH=/home/juanix/flutter/bin:$PATH
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export ANDROID_HOME=/home/juanix/Android/Sdk/
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH="$PATH:/usr/lib/dart/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
