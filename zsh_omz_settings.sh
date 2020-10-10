export ZSH=${HOME}/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

bindkey '^j' autosuggest-accept

DISABLE_AUTO_TITLE=true
