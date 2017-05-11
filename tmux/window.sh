#!/bin/bash

source ~/dotfiles/themes/main_colors.sh

if [[ $1 == "current" ]]; then
  echo "#[fg=${TMUX_CURRENT_WINDOW_FG},bg=${TMUX_CURRENT_WINDOW_BG}] #I | #W "
else
  echo "#[fg=${TMUX_WINDOW_FG},bg=${TMUX_WINDOW_BG}] #I | #W "
fi
