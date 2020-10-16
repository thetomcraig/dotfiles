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

cd ~
mkdir dev
cd dev
git clone git@github.com:thetomcraig/scripts.git
cd ..
git clone git@github.com:thetomcraig/dotfiles.git

#Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install brew packages
brew install $(cat brew_packages.txt)

# Install brew-like things
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
# node js
curl -sL install-node.now.sh | sh
# yarn
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
gem install tmuxinator

# linters
npm install -g remark


App store apps
Moom
Amphetamine
Fantastical
Transmit
2Do



# Vim stuff
npm install -g livedown
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# ./agnoster_shortened.zsh-theme ~/.oh-my-zsh/themes/
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Configure stuff
git config --global core.editor "vim"
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

# TODO
#make sure these are all global
# git clone https://github.com/powerline/powerline.git

# Install fonts
git clone https://github.com/ryanoasis/nerd-fonts.git
