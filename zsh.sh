# vim: set syntax=zsh
# au BufReadPost zsh.sh set ft=zsh.rc


export dotfiles_location="${HOME}/Dotfiles"

echo "LOADING GENERAL SETTINGS..."
source $dotfiles_location/general_settings.sh
echoGreen "OK"

echo "LOADING OMZ SETTINGS..."
source $dotfiles_location/omz_settings.sh
echoGreen "OK"

echo "LOADING GIT SETTINGS..."
source $dotfiles_location/git_settings.sh
echoGreen "OK"

echo "LOADING TMUX SETTINGS..."
source $dotfiles_location/tmux_settings.sh
echoGreen "OK"

# ENVIRONMENT SETTINGS
echo "LOADING ENVIRONMENT SETTINGS..."
source $dotfiles_location/environment_settings.sh
echoGreen "OK"

# PYTHON ALISES
echo "LOADING PYTHON SETTINGS..."
source $dotfiles_location/python_settings.sh
echoGreen "OK"

echo "INITIALIZATION COMPLETE"
