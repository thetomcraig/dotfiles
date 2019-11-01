# vim: set syntax=zsh
# au BufReadPost zsh.sh set ft=zsh.rc

#############################
# ENVIRONMENT SETTINGS (HOST)
#############################
host=$(uname -a)
if [[ $host == *"Darwin"* ]]; then
  alias rm="trash"
  alias cat="bat"
  alias diff="diff-so-fancy"

  export dropbox_root="~/Dropbox/TomCraig"
  export projects_root="$dropbox_root/Projects"
fi
if [[ $host == *"lebowski"* ]]; then
  source $dotfiles_location/welkin/welkinrc.sh
  export projects_root="~/dev/"
  # export dropdbs="psql -l | grep 'unittest' | awk '{split($0, a,"|"); print a[1]}' | while read name; do dropdb $name; done"
  echo "  WELKIN ENVIRONMENT LOADED"
fi



#####################################
# ENVIRONMENT SETTINGS (TMUX SESSION)
#####################################
if [ -n "$TMUX" ]; then
  tmux_session_name=$(tmux display-message -p '#S')
  source $dotfiles_location/tmux/project_settings.sh ${tmux_session_name}
fi

export wiki_root="$projects_root/tomcraigslist"
