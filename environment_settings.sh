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
fi
if [[ $host == *"tcraig-m01"* ]]; then
  source $dotfiles_location/pandorarc.sh
  echo "  PANDORA ENVIRONMENT LOADED"
fi
if [[ $host == *"lebowski"* ]]; then
  source $dotfiles_location/welkin/welkinrc.sh
  echo "  WELKIN ENVIRONMENT LOADED"
fi



#####################################
# ENVIRONMENT SETTINGS (TMUX SESSION)
#####################################
if [ -n "$TMUX" ]; then
  tmux_session_name=$(tmux display-message -p '#S')
  source $dotfiles_location/tmux/project_settings.sh ${tmux_session_name}
fi
