#!/bin/bash

# Apt Packages Install

packages=(
	ack
	ag
	bat
	ctags
	diff-so-fancy
	exa
	fzf
	git
	jq
	nvm
	poetry
	rbenv
	ripgrep
	shellcheck
	tmux
	tmuxinator
	vim
	wget
	zsh
)

sudo apt udpate

for package in "${packages[@]}"; do
    sudo apt-get install -y "$package"
done

chsh -s $(which zsh)

curl https://pyenv.run | bash

git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv

curl -sfL https://direnv.net/install.sh | bash

