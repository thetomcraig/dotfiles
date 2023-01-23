export ZSH=${HOME}/.oh-my-zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(zsh-autosuggestions fzf-tab)

source $ZSH/oh-my-zsh.sh

bindkey '^j' autosuggest-accept

DISABLE_AUTO_TITLE=true

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
