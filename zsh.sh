# vim: set syntax=zsh
# au BufReadPost zsh.sh set ft=zsh.rc
#
# This is used by a lot of the downstream scripts as well
export DOTFILES_LOCATION="${HOME}/dotfiles"

source $DOTFILES_LOCATION/zsh_environment_settings.sh
source $DOTFILES_LOCATION/zsh_general_settings.sh
source $DOTFILES_LOCATION/zsh_omz_settings.sh
# source $DOTFILES_LOCATION/zsh_git_settings.sh
source $DOTFILES_LOCATION/tmux/zsh_tmux_settings.sh
