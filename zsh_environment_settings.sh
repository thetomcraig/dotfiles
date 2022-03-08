# vim: set syntax=zsh
# au BufReadPost zsh.sh set ft=zsh.rc

# this is used a lot in "zsh_general_settings.sh"
PROJECTS_ROOT=~/.projects_root



#########
# HOST/OS
#########
host=$(uname -a)
if [[ $host == *"Darwin"* ]]; then
  alias rm="trash"
  DROPBOX_ROOT="${HOME}/Dropbox/TomCraig"
fi


#########
# SERVERS 
#########
alias sshariston="ssh tom@ariston"
# alias ssharistonremote="ssh tom@24.130.253.28 -p 56970"
alias sshjuno="ssh pi@juno"



########
# CHIT #
########
eval "$(chit shell-init)"
# cs() {
  # chit set-theme "${1}"
  # eval "$(chit export-env-vars)"
  # if [ -n "$TMUX" ]; then
    # Reload tmux environment variables
  # tmux source-file ~/.tmux.conf
  # fi
# }
cs() {
  chit set-theme "${1}"
  eval "$(chit export-env-vars)"
}



###################
# EXPORT ENV VARS #
###################
export DROPBOX_ROOT="${DROPBOX_ROOT}"
export PROJECTS_ROOT="${PROJECTS_ROOT}"
export VIM_EXTRA="${VIM_EXTRA}"
export VIM_COLORSCHEME="${VIM_COLORSCHEME}"
export VIM_AIRLINE_THEME="${VIM_AIRLINE_THEME}"
export TMUX_SESSION_NAME="${TMUX_SESSION_NAME}"



##################
# PATH AND HOOKS #
##################
# BREW
export PATH=/opt/homebrew/bin:$PATH

# PYENV
eval "$(pyenv init --path)"

# PYENV VIRTUALENV
eval "$(pyenv virtualenv-init -)"

# RBENV
eval "$(rbenv init -)"
export PATH="/usr/local/sbin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# AVR GCC (QMK)
export PATH="/usr/local/opt/avr-gcc@8/bin:$PATH"

eval "$(direnv hook zsh)"


# NEEDED???
#export NODE_PATH=$(npm root -g)
#export PATH="$NODE_PATH:$PATH"
#export PATH="${HOME}/Library/Python/3.7/$PATH"
