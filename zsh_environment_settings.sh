# vim: set syntax=zsh
# au BufReadPost zsh.sh set ft=zsh.rc

# this is used a lot in "zsh_general_settings.sh"
PROJECTS_ROOT=~/.projects_root

source "${PROJECTS_ROOT}"/scripts/bash/saved_settings.sh

setColors() {
  preset_name="${1}" 

  set_saved_setting "${DOTFILES_LOCATION}"/preset_name.txt "${preset_name}"
  echo "setting iTerm to ${preset_name}"
  echo -e "\033]1337;SetColors=preset=${preset_name}\a"

  VIM_AIRLINE_THEME="nord"
  VIM_COLORSCHEME="default"
  BAT_THEME="GitHub"
  VIM_EXTRA=""
  if [[ $preset_name == Nord ]]; then 
    VIM_COLORSCHEME="nord"
    VIM_AIRLINE_THEME="nord"
    BAT_THEME="base16"
  elif [[ $preset_name == AlienBlood ]]; then 
    VIM_COLORSCHEME="xenomorph"
    VIM_AIRLINE_THEME="xenomorph"
    BAT_THEME="base16"
  elif [[ $preset_name == seoul256 ]]; then
    BAT_THEME="base16"
    VIM_COLORSCHEME="seoul256"
  elif [[ $preset_name == gruvbox-dark ]]; then
    BAT_THEME="base16"
    VIM_COLORSCHEME="gruvbox"
  elif [[ $preset_name == seoul256-light ]]; then
    BAT_THEME="ansi-light"
    VIM_COLORSCHEME="seoul256-light"
  elif [[ $preset_name == onehalf-light ]]; then
    VIM_COLORSCHEME="default"
  elif [[ $preset_name == gotham ]]; then
    VIM_COLORSCHEME="gotham"
    BAT_THEME="ansi-dark"
  elif [[ $preset_name == ayu_light ]]; then
    VIM_COLORSCHEME="ayu"
    VIM_EXTRA='let ayucolor="light"'
  elif [[ $preset_name == alduin ]]; then
    VIM_COLORSCHEME="alduin"
    BAT_THEME='1337'
  fi
  export BAT_THEME="${BAT_THEME}"
  export VIM_COLORSCHEME="${VIM_COLORSCHEME}"
}
alias sc=setColors

preset_name=$(get_saved_setting "${DOTFILES_LOCATION}"/preset_name.txt)
setColors "${preset_name}"



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
export VIM_EXTRA="${VIM_EXTRA}"
export VIM_COLORSCHEME="${VIM_COLORSCHEME}"
export VIM_AIRLINE_THEME="${VIM_AIRLINE_THEME}"
export TMUX_SESSION_NAME="${TMUX_SESSION_NAME}"
