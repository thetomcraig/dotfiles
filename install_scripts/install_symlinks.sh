PROJECTS_ROOT="${HOME}/Dropbox/TomCraig/Projects"

# Link Files
cd "${HOME}"
DOTFILES_LOCATION="${HOME}"/dotfiles

cd ~
rm -f -- ~/.PROJECTS_ROOT
ln -s $PROJECTS_ROOT .PROJECTS_ROOT

rm -f -- ~/.zshrc
ln -s $DOTFILES_LOCATION/zsh.sh .zshrc

rm -f -- ~/.p10k.zsh
ln -s $DOTFILES_LOCATION/p10k.sh .p10k.zsh

rm -f -- ~/.vimrc
ln -s $DOTFILES_LOCATION/vim.sh .vimrc

rm -f -- ~/.vim/spell
ln -s $DOTFILES_LOCATION/.vim/spell .vim/spell

rm -f -- ~/.tmux.conf
ln -s $DOTFILES_LOCATION/tmux/tmux.conf .tmux.conf

rm -f -- ~/.phoenix.js
ln -s $DOTFILES_LOCATION/phoenix.phoenix.js .phoenix.js

rm -f -- /usr/local/bin/diff-so-fancy
ln -s $DOTFILES_LOCATION/diff-so-fancy /usr/local/bin/diff-so-fancy
