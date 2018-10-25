export WELKIN_ROOT="${HOME}/dev/welkin"
export WELKIN_VIRTUALENV_PATH="${HOME}/dev/welkin_2_7_env/"
export CONFIG='dev.ini'

alias envactivate="source $WELKIN_VIRTUALENV_PATH/bin/activate"
alias enter_welkin_env="cd $WELKIN_ROOT; envactivate"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

