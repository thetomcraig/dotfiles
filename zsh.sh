#########################
#MY PERSONAL BASH PROFILE
#########################
# Setup Zsh
export ZSH=${HOME}/.oh-my-zsh

# Get the zsh.sh pwd
# Use the pwd to load helpers
echo "LOADING GENERAL SETTINGS..."
dotfiles_location="${HOME}/Dotfiles"
source $dotfiles_location/helper_functions.sh

export LANG="en_US.UTF-8"
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
export EDITOR="/usr/local/bin/vim"
export FZF_DEFAULT_COMMAND='ag -g ""'
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
alias n="echo '$?' | terminal-notifier"
alias h="history"
alias hg="history | grep $1"
alias c="clear "
alias cpb="pwd | pbcopy"

alias v="vim $dotfiles_location/vimrc.sh"
alias vv="vim +"NERDTree $1""
alias vu="vim $dotfiles_location/vundle_settings.sh"
alias dot="cd ${HOME}/Dotfiles"

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

# GIT ALIASES AND FUNCTIONS
alias g="git status"
alias ga="git add"
alias gb="git branch"
alias gba="git branch -a"
alias gv="git branch -vv --sort=-committerdate"
alias gbd="git branch -d $1"
alias gbD="git branch -D $1"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gd="git diff"
alias gdd="git ls-files --deleted -z | xargs -0 git rm"
alias gm="git commit -m "
alias gpu="git push"
alias gpl="git pull"
alias log="git log --oneline --all --graph --decorate"

# Show detatched commits
# alias gdc=detatched_commits
# detatched_commits() {
  # git log --oneline --all --graph --decorate  $(git reflog | awk '{print $1}')
# }
# Make local branch tracking remote that matches regex
alias gg=gitbranchgrep
gitbranchgrep() {
  git pull && \
  git checkout -b ${1} $(git branch -a | grep ${2}) && \
  git branch -vv
}

# TMUX ALIASES AND FUNCTIONS
alias tmux="tmux -u"
alias ta="tmux a -t"
alias td="tmux detatch"
alias tk="tmux kill-session -t "
alias ts="tmux list-sessions "
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

#alias tmux_list_sessions="tmux l; echo $?"
#tmux_list_sessions() {
#  sessions=$(tmux ls)
#  if [[ $? == 0 ]]; then
#    echo sessions
#  fi
#}


# PYTHON ALISES
alias vev="virtualenv env"
alias seba="source env/bin/activate"
alias pf="pip freeze"

# SSH ALIASES
alias sshariston="ssh tom@10.0.1.3"

echoGreen "  OK"



# ENVIRONMENT SETTINGS
echo "LOADING ENVIRONMENT SETTINGS..."
host=$(uname -a)
if [[ $host == *"Darwin"* ]]; then
  alias rm="trash"
  alias cat="ccat"
fi
if [[ $host == *"tcraig-m01"* ]]; then
  echo "  LOADING PANDORA SETTINGS..."
  source $dotfiles_location/pandorarc.sh
fi

# TMUX SESSION
if [ -n "$TMUX" ]; then
  echo "  LOADING TMUX ENV VARS..."
  source $dotfiles_location/tmux/setup_env_vars.sh $(tmux display-message -p '#S')
fi

echoGreen "  OK"


# LOAD EXTERNAL STUFF
echo "LOADING PYENV..."
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"



echoGreen "INITIALIZATION COMPLETE"
