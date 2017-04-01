#########################
#MY PERSONAL BASH PROFILE
#########################
dotfiles_location="${HOME}/Dotfiles"
personal_scripts_location="${HOME}/Dropbox/TomCraig/Scripts/Personal"
pandora_scripts_location="${HOME}/Dropbox/TomCraig/Scripts/Pandora"

# source "/Users/tcraig/Dotfiles/shell_prompt.sh"
source "$pandora_scripts_location/slingshot_settings.sh"
ZSH_THEME="robbyrussell"


#Aliases
alias rr=my_grep
my_grep() {
	#Recursive and colorized
	echo "Directories:"
	find . -name $1
	echo "------------------------"
	echo "Files"
	grep --exclude="*.pyc" --color=always -r $1 .
}

alias l=my_fuzzy_ls
my_fuzzy_ls() {
	#Find files the match the fuzzy query
	ls *$1*
}

#My cd alias
alias cdu=mycd
mycd() {
	i=0
	while [ $i -lt ${1-1} ]
	do
		cd ..
		i=`expr $i + 1`
	done
	clear
	tree -C -L 1
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
alias d="tree -a -C -L 1 -d"

alias n=notify_func
notify_func() {
	title='Job Done'
	terminal-notifier -message $? -title $title
}

alias s='source ${HOME}/.zshrc'
alias g="git status"
alias ga="git add"
alias gb="git branch"
alias gba="git branch -a"
alias gv="git branch -vv"
alias gbd="git branch -d $1"
alias gc="git checkout"
alias gd="git ls-files --deleted -z | xargs -0 git rm"
alias gm="git commit -m "
alias gpu="git push"
alias gpl="git pull"
alias gr="git checkout HEAD -- $1"
alias h="history"
alias hg="history | grep $1"
alias c="clear "
alias cpb="pwd | pbcopy"
alias ta="tmux a -t"
alias ts="tmux ls"
alias tk="tmux kill-session -t"
alias trn="tmux rename-window $1"
alias trv="tmux select-layout even-vertical"
alias trh="tmux select-layout even-horizontal"

alias vev="virtualenv env"
alias seba="source env/bin/activate"
alias pf="pip freeze"
alias p="python $personal_scripts_location/start_ipython.py"

alias b="vim $dotfiles_location/zsh.sh"
alias v="vim $dotfiles_location/vimrc.sh"
alias vu="vim $dotfiles_location/vundle_settings.sh"
alias tm="vim $dotfiles_location/tmux.conf"
alias tms="vim $dotfiles_location/tmux_line_snapshot.conf"
# alias tom="cd ${HOME}/Dropbox/TomCraig"
alias sv="set -o vi"
alias sc="cd ${HOME}/Dropbox/TomCraig/Scripts"
alias scpa="cd ${HOME}/Dropbox/TomCraig/Scripts/Pandora"
alias scpe="cd ${HOME}/Dropbox/TomCraig/Scripts/Personal"
alias dot="cd ${HOME}/Dotfiles"

alias mo="cd ${HOME}/Dropbox/TomCraig/Movies"
alias mu="cd ${HOME}/Dropbox/TomCraig/Music"
alias tv="cd ${HOME}/Dropbox/TomCraig/TV"


#EROS
alias E="cd ${HOME}/Dropbox/TomCraig/Projects/EROS"
alias L="cd ${HOME}/Dropbox/TomCraig/Logs"
alias LE="cd ${HOME}/Dropbox/TomCraig/Logs/EROS/"
alias wE="workon EROS"
alias erosstart="$personal_scripts_location/eros_start.sh eros"
alias erostop="cd ~/Dropbox/TomCraig/Projects/EROS/"


#SSH
alias sshariston="ssh tom@10.0.1.9"

#History
#Remove duplicates
HISTCONTROL=ignoredups
#ignore same sucessive entries.
HISTCONTROL=ignoreboth
SAVEHIST=10
HISTFILE=~/.zsh_history

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
plugins=(git, zsh-autosuggestions, zsh-syntax-highlighting)
bindkey '^ ' autosuggest-accept


#Start alwaysontop
# source $dotfiles_location/alwaysontop/alwaysontop.sh > /dev/null

#Fix alwaysontop, it gets fucked up somehow
#unalwaysontop > /dev/null
#alwaysontop > /dev/null
#unautoclear > /dev/null
#autoclear > /dev/null
