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
if [ ! -f ${theme_file_name} ]; then
  default_theme_file_name="${tmux_dotfiles_location}/color_definitions/default.sh"
  source ${default_theme_file_name}
else
  theme_file_name="${tmux_dotfiles_location}/color_definitions/${iterm_profile_name}.sh"
  source ${theme_file_name}
fi
