sudo xcodebuild -license

# SSH Keys
ssh-keygen -t rsa -b 4096 -C "thetomcraig@icloud.com"
eval "$(ssh-agent -s)"
echo "Host *
 AddKeysToAgent yes
 UseKeychain yes
 IdentityFile ~/.ssh/id_rsa" > ~/.ssh/config
pbcopy < ~/.ssh/id_rsa.pub
open "https://github.com/settings/keys/new"
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
brew install --HEAD universal-ctags/universal-ctags/universal-ctags

# Mac App Store Apps
# 'mas' from brew install previous
mas install $(cat mac_app_store_app_ids.txt)

# node js
curl -sL install-node.now.sh | sh
# yarn
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo gem install tmuxinator

# Vim stuff
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# ZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Configure stuff
git config --global core.editor "vim"
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

# TODO
# keyrepeat on hold?

# Install fonts
git clone https://github.com/ryanoasis/nerd-fonts.git
