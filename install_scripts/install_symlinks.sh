PROJECTS_ROOT="${HOME}"

host=$(uname -a)
if [[ $host == *"ZENO"* ]]; then
  PROJECTS_ROOT="${HOME}/Dropbox/TomCraig/Projects"
else; then
  PROJECTS_ROOT="${HOME}"
fi

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

ln -s $DOTFILES_LOCATION/diff-so-fancy /usr/local/bin/diff-so-fancy

cd ~/Library/Preferences/
rm -f -- ~/Library/Preferences/com.manytricks.Moom.plist
ln -s $DOTFILES_LOCATIONtmux/gui_apps/com.manytricks.Moom.plist com.manytricks.Moom.plist
