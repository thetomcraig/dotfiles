#Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#Install brew stuff
brew install vim --with-lua
brew install tmux
brew install trash
brew install tree
brew install ack
brew install wget
brew install zsh

# vim setup - vundle
# hot key stuff, casplock disable, hammer spoon, karabiner
# Clone repo and paste

#Setup ZSH Shell
sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh

#Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

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

# SSH Keys
ssh-keygen -t rsa -b 4096 -C "thetomcraig@icloud.com"
eval "$(ssh-agent -s)"
echo "Host *
 AddKeysToAgent yes
 UseKeychain yes
 IdentityFile ~/.ssh/id_rsa" > ~/.ssh/config
pbcopy < ~/.ssh/id_rsa.pub
open "https://github.com/settings/keys"
# Do user stuff here

git@github.com:thetomcraig/Alienblood.git
