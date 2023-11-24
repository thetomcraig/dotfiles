export ZSH=${HOME}/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(zsh-autosuggestions fzf-tab nvm)

source $ZSH/oh-my-zsh.sh

bindkey '^j' autosuggest-accept

DISABLE_AUTO_TITLE=true

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

zstyle ':omz:plugins:nvm' lazy yes
