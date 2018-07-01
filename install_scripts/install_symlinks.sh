project_root="~"
if [[ $host == *"tcraig-m01"* ]]; then
  project_root="${HOME}/dev"
elif [[ $host == *"ZENO"* ]]; then
  project_root="${HOME}/Dropbox/TomCraig/Projects"
elif [[ $host == *"HERMES"* ]]; then
  project_root="${HOME}"
fi
if [ ! -f ~/.project_root ]; then
  ln -s $project_root ~/.project_root
fi

#Link Files
#Make sure these point to actual paths
rm ~/.zshrc
ln -s ../zsh.sh ~/.zshrc
rm ~/.vimrc
ln -s ../vim.sh ~/.vimrc
rm ~/.tmux.conf
ln -s ../tmux/tmux.conf ~/.tmux.conf
rm ~/.hammerspoon/init.lua
cat "../init.lua" >> ~/.hammerspoon/init.lua

