#########################
#MY PERSONAL BASH PROFILE
#########################
export ZSH=${HOME}/.oh-my-zsh
scripts_location="${HOME}/Dropbox/TomCraig/Scripts"
dotfiles_location="${HOME}/Dotfiles"
export tmux_dotfiles_location="$dotfiles_location/tmux"
source $tmux_dotfiles_location/tmux_colors.sh

export LANG="en_US.UTF-8"
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv context dir)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_VIRTUALENV_BACKGROUND=green

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
#HISTCONTROL=ignoredups
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

plugins=(git, zsh-autosuggestions)
setopt auto_cd
bindkey '^j' autosuggest-accept
DISABLE_AUTO_TITLE=true

source $ZSH/oh-my-zsh.sh

alias s="source $dotfiles_location/zsh.sh"
alias ctags="`brew --prefix`/bin/ctags"

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
alias s='source $dotfiles_location/zsh.sh'
alias b='vim $dotfiles_location/zsh.sh'
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
alias detatched_commits="git log --oneline --all --graph --decorate  $(git reflog | awk '{print $1}')"
alias log="git log --oneline --all --graph --decorate"
alias gg=gitbranchgrep
gitbranchgrep() {
  git pull && \
  git checkout -b ${1} $(git branch -a | grep ${2}) && \
  git branch -vv
}


alias vc="vim $($scripts_location/get_conflicted_files.sh)"
alias h="history"
alias hg="history | grep $1"
alias c="clear "
alias cpb="pwd | pbcopy"

alias tmux="tmux -u"
alias ta="tmux a -t"
alias ts="tmux ls"
alias td="tmux detatch"
alias tk="tmux kill-session -t"
alias tk="tmux kill-session -t $(tmux display-message -p '#S')"
alias trn="tmux rename-window $1"
alias trv="tmux select-layout even-vertical"
alias trh="tmux select-layout even-horizontal"

alias vev="virtualenv env"
alias seba="source env/bin/activate"
alias pf="pip freeze"
alias p="python $scripts_location/start_ipython.py"

alias b="vim $dotfiles_location/zsh.sh"
alias v="vim $dotfiles_location/vimrc.sh"
alias vv="vim +"NERDTree $1""
alias vu="vim $dotfiles_location/vundle_settings.sh"
alias tm="vim $dotfiles_location/tmux/tmux.conf"
alias sc="cd ${HOME}/Dropbox/TomCraig/Scripts"
alias dot="cd ${HOME}/Dotfiles"

# Media
alias mo="cd ${HOME}/Dropbox/TomCraig/Movies"
alias mu="cd ${HOME}/Dropbox/TomCraig/Music"
alias tv="cd ${HOME}/Dropbox/TomCraig/TV"

alias launch="$dotfiles_location/launch_projects.sh"

# SSH
alias sshariston="ssh tom@10.0.1.3"

export FZF_DEFAULT_COMMAND='ag -g ""'

host=$(uname -a)
if [[ $host == *"Darwin"* ]]; then
    alias rm="trash"
    alias cat="ccat"
fi
# Quick commands to sync CWD between terminals.
pin() {
  rm -f ~/.pindir
  echo $PWD >~/.pindir
  chmod 0600 ~/.pindir >/dev/null 2>&1
}
pout() {
  cd `cat ~/.pindir`
}

eval $(thefuck --alias)

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
