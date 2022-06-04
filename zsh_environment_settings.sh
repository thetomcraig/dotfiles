# vim: set syntax=zsh
# au BufReadPost zsh.sh set ft=zsh.rc

# this is used a lot in "zsh_general_settings.sh"
PROJECTS_ROOT=~/.projects_root


in_linux=false
in_macos=false
case "$(uname -s)" in
   Darwin)
     in_macos=true

     intel_mac=false
     arm_mac=false
     case "$(uname -m)" in
       x86_64)
         intel_mac=true
         ;;
       arm64)
         arm_mac=true
         ;;
     esac

     ;;
   Linux)
     in_linux=true
     ;;
esac


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
export PATH=/opt/homebrew/sbin:$PATH

if $in_macos; then
  # PYENV
  eval "$(pyenv init --path)"
  # PYENV VIRTUALENV
  eval "$(pyenv virtualenv-init -)"
  # RBENV
  eval "$(rbenv init -)"
fi

if $in_linux; then
  # PYENV
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  # RBENV
  export PATH=$HOME/.rbenv/bin:$PATH
fi

if $in_macos; then
  export PATH="/usr/local/sbin:$PATH"

  # NVM
  if $intel_mac; then
    export NVM_DIR="$HOME/.nvm"
      [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
      [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
  else
    export NVM_DIR="$HOME/.nvm"
      [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
      [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
  fi

  # AVR GCC (QMK)
  export PATH="/usr/local/opt/avr-gcc@8/bin:$PATH"
fi

eval "$(direnv hook zsh)"



if $in_macos; then
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
fi
