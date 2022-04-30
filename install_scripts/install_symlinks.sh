PROJECTS_ROOT="${HOME}/Documents/Projects"

# Link Files
cd "${HOME}"
DOTFILES_LOCATION="${HOME}"/dotfiles

rm -f -- ~/.PROJECTS_ROOT
ln -s $PROJECTS_ROOT .projects_root

rm -f -- ~/.zshrc
ln -s $DOTFILES_LOCATION/zsh.sh .zshrc

rm -f -- ~/.p10k.zsh
ln -s $DOTFILES_LOCATION/p10k.sh .p10k.zsh

rm -f -- ~/.vimrc
ln -s $DOTFILES_LOCATION/vim/vimrc.sh .vimrc

rm -f -- ~/.vim/spell
ln -s $DOTFILES_LOCATION/vim/spell .vim/spell

rm -f -- ~/.tmux.conf
ln -s $DOTFILES_LOCATION/tmux/tmux.conf .tmux.conf

rm -f -- ~/.phoenix.js
ln -s $DOTFILES_LOCATION/phoenix/phoenix.js .phoenix.js

rm -f -- ~/.config/karabiner/karabiner.json
ln -s $DOTFILES_LOCATION/karabiner/karabiner.json .config/karabiner/karabiner.json

rm -f -- ~/Library/Preferences/FreeCAD/system.cfg
ln -s $DOTFILES_LOCATION/freecad/system.cfg ~/Library/Preferences/FreeCAD/system.cfg

rm -f -- ~/Library/Preferences/FreeCAD/user.cfg
ln -s $DOTFILES_LOCATION/freecad/user.cfg ~/Library/Preferences/FreeCAD/user.cfg
