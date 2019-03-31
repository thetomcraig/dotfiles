# vim: set syntax=zsh
# au BufReadPost zsh.sh set ft=zsh.rc

##############
# MY FUNCTIONS
##############
echo "LOADING GENERAL SETTINGS..."

source $dotfiles_location/my_aliases_and_functions.sh

echoGreen "  OK"




# PYTHON ALISES
alias vev="virtualenv env"
alias seba="source env/bin/activate"
alias pf="pip freeze"
alias pyclean="find . -name '*.pyc' -exec rm -f {} \; && find . -name '__pycache__' -exec rm -rf {} \;"

# SSH ALIASES
alias sshariston="ssh tom@10.0.1.3"
alias ssharistonremote="ssh tom@24.130.253.28 -p 56970"

echoGreen "  OK"

# ENVIRONMENT SETTINGS (HOST)
echo "LOADING ENVIRONMENT SETTINGS..."
source $dotfiles_location/environment_settings.sh
echoGreen "  OK"

echo "INITIALIZATION COMPLETE"
