# Environment Installation Guide

## Decommission Origin Machine

### Misc
- [X] Move anything from the computer desktop
- [X] Clean up torrents
- [X] Push any git updates to dotfiles repo

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
      Xcode | \
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
- [ ] Install NPM Packages
  - TODO: need to get NVM setup first, then install these things globally
    ```
    prettier
    remark-cli
    remark-preset-lint-markdown-stye-guide
    remark-preset-lint-consistent
    remark-preset-lint-recommended
    remark-stringify
    ```
  - (This will install Xcode tools)
- [X] Set up Dropbox and start syncing
- [X] Install Mac App Store Apps
  ```
  ./install-mas-apps.sh
  ```
- [X] Install Dot Files
  ```
  sudo ./install_dotfiles.sh
  ```

- [x] Install macOS settings
  ```
  sudo ./install_macos_settings.sh
  ```

- [x] Restart
  
- [x] Install Command Line Applications
  
  ```
  sudo ./install_cli_apps.sh
  ```
  
- [x] Symlink Dot Files

  ```
  ./install_symlinks.sh
  ```

## Step 5: Configurations

- [x] Open Karabiner and give it permissions
- [x] TODO finder show items on Desktop 
- [x] Copy all the home folder files over from the last computer
- [x] Install fonts
  - `proj && git clone git@github.com:thetomcraig/fonts.git`
- [x] Sign into 1Password
- [x] Install backblaze from the brew installer
  - Have it start backing up

- [x] Mail
  - Turn on all Rules

- [x] Photos
  - Preferences -> iCloud -> Download Originals to this Mac
  - Everything should be in iCloud, but make sure the size of the library on disk is correct

- [x] Alfred
  - [x] Power Pack
  - [x] Sync Folder Location

- [x] Fantastical
  - Sign into Flexibits account
  - Make a new iCloud app password
  - https://appleid.apple.com/account/manage

- [ ] Brave
  - [x] Turn on Sync in Settings
    - [x] Sync everything except bookmarks and Reading list
  - [x] Turn OFF webtorrent
  - [x] X Browser Sync
  - [ ] uBlock Origin 
    - https://github.com/gorhill/uBlock/wiki/Cloud-storage

- [ ] iTerm
  - Go to Preferences -> General -> Preferences -> Load preferences...
  - And click Browse, and select the dotfiles folder
  - NOTE: this causes syncing issues - may be better to do a one-time loading

- [x] Hosts file

  - Copy contents of `for_hosts_file.txt` into `/etc/hosts`

- [x] Turn off Notifications 

- [x] Add Wallpaper folder to desktop options

- [x] NAS
  - `smb://ariston`
  - [x] Connect with finder
  - [x] Add to login item

- [x] Calibre
  - Hold down `alt` when starting, select the library fro the NAS

- [x] Music
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

- [ ] BetterDiscord, with nord theme

## Step 6: Developer Tools
- Pyenv python versions
- NVM node versions
- Conda python versions

## Step 7: Misc
- Look for newer versions of software:
  - Office, Photoshop, Fusion
