alias tmux="tmux -2"
alias tmux="tmux -u"
alias ta="tmux a -t"
alias td="tmux detatch"
alias tk="tmux kill-session -t "
alias ts="tmux list-sessions"
alias tm="vim $DOTFILES_LOCATION/tmux/tmux.conf"
alias trn="tmux rename-window $1"
alias trv="tmux select-layout even-vertical"
alias trh="tmux select-layout even-horizontal"
alias to=tmux_only_window
tmux_only_window() {
  # Close all other windows,
  # only keep the current one
  while tmux next-window 2> /dev/null; do
      tmux kill-window
  done
}

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
export TMUX_DOTFILES_LOCATION="${TMUX_DOTFILES_LOCATION}"
