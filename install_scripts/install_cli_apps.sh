# Mac App Store Apps
# 'mas' installed from brew install previous
mas install $(cat mac_app_store_app_ids.txt)

# TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Vim Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# ZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Configure stuff
git config --global core.editor "vim"
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
