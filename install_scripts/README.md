# Environment Installation Guide

## Decommission Origin Machine

### Misc
- [X] Move anything from the computer desktop
- [X] Clean up torrents
- [X] Push any git updates to dotfiles repo
- [ ] Make sure projects don't have lingering commits
- [X] Copy `${HOME}/.config/karabiner/karabiner.json`

### Update Applications Lists
- [X] Mac App Store
  - Output full list with
    - `mas list`
  - Paste any new application names into following command
    - Update the following command and run it
      ```
      mas list | grep -E '
      The Unarchiver | \
      Fantastical | \
      Amphetamine | \
      Key Codes | \
      Gemini 2' \
      | awk '{print $1}' > mac_app_store_app_ids.txt
      ```
- [X] Manual/Brew Cask
  - Search Applications folder for anything not listed in:
    - `brew_cask_packages.txt`
    - OR
    - Step 3 below
  - Add missing Applications to one of these two
  - Search if brew cask installable
    - `brew search --casks <APP NAME>`

## Initial Operating System Setup (Destination Machine)
- [X] Copy this folder to new machine
  - Manually, because git isn't set up yet

## Brew Install
- [X] Install Brew Packages
  ```
  ./install_brew_packages.sh
  ```
  - (This will install Xcode tools)
- [X] Set up Dropbox and start syncing
- [X] Install Mac App Store Apps
  ```
  mas install $(cat mac_app_store_app_ids.txt)
  ```
- [X] Install Dot Files
  ```
  ./install_dotfiles.sh
  ```

- [X] Symlink Dot Files
  ```
  ./install_symlinks.sh
  ```

- [X] Install macOS settings
  ```
  ./install_macos_settings.sh
  ```

- [X] Install Command Line Applications
  ```
  ./install_cli_apps.sh
  ```
  
## Step 5: Configurations
- [ ] Copy all the home folder files over from the last computer
- [X] Create nvm folder:
  - `mkdir ~/.nvm`
- [X] Copy `karabiner.json` to `${HOME}/.config/karabiner/karabiner.json`
- [X] Sign into 1Password
- [X] Alfred
  - [X] Power Pack
  - [X] Sync Folder Location
  - [X] Turn on Clipboard syncing
- [X] Fantastical
  - Sign into Flexibits account
  - Make a new iCloud app password
- [X] Brave
  - [X] Turn on Sync in Settings
  - [X] X Browser Sync
  - [X] uBlock Origin 
    - https://github.com/gorhill/uBlock/wiki/Cloud-storage
  - [ ] CVim
    - [ ] Install from my forked repo
    - Copy RAW URL from here: `https://gist.github.com/thetomcraig/dffaa31306bc1d5e2f5d1e91318b0055`
- [X] Transmit
- [ ] iTerm
  - Go to Preferences -> General -> Preferences -> Load preferences...
  - And click Browse, and select the dotfiles folder
- [ ] Freecad
  - Flowwie's settings
- [ ] Clean my Mac
- [X] Hosts file
  - `sudo cat for_hosts_file.txt >> /etc/hosts`
- [ ] Add Ariston to the Saved servers, and connect
- Check for new versions of pirated software
  - office
  - adobe
- Other things to install
  - python conda
  - nvm
- Dim screen timeout
- dock items
- Keep desktop icons arranged
- finder sidebar items
- display sleep timeout
- show battery percentage
-disallow notifications from applications
- private-internet-access
- run with sudo

