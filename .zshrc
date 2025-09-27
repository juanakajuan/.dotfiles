# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/cachyos-zsh-config/cachyos-config.zsh

# Aliases
alias azlogin='az acr login -n tdsacr2'
alias qnote='nvim '$(date +%F)'.md'
alias cd='z'
alias la='eza -lha --icons --classify=auto --group-directories-first'
alias ls='eza --icons --classify=auto --group-directories-first'
alias ll='eza -lh --icons --classify=auto --group-directories-first'
alias lg='lazygit'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias du='ncdu'
alias gs='git status'
alias ga='git add'
alias gc='git commit -a'
alias gp='git push'
alias gl='git pull'
alias gq='git add . && git commit -m "changes" && git pull && git push'
alias upa='sudo apt update && sudo apt upgrade'

bindkey -s '^f' 'tmux-sessionizer.sh\n'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(zoxide init zsh)"
