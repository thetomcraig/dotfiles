# Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

export PATH=/opt/homebrew/bin:$PATH

brew tap jakehilborn/jakehilborn

# Brew packages
# Use the path to brew because it's not in the PATH yet
brew install $(cat brew_packages.txt)
brew install $(cat brew_cask_packages.txt)
