#Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install brew packages
brew install $(cat packages.txt)

# Install brew-like things
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
gem install tmuxinator

# Sudo things
sudo easy_install pip
sudo pip install virtualenv

# Vim stuff
npm install -g livedown
npm install -g eslint
npm install -g bash-language-server
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# SSH Keys
ssh-keygen -t rsa -b 4096 -C "thetomcraig@icloud.com"
eval "$(ssh-agent -s)"
echo "Host *
 AddKeysToAgent yes
 UseKeychain yes
 IdentityFile ~/.ssh/id_rsa" > ~/.ssh/config
pbcopy < ~/.ssh/id_rsa.pub
open "https://github.com/settings/keys"
echo "Paste the key into the GitHub website"

# ZSH
sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# ./agnoster_shortened.zsh-theme ~/.oh-my-zsh/themes/
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/bhilburn/powerlevel9k.git $ZSH_CUSTOM/themes/powerlevel9k


# Configure stuff
git config --global core.editor "vim"
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

# TODO
#linters
#eslint
#jsonfix
#stylelint
#tidy
#autopep8
#isort
#make sure these are all global
# git clone https://github.com/powerline/powerline.git


