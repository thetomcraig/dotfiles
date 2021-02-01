cd ~/dev

# My resources
git clone git@github.com:thetomcraig/scripts.git
# TODO open the files to import
git clone git@github.com:thetomcraig/iterm_schemes.git
# TODO open the files to import
git clone git@github.com:thetomcraig/fonts.git
git clone git@github.com:thetomcraig/chromium-vim.git
cd ..
git clone git@github.com:thetomcraig/dotfiles.git

# Install brew
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
