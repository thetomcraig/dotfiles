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
  echo "  LOADING PANDORA SETTINGS..."
  source $dotfiles_location/pandorarc.sh
fi
if [[ $host == *"lebowski"* ]]; then
  echo "  LOADING WELKIN SETTINGS..."
  source $dotfiles_location/welkin/welkinrc.sh
fi



#####################################
# ENVIRONMENT SETTINGS (TMUX SESSION)
#####################################
if [ -n "$TMUX" ]; then
  tmux_session_name=$(tmux display-message -p '#S')
  echo "  LOADING TMUX ENVRONMENT FOR PROJECT '${tmux_session_name}'"
  source $dotfiles_location/tmux/setup_env_vars.sh ${tmux_session_name}
fi
