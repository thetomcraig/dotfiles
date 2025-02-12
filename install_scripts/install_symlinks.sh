#! /bin/bash

ARCH=$(../get_arch.sh)

cd "${HOME}"
DOTFILES_LOCATION="${HOME}"/dotfiles


if [[ "${ARCH}" == *"${mac}"* ]]; then
  PROJECTS_ROOT="${HOME}/Documents/Projects"
  mkdir -p ${PROJECTS_ROOT}

  rm -f -- ~/.PROJECTS_ROOT
  ln -s $PROJECTS_ROOT .projects_root
fi


rm -f -- ~/.zshrc
ln -s $DOTFILES_LOCATION/zsh.sh .zshrc

rm -f -- ~/.p10k.zsh
ln -s $DOTFILES_LOCATION/p10k.sh .p10k.zsh

rm -f -- ~/.vimrc
ln -s $DOTFILES_LOCATION/vim/vimrc.sh .vimrc

rm -f -- ~/.remarkrc.json
ln -s $DOTFILES_LOCATION/remarkrc.json .remarkrc.json

rm -f -- ~/.prettierrc.json
ln -s $DOTFILES_LOCATION/remarkrc.json .prettierrc.json

rm -f -- ~/.tigrc
ln -s $DOTFILES_LOCATION/tigrc.sh .tigrc

rm -f -- ~/.gvimrc
ln -s $DOTFILES_LOCATION/vim/gvimrc.sh .gvimrc


rm -f -- ~/.vim/spell
ln -s $DOTFILES_LOCATION/vim/spell .vim/spell

rm -f -- ~/.tmux.conf
ln -s $DOTFILES_LOCATION/tmux/tmux.conf .tmux.conf

