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

  export projects_root="~/Dropbox/TomCraig/Projects"
fi
if [[ $host == *"lebowski"* ]]; then
  source $dotfiles_location/welkin/welkinrc.sh
  export projects_root="~/dev/"
  echo "  WELKIN ENVIRONMENT LOADED"
fi


alias nn="vim $projects_root/tomcraigslist/index.md"

#####################################
# ENVIRONMENT SETTINGS (TMUX SESSION)
#####################################
if [ -n "$TMUX" ]; then
  tmux_session_name=$(tmux display-message -p '#S')
  source $dotfiles_location/tmux/project_settings.sh ${tmux_session_name}
fi
