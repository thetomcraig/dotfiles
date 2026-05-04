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
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias h="history"
alias hg="history | grep $1"
alias c="clear "
alias cpb="pwd | pbcopy"
alias cpr="rsync -Pa $1 $2"

alias dcu="docker compose up"
alias dcd="docker compose down"
alias dps="docker ps --format 'table{{.Names}}\t{{.Image}}' | grep -v k8s_"
alias doco="docker"

dockerbash() {
  docker exec -it $1 /bin/bash
}
alias dcb=dockerbash

dockernuke() {
  docker stop $(docker ps -a -q)
  docker rm $(docker ps -a -q)
  docker rmi $(docker images -q)
  docker volume rm $(docker volume ls -q)
  docker system prune
}
alias dcnk=dockernuke

alias dot="cd ${DOTFILES_LOCATION}"
alias proj="cd ${PROJECTS_ROOT}"

alias s="source $DOTFILES_LOCATION/zsh.sh"
alias ev="vim ${DOTFILES_LOCATION}/vim/vimrc.sh"
alias evu="vim ${DOTFILES_LOCATION}/vim/vim-plug_settings.sh"
alias eb="vim ${HOME}/.zshrc"
alias ebe="vim ${DOTFILES_LOCATION}/zsh_environment_settings.sh"
alias ebg="vim ${DOTFILES_LOCATION}/zsh_general_settings.sh"
alias ebgit="vim ${DOTFILES_LOCATION}/zsh_git_settings.sh"

alias check_repos="${DOTFILES_LOCATION}/check_git_repos.sh"

alias start="./start.command"

export VISUAL=vim

better_tree() {
  local level dir

  # No args: default dir="." and level=1
  if [[ $# -eq 0 ]]; then
    dir="."
    level=1

  # One arg: could be level OR dir
  elif [[ $# -eq 1 ]]; then
    if [[ "$1" =~ ^[0-9]+$ ]]; then
      dir="."
      level="$1"
    else
      dir="$1"
      level=1
    fi

  # Two args: dir then level (even if level is 1 or 2 etc.)
  else
    dir="$1"
    if [[ "$2" =~ ^[0-9]+$ ]]; then
      level="$2"
    else
      level=1
    fi
  fi

  eza -L="$level" -lT -- "$dir"
}

alias t="better_tree"
alias ti="eza -L=1 -alT ."


alias lsz="du -h --max-depth=1"

alias imgcat="${DOTFILES_LOCATION}/imgcat.sh"
alias imgls="${DOTFILES_LOCATION}/imgls.sh"
