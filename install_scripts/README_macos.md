# Environment Installation Guide

## Origin Machine

### Misc
- Move anything from the computer desktop
- Clean up torrents
- Push any git updates to dotfiles repo
- Copy all the home folder files (Not in iCloud Drive)
- Push ublock Origin settings from host machine to cloud
- Copy macOS dictionary to dotfiles
  ```
  cp ~/Library/Group\ Containers/group.com.apple.AppleSpell/Library/Spelling/LocalDictionary $DOTFILES_LOCATION/macos_localdictionary
  ```
- Backup bookmarks

### Update Applications Lists
- Mac App Store
  - Output full list with: `mas list`
  - Paste any new application names into following command
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
- Manual/Brew Cask
  - Add missing Applications to `brew_cask_packages.txt`
  - To search: `brew search --casks <APP NAME>`

- Export VSCode settings
  `cp ~/Library/Application\ Support/Code/User/keybindings.json $DOTFILES_LOCATION/vscode_settings/keybindings.json`  
  `cp ~/Library/Application\ Support/Code/User/settings.json $DOTFILES_LOCATION/vscode_settings/settings.json`  
  `code --list-extensions > $DOTFILES_LOCATION/vscode_settings/extensions.json`
 
## Destination Machine
### Git Setup
- Set up GitHub SSH key and clone this repo  
- Disable gatekeeper
  ```
  sudo spctl --master-disable
  ```
### Application Install
- Install Homebrew Packages (This will install Xcode tools)  
  ```
    ./install_brew_packages.sh
    ```
- Install Personal programs - if on personal (non work) machine
  ```
    brew install $(cat brew_cask_packages_personal.txt)
    ```
- Install Command Line Applications
  ```
  ./install_cli_apps.sh
  ```

### Populate Necessary Base Settings
- Pass


### Settings Configuration
- Install dictionary
  ```
  cp macos_localdictionary ~/Library/Group\ Containers/group.com.apple.AppleSpell/Library/Spelling/LocalDictionary 
  ```
- Symlink Dot Files
  ```
  ./install_symlinks.sh
  ```
- Install macOS settings
  ```
  ./install_macos_settings.sh
  ```
- Restart Machine
- Install Mac App Store Apps
  ```
  ./install-mas-apps.sh
  ```

## Step Configurations
- Alfred
  - Power Pack
  - Sync Folder Location
  - Show the list view primarily with large items

- Sign into 1Password
- Start Backing up with Backblaze

- Mail
  - Turn on all Rules

- Photos
  - Preferences -> iCloud -> Download Originals to this Mac
  - Everything should be in iCloud, but make sure the size of the library on disk is correct

- Brave
  - Turn on Sync in Settings
  - Turn OFF webtorrent
  - uBlock Origin 
    - https://github.com/gorhill/uBlock/wiki/Cloud-storage

- iTerm
  - Go to Preferences -> General -> Preferences -> Load preferences...
  - And click Browse, and select the dotfiles folder
  - NOTE: this causes syncing issues - may be better to do a one-time loading

- BetterTouchTool
  - Can import the config through its UI 

- VSCode
  - Open it first to get things syncing etc, then quit it 
  `cp ./vscode_settings/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json`
  `cp ./vscode_settings/settings.json ~/Library/Application\ Support/Code/User/settings.json`  
  `cat ./vscode_settings/extensions.json | xargs -n 1 code --install-extension`  

- Install Vim Plugins

- Install TPM Plugins

- Hosts file
  - Copy contents of `for_hosts_file.txt` into `/etc/hosts`

- Add Wallpaper folder to desktop options

- NAS in Finer: `smb://ariston`

- Calibre
  - Hold down `alt` when starting, select the library fro the NAS

- Music
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

- BetterDiscord with nord theme

## Developer Tools
- NPM
  - TODO: need to get NVM setup first, then install these things globally
    ```
    prettier
    remark-cli
    remark-preset-lint-markdown-stye-guide
    remark-preset-lint-consistent
    remark-preset-lint-recommended
    remark-stringify
    ```

## Misc
- Install fonts and dicts
  - `proj && git clone git@github.com:thetomcraig/words.git`

- TODO
  - finder show items on Desktop 
  - finder show invible files
  - text size of Messages and Notes
