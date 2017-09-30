#########################
#MY PERSONAL BASH PROFILE
#########################
export ZSH=${HOME}/.oh-my-zsh
export LANG="en_US.UTF-8"

#export TERM=xterm-256color

ZSH_THEME="agnoster_shortened"

alias s="source $dotfiles_location/zsh.sh"
dotfiles_location="${HOME}/Dotfiles"
scripts_location="${HOME}/Dropbox/TomCraig/Scripts"

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
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=red'

alias l=my_fuzzy_ls
my_fuzzy_ls() {
	#Find files the match the fuzzy query
	ls *$1*
}

#t for tree
alias t=mytree
mytree() {
	#this does tree with 1 level
	#if no first parameter,
	#and otherwise uses the
	#supplied paramter for level depth
	tree -C -L ${1-1}
}
#T for tree 1 level deep with no invisibles
alias T="tree -a -C -L 1"
#tt for maximum depth tree
alias tt="mytree 999"
unalias d
alias d="tree -a -C -L 1 -d"

alias n=notify_func
notify_func() {
	title='Job Done'
	terminal-notifier -message $? -title $title
}

alias s='source $dotfiles_location/zsh.sh'
alias b='vim $dotfiles_location/zsh.sh'
alias g="git status"
alias ga="git add"
alias gb="git branch"
alias gba="git branch -a"
alias gv="git branch -vv"
alias gbd="git branch -d $1"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gd="git ls-files --deleted -z | xargs -0 git rm"
alias gm="git commit -m "
alias gpu="git push"
alias gpl="git pull"
alias gr="git checkout HEAD -- $1"
alias git_log="git log --graph --pretty=format:'[%h] -%d %an %cr: %s' --abbrev-commit --date=relative"
alias h="history"
alias hg="history | grep $1"
alias c="clear "
alias cpb="pwd | pbcopy"

alias tmux="tmux -u"
alias ta="tmux a -t"
alias ts="tmux ls"
alias tk="tmux kill-session -t"
alias trn="tmux rename-window $1"
alias trv="tmux select-layout even-vertical"
alias trh="tmux select-layout even-horizontal"

alias cat="ccat"

alias vev="virtualenv env"
alias seba="source env/bin/activate"
alias pf="pip freeze"
alias p="python $scripts_location/start_ipython.py"

alias b="vim $dotfiles_location/zsh.sh"
alias v="vim $dotfiles_location/vimrc.sh"
alias vu="vim $dotfiles_location/vundle_settings.sh"
alias tm="vim $dotfiles_location/tmux/tmux.conf"
alias sc="cd ${HOME}/Dropbox/TomCraig/Scripts"
alias dot="cd ${HOME}/Dotfiles"

# Media
alias mo="cd ${HOME}/Dropbox/TomCraig/Movies"
alias mu="cd ${HOME}/Dropbox/TomCraig/Music"
alias tv="cd ${HOME}/Dropbox/TomCraig/TV"

# EROS
alias E="cd ${HOME}/Dropbox/TomCraig/Projects/EROS"
alias L="cd ${HOME}/Dropbox/TomCraig/Logs"
alias LE="cd ${HOME}/Dropbox/TomCraig/Logs/EROS/"
alias wE="workon EROS"
alias erosstart="$dotfiles_location/tmux/session_scripts/eros.sh && tmux attach -t eros"
alias erostop="cd ~/Dropbox/TomCraig/Projects/EROS/"

# SSH
alias sshariston="ssh tom@10.0.1.3"

case $(uname -a) in
  (Darwin) alias rm="trash";;
  (*) ;;
esac
