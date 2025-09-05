# Paths
fish_add_path ~/bin
fish_add_path ~/.opencode/bin

## Set values
## Run fastfetch as welcome message
function fish_greeting
    fastfetch
end

# Format man pages
set -x MANROFFOPT -c
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

## Environment setup
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
    source ~/.fish_profile
end

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Aliases
# Replace ls with eza
alias ls='eza --color=always --group-directories-first --icons' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons' # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons' # long format
alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
alias l.="eza -a | grep -e '^\.'" # show only dotfiles

alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short' # Hardware Info
alias up='yay --noconfirm && flatpak update -y'
alias upa='sudo apt update && sudo apt upgrade'

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

alias azlogin="az acr login -n tdsacr2"
alias lg="lazygit"
alias ip="ip --color=auto"
alias du="ncdu"
alias gs="git status"
alias ga="git add"
alias gc="git commit -a"
alias gp="git push"
alias gl="git pull"
alias gq="git add . && git commit -m 'changes' && git pull && git push"
alias so="source ~/.config/fish/config.fish"

# Functions
function qnote
    nvim (date +%F).md
end

# Keybindings
bind \cf "tmux-sessionizer.sh"

# Exports
set -gx EDITOR nvim
set -gx SUDO_EDITOR nvim

starship init fish | source
zoxide init fish | source
alias cd="z"
