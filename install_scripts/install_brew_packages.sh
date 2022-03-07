# Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Brew packages
brew install $(cat brew_packages.txt)
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew install $(cat brew_cask_packages.txt)
