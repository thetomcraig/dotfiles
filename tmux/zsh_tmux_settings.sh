alias tmux="tmux -u"
alias ta="tmux a -t"
alias td="tmux detatch"
alias tk="tmux kill-session -t "
alias ts="tmux list-sessions"
alias tm="vim $DOTFILES_LOCATION/tmux/tmux.conf"
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

TMUX_DOTFILES_LOCATION="$DOTFILES_LOCATION/tmux"
source $DOTFILES_LOCATION/tmux/tmuxinator/tmuxinator.zsh
export TMUXINATOR_CONFIG=$DOTFILES_LOCATION/tmux/tmuxinator/projects

# Load the theme!
source "${TMUX_DOTFILES_LOCATION}/color_definitions/helpers.sh"
load_colors "${ITERM_PROFILE_NAME}"



export TMUX_DOTFILES_LOCATION="${TMUX_DOTFILES_LOCATION}"
