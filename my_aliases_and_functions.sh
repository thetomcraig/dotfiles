# vim: set syntax=zsh
# au BufReadPost zsh.sh set ft=zsh.rc

###################
# GENERAL VARIABLES
###################
DIR=$(dirname $(readlink "${HOME}/.zshrc"))

export ZSH=${HOME}/.oh-my-zsh

export dotfiles_location="${HOME}/Dotfiles"

export LANG="en_US.UTF-8"
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
export EDITOR="/usr/local/bin/vim"
export FZF_DEFAULT_COMMAND='rg --files'


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


#################
# GENERAL ALIASES
#################
alias ctags="`brew --prefix`/bin/ctags"
alias h="history"
alias hg="history | grep $1"
alias c="clear "
alias cpb="pwd | pbcopy"



################
# DISK LOCATIONS
################
alias v="vim $dotfiles_location/vimrc.sh"
alias vu="vim $dotfiles_location/vundle_settings.sh"
alias s="source $dotfiles_location/zsh.sh"
alias b="vim $dotfiles_location/zsh.sh"
alias dot="cd ${HOME}/Dotfiles"
alias drop="cd ${HOME}/Dropbox/TomCraig"



######
# TREE
######
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
unalias d
alias d="tree -a -C -L 1 -d"



######
# TMUX
######
tmux_dotfiles_location="$dotfiles_location/tmux"
export tmux_dotfiles_location
source $tmux_dotfiles_location/tmux_colors.sh
source $dotfiles_location/tmuxinator/tmuxinator.zsh
export TMUXINATOR_CONFIG=$dotfiles_location/tmuxinator/projects

alias tmux="tmux -u"
alias ta="tmux a -t"
alias td="tmux detatch"
alias ts="tmux list-sessions"
alias tm="vim $dotfiles_location/tmux/tmux.conf"
alias trn="tmux rename-window $1"
alias trv="tmux select-layout even-vertical"
alias trh="tmux select-layout even-horizontal"

# Tmuxinator
alias tk="tmux kill-session -t "
alias tkk=kill_current_session
kill_current_session() {
  tmux kill-session -t $(tmux display-message -p '#S')
}

alias txs='tmuxinator start'
alias txo='tmuxinator open'
alias txn='tmuxinator new'
alias txl='tmuxinator list'



########
# PYTHON
########
alias vev="virtualenv env"
alias seba="source env/bin/activate"
alias pf="pip freeze"
alias pyclean="find . -name '**/*.pyc' -exec rm -f {} \; && find . -name '__pycache__' -exec rm -rf {} \;"
alias make_python_tags="ctags -R --fields=+l --languages=python --python-kinds=-iv -f ./tags $(python -c "import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))")"



#####
# SSH
#####
alias sshariston="ssh tom@10.0.1.3"
alias ssharistonremote="ssh tom@24.130.253.28 -p 56970"



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
