# vim: set syntax=zsh
# au BufReadPost zsh.sh set ft=zsh.rc


#########################
#MY PERSONAL BASH PROFILE
#########################
DIR=$(dirname $(readlink "${HOME}/.zshrc"))
# Setup Zsh
export ZSH=${HOME}/.oh-my-zsh

# Get the zsh.sh pwd
# Use the pwd to load helpers
echo "LOADING GENERAL SETTINGS..."
export dotfiles_location="${HOME}/Dotfiles"
source $dotfiles_location/helper_functions.sh
source "${DIR}/git_bash_utilities.sh"

export LANG="en_US.UTF-8"
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
export EDITOR="/usr/local/bin/vim"
export FZF_DEFAULT_COMMAND='rg --files'
# export FZF_DEFAULT_COMMAND="find -L * -path '*/\.*' -prune -o -type f -print -o -type l -print 2> /dev/null"
echoGreen "  OK"



# ZSH STUFF
echo "LOADING ZSH..."
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv context dir)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_VIRTUALENV_BACKGROUND=green

plugins=(git, zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
echoGreen "  OK"



echo "CONFIGURING ZSH..."
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

bindkey '^j' autosuggest-accept
setopt auto_cd
DISABLE_AUTO_TITLE=true

# TODO, wtf?
tmux_dotfiles_location="$dotfiles_location/tmux"
export tmux_dotfiles_location
source $tmux_dotfiles_location/tmux_colors.sh
source $dotfiles_location/tmuxinator/tmuxinator.zsh
export TMUXINATOR_CONFIG=$dotfiles_location/tmuxinator/projects
echoGreen "  OK"



# GENERAL ALIASES
echo "LOADING ALIASES AND FUNCTIONS..."
alias ctags="`brew --prefix`/bin/ctags"
alias make_python_tags="ctags -R --fields=+l --languages=python --python-kinds=-iv -f ./tags $(python -c "import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))")"
alias h="history"
alias hg="history | grep $1"
alias c="clear "
alias cpb="pwd | pbcopy"

alias v="vim $dotfiles_location/vim/vimrc.sh"
alias vu="vim $dotfiles_location/vundle_settings.sh"
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
unalias d
alias d="tree -a -C -L 1 -d"
alias s="source $dotfiles_location/zsh.sh"
alias b="vim $dotfiles_location/zsh.sh"



# TMUX ALIASES AND FUNCTIONS
alias tmux="tmux -u"
alias ta="tmux a -t"
alias td="tmux detatch"
alias tk="tmux kill-session -t "
alias ts="tmux list-sessions"
alias tm="vim $dotfiles_location/tmux/tmux.conf"
alias trn="tmux rename-window $1"
alias trv="tmux select-layout even-vertical"
alias trh="tmux select-layout even-horizontal"

alias txs='tmuxinator start'
alias txo='tmuxinator open'
alias txn='tmuxinator new'
alias txl='tmuxinator list'

alias tkk=kill_current_session
kill_current_session() {
  tmux kill-session -t $(tmux display-message -p '#S')
}



# PYTHON ALISES
alias vev="virtualenv env"
alias seba="source env/bin/activate"
alias pf="pip freeze"
alias pyclean="find . -name '*.pyc' -exec rm -f {} \; && find . -name '__pycache__' -exec rm -rf {} \;"

# SSH ALIASES
alias sshariston="ssh tom@10.0.1.3"
alias ssharistonremote="ssh tom@24.130.253.28 -p 56970"

echoGreen "  OK"



# ENVIRONMENT SETTINGS
echo "LOADING ENVIRONMENT SETTINGS..."
host=$(uname -a)
if [[ $host == *"Darwin"* ]]; then
  alias rm="trash"
  alias cat="bat"
  alias diff="diff-so-fancy"
fi
if [[ $host == *"tcraig-m01"* ]]; then
  echo "  LOADING PANDORA SETTINGS..."
  source $dotfiles_location/pandorarc.sh
fi
if [[ $host == *"lebowski"* ]]; then
  echo "  LOADING WELKIN SETTINGS..."
  source $dotfiles_location/welkin/welkinrc.sh
fi

# TMUX SESSION
if [ -n "$TMUX" ]; then
  echo "  LOADING TMUX ENV VARS..."
  source $dotfiles_location/tmux/setup_env_vars.sh $(tmux display-message -p '#S')
fi

echoGreen "  OK"


alias lattice="git log  --pretty=format:"%s" --since=7.days --abbrev-commit --author="Tom Craig""

alias notes="cd ${HOME}/notes && vim -c 'NERDTree'"

echoGreen "INITIALIZATION COMPLETE"
