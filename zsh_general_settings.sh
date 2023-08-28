#!/bin/sh

###########
# VARIABLES
###########
export LANG="en_US.UTF-8"
export LC_ALL=en_US.UTF-8
export EDITOR="vim"
export FZF_DEFAULT_COMMAND="rg --files"

HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed


#########
# ALIASES
#########
#alias ctags="`brew --prefix`/bin/ctags"
alias h="history"
alias hg="history | grep $1"
alias c="clear "
alias cpb="pwd | pbcopy"
alias dcu="docker-compose up"
alias dcd="docker-compose down"

alias dot="cd ${DOTFILES_LOCATION}"
alias db="cd ${HOME}/Documents"
alias dbi="cd ${HOME}/Documents/00\ Inbox && mytree"
alias notes="cd ${HOME}/Documents/03\ Notes && mytree"
alias refs="cd ${HOME}/Documents/04\ References && mytree"
alias docs="cd ${HOME}/Documents && mytree"
alias proj="cd ${PROJECTS_ROOT}"

alias s="source $DOTFILES_LOCATION/zsh.sh"
alias ev="vim ${DOTFILES_LOCATION}/vim/vimrc.sh"
alias evu="vim ${DOTFILES_LOCATION}/vim/vim-plug_settings.sh"
alias eb="vim ${HOME}/.zshrc"
alias ebe="vim ${DOTFILES_LOCATION}/zsh_environment_settings.sh"
alias ebg="vim ${DOTFILES_LOCATION}/zsh_general_settings.sh"
alias ebgit="vim ${DOTFILES_LOCATION}/zsh_git_settings.sh"

alias start="./start.command"

dockerbash() {
  docker exec -it $1 /bin/bash
}
alias de=dockerbash

mytree() {
  #this does tree with 1 level
  #if no first parameter,
  #and otherwise uses the
  #supplied paramter for level depth
  local level=1
  local directory="."

  if [ "$#" -eq 1 ]; then
    if [[ $1 =~ ^-?[0-9]+$ ]]; then
      level=${1-1}
    else
      directory=${1}
    fi
  fi

  exa -T -L=${level} ${directory}
}
#t for tree
alias t=mytree
#tt for maximum depth tree
alias tt="mytree 999"
alias ll="exa -T -L=${level} ${directory}"

alias imgcat="${DOTFILES_LOCATION}/imgcat.sh"
alias imgls="${DOTFILES_LOCATION}/imgls.sh"
