# Environment Installation Guide

## Decommission Origin Machine

### Misc
- [X] Move anything from the computer desktop
- [ ] Clean up torrents
- [X] Push any git updates to dotfiles repo
- [ ] Make sure projects don't have lingering commits

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
- [ ] Copy this folder to new machine
  - Manually, because git isn't set up yet
- [ ] Sign in to icloud

## Brew Install
- [ ] Install Brew Packages
  ```
  cd dotfiles
  ./install_brew_packages.sh
  ```
- [ ] Install Dot files
  ```
  cd ${HOME}
  git clone git@github.com:thetomcraig/dotfiles.git
  ```

- [ ] Install Command Line Applications
  ```
  cd dotfiles
  ./install_cli_apps.sh
  ```

- [ ] Symlink Dot Files
  ```
  ./install_symlinks.sh
  ```

- [ ] Install macOS settings
  ```
  ./install_macos_settings.sh
  ```
  
## Step 5: App Configurations
- [ ] Fantastical
  - Make a new iCloud app password
  - Sign into Flexibits account
- [ ] iTerm
  - Schemes
- [ ] Brave
  - Bookmarks
  - Set as default browser
  - Sync
  - uBlock Origin 
    - CVim
      - Copy RAW URL from here: `https://gist.github.com/thetomcraig/dffaa31306bc1d5e2f5d1e91318b0055`
- [ ] Transmit
- [ ] Freecad
  - Flowwie's settings
- login items
- Check for new versions of pirated software
  - office
  - adobe
