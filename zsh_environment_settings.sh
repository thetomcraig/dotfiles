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
local PROJECTS_ROOT="$DROPBOX_ROOT/Projects"



###################
# iTERM ENVIRONMENT
###################
ITERM_PROFILE_NAME=$(osascript $dotfiles_location/get_iterm_profile_name.scpt)
export VIM_COLORSCHEME="${iterm_profile_name}"




##################
# TMUX ENVIRONMENT
##################
if [ -n "$TMUX" ]; then
  TMUX_SESSION_NAME=$(tmux display-message -p '#S')
  PROJECT_ROOT="${HOME}/.${PROJECTS_ROOT}/${TMUX_SESSION_NAME}"
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
# TODO: grep and replace with caps
export dropbox_root="${DROPBOX_ROOT}"
# TODO: grep and replace these two
export PROJECT_ROOT="${PROJECT_ROOT}"
export PROJECTS_ROOT="${PROJECTS_ROOT}"
export VIM_COLORSCHEME="${VIM_COLORSCHEME}"
echo $VIM_COLORSCHEME
export TMUX_SESSION_NAME="${TMUX_SESSION_NAME}"
