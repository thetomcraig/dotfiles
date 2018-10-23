projects_root="~"

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
cd ..
dotfiles_location=$(pwd)

cd ~
rm -f -- ~/.projects_root
ln -s $projects_root .projects_root
rm -f -- ~/.editorconfig
ln -s $dotfiles_location/editorconfig.sh .projects_root
rm -f -- ~/.zshrc
ln -s $dotfiles_location/zsh.sh .zshrc
rm -f -- ~/.vimrc
ln -s $dotfiles_location/vim.sh .vimrc
rm -f -- ~/.vim/spell
ln -s $dotfiles_location/.vim/spell .vim/spell
rm -f -- ~/.tmux.conf
ln -s $dotfiles_locationtmux/tmux.conf .tmux.conf

cd ~/Library/Preferences/
rm -f -- ~/Library/Preferences/com.manytricks.Moom.plist
ln -s $dotfiles_locationtmux/gui_apps/com.manytricks.Moom.plist com.manytricks.Moom.plist
