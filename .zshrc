fastfetch

# Path to your oh-my-zsh installation.
export ZSH="/usr/share/oh-my-zsh"

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
[[ -z "${plugins[*]}" ]] && plugins=(git fzf extract)

source $ZSH/oh-my-zsh.sh

# User configuration

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Ignore commands that start with spaces and duplicates.

export HISTCONTROL=ignoreboth

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Don"t add certain commands to the history file.

export HISTIGNORE="&:[bf]g:c:clear:history:exit:q:pwd:* --help"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Use custom `less` colors for `man` pages.

export LESS_TERMCAP_md="$(tput bold 2> /dev/null; tput setaf 2 2> /dev/null)"
export LESS_TERMCAP_me="$(tput sgr0 2> /dev/null)"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history.

export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

export EDITOR="nvim"
export VISUAL="nvim"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
alias make="make -j`nproc`"
alias ninja="ninja -j`nproc`"
alias n="ninja"
alias c="clear"

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

alias azlogin="az acr login -n tdsacr2"
alias cd="z"
alias la="eza -lha --icons --classify=auto --group-directories-first"
alias ls="eza --icons --classify=auto --group-directories-first"
alias ll="eza -lh --icons --classify=auto --group-directories-first"
alias lg="lazygit"
alias grep="grep --color=auto"
alias ip="ip -color=auto"
alias du="ncdu"
alias upa="sudo apt update && sudo apt upgrade"

alias gs="git status"
alias ga="git add ."
alias gc="git commit"
alias gp="git pull"
alias gP="git push"
alias gf="git fetch"
alias gq="git add . && git commit -m "changes" && git pull && git push"

bindkey -s "^f" "tmux-sessionizer.sh\n"

# Fish-like syntax highlighting and autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# pkgfile "command not found" handler
source /usr/share/doc/pkgfile/command-not-found.zsh

export FZF_BASE=/usr/share/fzf
export PATH="/home/juanix/bin:$PATH"
export PATH="/home/juanix/.local/bin:$PATH"
export PATH"=$PATH:$(go env GOPATH)/bin"

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# opencode
export PATH=/home/jmireles/.opencode/bin:$PATH

# opencode
export PATH=/home/juanix/.opencode/bin:$PATH
export PATH=$PATH:$HOME/.local/bin

# pnpm
export PNPM_HOME="/home/juanix/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
