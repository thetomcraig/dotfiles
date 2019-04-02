# PYTHON ALISES
alias vev="virtualenv env"
alias seba="source env/bin/activate"
alias pf="pip freeze"
alias pyclean="find . -name '**/*.pyc' -exec rm -f {} \; && find . -name '__pycache__' -exec rm -rf {} \;"
alias make_python_tags="ctags -R --fields=+l --languages=python --python-kinds=-iv -f ./tags $(python -c "import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))")"
