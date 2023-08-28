# vim: set syntax=zsh
# au BufReadPost zsh.sh set ft=zsh.rc
#
# This is used by a lot of the downstream scripts as well
export DOTFILES_LOCATION="${HOME}/dotfiles"

printf "Loading env settings... "
source $DOTFILES_LOCATION/zsh_environment_settings.sh
printf "Done"
source $DOTFILES_LOCATION/zsh_general_settings.sh
source $DOTFILES_LOCATION/zsh_omz_settings.sh
source $DOTFILES_LOCATION/zsh_git_settings.sh
source $DOTFILES_LOCATION/zsh_python_settings.sh
source $DOTFILES_LOCATION/tmux/zsh_tmux_settings.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
