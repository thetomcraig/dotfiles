# Environment Installation Guide

## Packages Install
- Install Apt Packages
  ```
  sudo apt update
  sudo ./install_apt_packages.sh
  ```
  
- Compile vim with clipboard support
  ```
  sudo apt remove vim vim-runtime gvim vim-tiny vim-common vim-gui-common

  ```
- Install Dot Files
  ```
  sudo ./install_dotfiles.sh
  ```

- Install Command Line Applications
  ```
  sudo ./install_cli_apps.sh
  ```

- Symlink Dot Files
  ```
  sudo ./install_symlinks.sh
  ```



## Developer Tools
- Pyenv python versions
- NVM node versions
- Conda python versions
