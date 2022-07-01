# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

cd ~

#path
export PATH="$PATH:/root/.local/bin"

#default editor
export EDITOR="vim"

#alias
alias vim="lvim" 
alias ..="cd .."
alias ...="cd .. && cd .."
alias la="ls -la"
alias li="ls -li"
alias cls="clear"
alias ll="ls -li"
alias reloadZsh="source ~/.zshrc"
alias gs="git status"
alias gl="git log"
alias lg="lazygit"
alias cnpm="npm --registry=https://registry.npmmirror.com \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=https://npmmirror.com/mirrors/node \
--userconfig=$HOME/.cnpmrc"

#wsl
alias code="'/mnt/c/Users/zeng/AppData/Local/Programs/Microsoft VS Code/bin/code'"


#plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
