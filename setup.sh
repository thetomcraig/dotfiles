# Download iterm themes
# vim setup - vundle
# hot key stuff, casplock disable, hammer spoon, karabiner
# Clone repo and paste
# Setup iterm to switch themes
# Alfred
# kodi
#github keys (delete old ones!)
#vim and airline themes
open https://cachefly.alfredapp.com/Alfred_3.5_876.dmg

open https://www.iterm2.com/downloads.html
git clone https://github.com/mbadolato/iTerm2-Color-Schemes.git .

open https://github.com/Hammerspoon/hammerspoon/releases/download/0.9.56/Hammerspoon-0.9.56.zip
echo "Hammerspoon Installed? "
read answer

#Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "Brew Insalled? "
read answer

#Install brew stuff
brew install vim --with-lua
brew install tmux
brew install trash
brew install tree
brew install ag
brew install wget
brew install zsh

#Setup ZSH Shell
sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh

#Install OMZ
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#Install my theme for ZSH
mv ./agnoster_shortened.zsh-theme ~/.oh-my-zsh/themes/
#Install Autosuggestions
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

#Link Files
rm ~/.zshrc
ln -s ./zsh.sh ~/.zshrc
rm ~/.vimrc
ln -s ./vim.sh ~/.vimrc
rm ~/.tmux.conf
ln -s ./.tmux.conf ~/tmux/tmux.conf
rm ~/.hammerspoon/init.lua
ln -s ./init.lua ~/.hammerspoon/init.lua

mv ./themes/alienblood/alienblood.vim /usr/local/share/vim/vim80/colors
mv ./themes/alienblood/alienblood_airline.vim ${HOME}/.vim/bundle/vim-airline/autoload/airline/themes

git clone https://github.com/powerline/powerline.git

