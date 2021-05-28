#!/bin/sh

###########
# VARIABLES
###########
export LANG="en_US.UTF-8"
export LC_ALL=en_US.UTF-8
export EDITOR="/usr/local/bin/vim"
export FZF_DEFAULT_COMMAND="rg --files"

terminal_emulator=$(osascript -e 'tell application "System Events"' \
                              -e 'set frontApp to name of first application process whose frontmost is true' \
                              -e 'end tell')
case $terminal_emulator in
  kitty)
    export TERM=xterm-kitty 
  ;;
  iTerm2)
    export TERM=xterm-256color
  ;;
esac

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
alias dcu="docker-compose up"
alias dcd="docker-compose down"

alias dot="cd ${DOTFILES_LOCATION}"
alias v="vim ${DOTFILES_LOCATION}/vim/vimrc.sh"
alias vu="vim ${DOTFILES_LOCATION}/vim/vim-plug_settings.sh"
alias db="cd ${HOME}/Dropbox/TomCraig"
alias proj="cd ${PROJECTS_ROOT}"
alias notes=openNotes
openNotes() {
  cd ${HOME}/Dropbox/TomCraig/Notes\ and\ Documents
  vim README.md
}

#t for tree
alias t=mytree
mytree() {
  #this does tree with 1 level
  #if no first parameter,
  #and otherwise uses the
  #supplied paramter for level depth
  exa -T -L=${1-1} 
}
#tt for maximum depth tree
alias tt="mytree 999"
alias s="source $DOTFILES_LOCATION/zsh.sh"
alias b="vim ${HOME}/.zshrc"

alias start="./start.command"


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

ripgrep_search() {
  rg --files-with-matches --no-messages "${1}" . | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '${1}' || rg --ignore-case --pretty --context 10 '${1}' {}"
}


alias lsd="du -hs */ | sort -hr | head"
