# Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

export PATH=/opt/homebrew/bin:$PATH

brew tap jakehilborn/jakehilborn

# Brew packages
brew install $(cat brew_packages.txt)
brew install $(cat brew_cask_packages.txt)
