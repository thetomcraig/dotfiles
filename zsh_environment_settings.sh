# vim: set syntax=zsh
# au BufReadPost zsh.sh set ft=zsh.rc

# this is used a lot in "zsh_general_settings.sh"
PROJECTS_ROOT=~/.projects_root

source "${PROJECTS_ROOT}"/scripts/bash/saved_settings.sh

setColors() {
  preset_name="${1}" 

  set_saved_setting "${DOTFILES_LOCATION}"/preset_name.txt "${preset_name}"
  echo -e "\033]1337;SetColors=preset=${preset_name}\a"
  VIM_COLORSCHEME="${preset_name}"
  export VIM_COLORSCHEME="${VIM_COLORSCHEME}"

  bat_theme="GitHub"
  if [[ $preset_name == xenomorph ]]; then 
    bat_theme="base16"
  elif [[ $preset_name == seoul256-light ]]; then
    bat_theme="ansi-light"
  elif [[ $preset_name == seoul256 ]]; then
    bat_theme="zenburn"
  fi
  export BAT_THEME=$bat_theme
}
alias sc=setColors

preset_name=$(get_saved_setting "${DOTFILES_LOCATION}"/preset_name.txt)
setColors "${preset_name}"

VIM_COLORSCHEME="${preset_name}"



#########
# HOST/OS
#########
host=$(uname -a)
if [[ $host == *"Darwin"* ]]; then
  alias rm="trash"
  alias diff="diff-so-fancy"

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
export VIM_COLORSCHEME="${VIM_COLORSCHEME}"
export TMUX_SESSION_NAME="${TMUX_SESSION_NAME}"
