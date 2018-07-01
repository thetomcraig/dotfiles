projects_root="~"

host=$(uname -a)
if [[ $host == *"tcraig-m01"* ]]; then
  projects_root="${HOME}/dev"
elif [[ $host == *"ZENO"* ]]; then
  projects_root="${HOME}/Dropbox/TomCraig/Projects"
elif [[ $host == *"HERMES"* ]]; then
  projects_root="${HOME}"
fi

#Link Files
#Make sure these point to actual paths
cd ..
dotfiles_location=$(pwd)
cd ~

rm -f -- .projects_root
ln -s $projects_root .projects_root
rm -f -- ~/.zshrc
ln -s $dotfiles_location/zsh.sh .zshrc
rm -f -- ~/.vimrc
ln -s $dotfiles_location/vim.sh .vimrc
rm -f -- ~/.tmux.conf
ln -s $dotfiles_locationtmux/tmux.conf .tmux.conf
rm -f -- ~/.hammerspoon/init.lua
cat "../init.lua" >> ~/.hammerspoon/init.lua
