# PYTHON ALISES
alias vev="virtualenv env"
alias seba="source env/bin/activate"
alias pf="pip freeze"
alias pyclean="git clean -fd && find . -name '*.pyc' | xargs rm && find . -name '__pycache__' | xargs rm -rf"
alias make_python_tags="ctags -R --fields=+l --languages=python --python-kinds=-iv -f ./tags $(python -c "import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))")"

# This conflicts with pyenv
# I removed the part that manpultes the path,
# Instead I manually edited the PATH in the direnv file
# Hopefully, nobody else will have to do this shit

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/tom/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
fi
unset __conda_setup
# <<< conda initialize <<<
