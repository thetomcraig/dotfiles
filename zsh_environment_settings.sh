# vim: set syntax=zsh
# au BufReadPost zsh.sh set ft=zsh.rc
 


#########
# HOST/OS
#########
host=$(uname -a)
if [[ $host == *"Darwin"* ]]; then
  alias rm="trash"
  alias cat="bat"
  alias diff="diff-so-fancy"

  DROPBOX_ROOT="${HOME}/Dropbox/TomCraig"
fi

# this is used a lot in "zsh_general_settings.sh"
PROJECTS_ROOT=~/.projects_root



###################
# iTERM ENVIRONMENT
###################
ITERM_PROFILE_NAME=$(osascript ${DOTFILES_LOCATION}/get_iterm_profile_name.scpt)
VIM_COLORSCHEME="${ITERM_PROFILE_NAME}"



##################
# TMUX ENVIRONMENT
##################
if [ -n "$TMUX" ]; then
  TMUX_SESSION_NAME=$(tmux display-message -p '#S')
  PROJECT_ROOT="${PROJECTS_ROOT}/${TMUX_SESSION_NAME}"
  alias rr="cd ${PROJECT_ROOT}"
  alias root="cd ${PROJECT_ROOT}"
  # If there is an associate settings file, load it  
  settings_file="${PROJECT_ROOT}/.tmux_settings.sh"
  if [ -f "$settings_file" ]; then
    source "${settings_file}"
  fi
fi



export ITERM_PROFILE_NAME="${ITERM_PROFILE_NAME}"
export DROPBOX_ROOT="${DROPBOX_ROOT}"
export PROJECT_ROOT="${PROJECT_ROOT}"
export PROJECTS_ROOT="${PROJECTS_ROOT}"
export VIM_COLORSCHEME="${VIM_COLORSCHEME}"
export TMUX_SESSION_NAME="${TMUX_SESSION_NAME}"
