# ARCH=$(../get_arch.sh)
source "${DOTFILES_LOCATION}/get_arch.sh"


cd "${HOME}"
DOTFILES_LOCATION="${HOME}"/dotfiles


if [[ "${ARCH}" == *"${mac}"* ]]; then
  PROJECTS_ROOT="${HOME}/Documents/Projects"
  mkdir -p ${PROJECTS_ROOT}

  rm -f -- ~/.PROJECTS_ROOT
  ln -s $PROJECTS_ROOT .projects_root

  rm -f -- ~/.phoenix.js
  ln -s $DOTFILES_LOCATION/phoenix/phoenix.js .phoenix.js

  mkdir -p .config
  mkdir -p .config/karabiner

  rm -f -- ~/.config/karabiner/karabiner.json
  ln -s $DOTFILES_LOCATION/karabiner/karabiner.json .config/karabiner/karabiner.json

fi


rm -f -- ~/.zshrc
ln -s $DOTFILES_LOCATION/zsh.sh .zshrc

rm -f -- ~/.p10k.zsh
ln -s $DOTFILES_LOCATION/p10k.sh .p10k.zsh

rm -f -- ~/.vimrc
ln -s $DOTFILES_LOCATION/vim/vimrc.sh .vimrc

#rm -f -- ~/.vim/spell
#ln -s $DOTFILES_LOCATION/vim/spell .vim/spell

rm -f -- ~/.tmux.conf
ln -s $DOTFILES_LOCATION/tmux/tmux.conf .tmux.conf


