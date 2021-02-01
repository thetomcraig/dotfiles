# vim: set syntax=zsh
# au BufReadPost zsh.sh set ft=zsh.rc

# this is used a lot in "zsh_general_settings.sh"
PROJECTS_ROOT=~/.projects_root


# START testing switch_theme 
# switch_theme_location=${PROJECTS_ROOT}/scripts/bash/switch_theme/switch_theme.sh
# Make the functions available
# source "${switch_theme_location}"
# shellInit
# alias ST="setThemeVariables"
# alias STL="listThemes"
# ENDtesting switch_theme



#########
# HOST/OS
#########
host=$(uname -a)
if [[ $host == *"Darwin"* ]]; then
  alias rm="trash"
  # alias diff="diff-so-fancy"

  DROPBOX_ROOT="${HOME}/Dropbox/TomCraig"
fi



##################
# TMUX ENVIRONMENT
##################
if [ -n "$TMUX" ]; then
  TMUX_SESSION_NAME=$(tmux display-message -p '#S')
  PROJECT_ROOT="${PROJECTS_ROOT}/${TMUX_SESSION_NAME}"
  # If there is an associate settings file, load it  
  settings_file="${PROJECT_ROOT}/.tmux_settings.sh"
  if [ -f "$settings_file" ]; then
    source "${settings_file}"
  fi
fi



export DROPBOX_ROOT="${DROPBOX_ROOT}"
export PROJECT_ROOT="${PROJECT_ROOT}"
export PROJECTS_ROOT="${PROJECTS_ROOT}"
export VIM_EXTRA="${VIM_EXTRA}"
export VIM_COLORSCHEME="${VIM_COLORSCHEME}"
export VIM_AIRLINE_THEME="${VIM_AIRLINE_THEME}"
export TMUX_SESSION_NAME="${TMUX_SESSION_NAME}"



eval "$(rbenv init -)"
export PATH="/usr/local/sbin:$PATH"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NODE_PATH=$(npm root -g)
export PATH="$NODE_PATH:$PATH"
export PATH="${HOME}/Library/Python/3.7/$PATH"

eval "$(chit shell-init)"
cs() {
  chit set-theme "${1}"
  # Reload bash environment variables
  eval "$(chit export-env-vars)"
  if [ -n "$TMUX" ]; then
    # Reload tmux environment variables
    tmux source-file ~/.tmux.conf
  fi
}
