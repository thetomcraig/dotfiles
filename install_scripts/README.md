# Environment Installation Guide

## Decommission Origin Machine

### Misc
- [X] Move anything from the computer desktop
- [X] Clean up torrents
- [X] Push any git updates to dotfiles repo
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
  sudo ./install_brew_packages.sh
  ```
  - (This will install Xcode tools)
- [X] Set up Dropbox and start syncing
- [X] Install Mac App Store Apps
  ```
  sudo mas install $(cat mac_app_store_app_ids.txt)
  ```
- [X] Install Dot Files
  ```
  sudo ./install_dotfiles.sh
  ```

- [X] Symlink Dot Files
  ```
  ./install_symlinks.sh
  ```

- [X] Install macOS settings
  ```
  sudo ./install_macos_settings.sh
  ```

- [X] Install Command Line Applications
  ```
  sudo ./install_cli_apps.sh
  ```
  
## Step 5: Configurations
- [X] Copy all the home folder files over from the last computer
- [X] Install fonts from documents folder
- [X] Create nvm folder:
  - `mkdir ~/.nvm`
- [X] Copy `karabiner.json` to `${HOME}/.config/karabiner/karabiner.json`
- [X] Finder stuff
  - Go to Desktop -> View Options -> Sort By -> Name
- [X] Sign into 1Password
- [X] Homebrew
- [X] Install backblaze from the brew installer
  - Have it start backing up
- [ ] Photos
  - Preferences -> iCloud -> Download Originals to this Mac
  - Everything should be in iCloud, but make sure the size of the library on disk is correct
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
  - [X] CVim
    - (Set up nvm first)
    - [X] Install from my forked repo
    - [X] Set up settings to sync from:
      - `https://raw.githubusercontent.com/thetomcraig/dotfiles/master/vim/cvim.sh`
- [X] Transmit
- [X] iTerm
  - Go to Preferences -> General -> Preferences -> Load preferences...
  - And click Browse, and select the dotfiles folder
- [X] Hosts file
  - `sudo cat for_hosts_file.txt >> /etc/hosts`
- [X] Turn off Notifications 
- [X] Add Wallpaper folder to desktop options
- [X] NAS
  - [X] Connect with finder
  - [X] Add to login item
- [X] Calibre
  - Hold down `alt` when starting, select the library fro the NAS
- [X] Music
  1. Initial settings
    - Open Music and sign in and let iCloud stuff sync
    - Preferences -> Files 
      - Music Media folder location -> Change
        - Set to the NAS
    - Check "Keep Music Media folder organized"
    - Check Copy files to Music Media folder..."
    - Preferences -> General
      - Check "Sync Library"
      - Check "Always check for available downloads"
  2. Quit Music
  3. Replace the Music library file on disk, with the one from the old machine
  4. Hold down `alt`, open Music again, and select the new library file

## Step 6: Developer Tools
- Pyenv python versions
- NVM node versions
- Conda python versions

## Step 7: Misc
- Look for newer versions of software:
  - Office, Photoshop, Fusion
   
