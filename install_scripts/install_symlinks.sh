projects_root="${HOME}"

host=$(uname -a)
if [[ $host == *"tcraig-m01"* ]]; then
  projects_root="${HOME}/dev"
elif [[ $host == *"ZENO"* ]]; then
  projects_root="${HOME}/Dropbox/TomCraig/Projects"
elif [[ $host == *"HERMES"* ]]; then
  projects_root="${HOME}"
else
   projects_root="${HOME}"
fi

# Link Files
cd "${HOME}"
dotfiles_location="${HOME}"/dotfiles

cd ~
rm -f -- ~/.projects_root
ln -s $projects_root .projects_root

rm -f -- ~/.editorconfig
ln -s $dotfiles_location/editorconfig.sh .editorconfig

rm -f -- ~/.zshrc
ln -s $dotfiles_location/zsh.sh .zshrc

rm -f -- ~/.vimrc
ln -s $dotfiles_location/vim.sh .vimrc

rm -f -- ~/.vim/spell
ln -s $dotfiles_location/.vim/spell .vim/spell

rm -f -- ~/.tmux.conf
ln -s $dotfiles_location/tmux/tmux.conf .tmux.conf

ln -s $dotfiles_location/diff-so-fancy /usr/local/bin/diff-so-fancy

cd ~/Library/Preferences/
rm -f -- ~/Library/Preferences/com.manytricks.Moom.plist
ln -s $dotfiles_locationtmux/gui_apps/com.manytricks.Moom.plist com.manytricks.Moom.plist
