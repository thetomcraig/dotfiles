PROJECTS_ROOT="${HOME}"
# TODO do a mkdir with this
notes_root="${HOME}/notes"

host=$(uname -a)
if [[ $host == *"ZENO"* ]]; then
  PROJECTS_ROOT="${HOME}/Dropbox/TomCraig/Projects"
elif [[ $host == *"HERMES"* ]]; then
  PROJECTS_ROOT="${HOME}"
elif [[ $host == *"lebowski"* ]]; then
  PROJECTS_ROOT="${HOME}/dev"
else
   PROJECTS_ROOT="${HOME}"
fi

# Link Files
cd "${HOME}"
DOTFILES_LOCATION="${HOME}"/dotfiles

cd ~
rm -f -- ~/.PROJECTS_ROOT
ln -s $PROJECTS_ROOT .PROJECTS_ROOT

rm -f -- ~/.editorconfig
ln -s $DOTFILES_LOCATION/editorconfig.sh .editorconfig

rm -f -- ~/.zshrc
ln -s $DOTFILES_LOCATION/zsh.sh .zshrc

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
