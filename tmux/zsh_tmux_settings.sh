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

tmux_dotfiles_location="$dotfiles_location/tmux"
export tmux_dotfiles_location
source $dotfiles_location/tmux/tmuxinator/tmuxinator.zsh
export TMUXINATOR_CONFIG=$dotfiles_location/tmux/tmuxinator/projects

# Load the theme!
iterm_profile_name=$(osascript $dotfiles_location/get_iterm_profile_name.scpt)
tmux_color_file="${tmux_dotfiles_location}/color_definitions/${iterm_profile_name}.sh"
if ! $(ls $tmux_color_file); then
  tmux_color_file="${tmux_dotfiles_location}/color_definitions/default.sh"
fi
echo $tmux_color_file
source $tmux_color_file
