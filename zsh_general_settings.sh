#!/bin/sh

##########
# VARIABLES
##########
export LANG="en_US.UTF-8"
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
export EDITOR="/usr/local/bin/vim"
export FZF_DEFAULT_COMMAND="rg --files --ignore-file ${dotfiles_location}/welkin/fzf_ignore.sh"

HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed


#########
# ALIASES
#########
alias ctags="`brew --prefix`/bin/ctags"
alias h="history"
alias hg="history | grep $1"
alias c="clear "
alias cpb="pwd | pbcopy"

alias v="vim $dotfiles_location/vim/vimrc.sh"
alias vu="vim $dotfiles_location/vim/vundle_settings.sh"
alias dot="cd ${HOME}/Dotfiles"
alias drop="cd ${HOME}/Dropbox/TomCraig"

#t for tree
alias t=mytree
mytree() {
  #this does tree with 1 level
  #if no first parameter,
  #and otherwise uses the
  #supplied paramter for level depth
  tree -C -L ${1-1} -I "*.pyc"
}
#T for tree 1 level deep with no invisibles
alias T="tree -a -C -L 1"
#tt for maximum depth tree
alias tt="mytree 999"
alias s="source $dotfiles_location/zsh.sh"
alias b="vim $dotfiles_location/zsh.sh"

alias sshariston="ssh tom@10.0.1.3"
alias ssharistonremote="ssh tom@24.130.253.28 -p 56970"
alias sshjuno="ssh pi@10.0.1.20"


################## 
# HELPER FUNCTIONS
################## 
echoGreen() {
  tput setaf 2
  echo "$1"
  tput sgr0
}

echoYellow() {
  tput setaf 3
  echo "$1"
  tput sgr0
}

echoRed() {
  tput setaf 1
  echo "$1"
  tput sgr0
}
echoCyan() {
  tput setaf 6
  echo "$1"
  tput sgr0
}

promptToContinue() {
  while true; do
    tput bold
    read -p "$1 (y/N) " yn
    tput sgr0
    if [ "$yn" = "" ]; then
      yn='N'
    fi
    case $yn in
        [Yy] ) break;;
        [Nn] ) exit 1;;
        * ) echo "Please answer y or n for yes or no.";;
    esac
  done
}

export PATH="/usr/local/opt/ruby/bin:$PATH"
