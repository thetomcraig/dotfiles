# vim: set syntax=zsh
# au BufReadPost zsh.sh set ft=zsh.rc

# This is used by a lot of the downstream scripts as well
export dotfiles_location="${HOME}/Dotfiles"

# For macOS vs Linux, and inside vs outside a tmux session
echo "LOADING ENVIRONMENT SETTINGS..."
source $dotfiles_location/zsh_environment_settings.sh

echo "LOADING GENERAL SETTINGS..."
source $dotfiles_location/zsh_general_settings.sh
echoGreen "OK"

echo "LOADING OMZ SETTINGS..."
source $dotfiles_location/zsh_omz_settings.sh
echoGreen "OK"

echo "LOADING GIT SETTINGS..."
source $dotfiles_location/zsh_git_settings.sh
echoGreen "OK"

echo "LOADING TMUX SETTINGS..."
source $dotfiles_location/tmux/zsh_tmux_settings.sh
echoGreen "OK"

# PYTHON ALISES
echo "LOADING PYTHON SETTINGS..."
source $dotfiles_location/zsh_python_settings.sh
echoGreen "OK"

echo "INITIALIZATION COMPLETE"

# TODO - can delete this?
# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
