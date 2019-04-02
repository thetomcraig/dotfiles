export ZSH=${HOME}/.oh-my-zsh

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv context dir)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_VIRTUALENV_BACKGROUND=green

plugins=(zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

bindkey '^j' autosuggest-accept
setopt auto_cd
DISABLE_AUTO_TITLE=true
