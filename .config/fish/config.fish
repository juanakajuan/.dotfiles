# Paths
fish_add_path ~/.local/bin
fish_add_path ~/bin
fish_add_path ~/.opencode/bin

# Aliases
alias azlogin="az acr login -n tdsacr2"
alias la="eza -lha --icons --classify=auto --group-directories-first"
alias ls="eza --icons --classify=auto --group-directories-first"
alias ll="eza -lh --icons --classify=auto --group-directories-first"
alias lg="lazygit"
alias grep="grep --color=auto"
alias ip="ip --color=auto"
alias du="ncdu"
alias gs="git status"
alias ga="git add"
alias gc="git commit -a"
alias gp="git push"
alias gl="git pull"
alias so="source ~/.config/fish/config.fish"

# Functions
function qnote
    nvim (date +%F).md
end

function upa
    sudo apt update; and sudo apt upgrade
end

# Keybindings
bind \cf 'tmux-sessionizer.sh'

# Exports
set -gx EDITOR nvim
set -gx SUDO_EDITOR nvim

starship init fish | source
zoxide init fish | source
alias cd="z"
