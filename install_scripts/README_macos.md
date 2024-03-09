# Environment Installation Guide

## Origin Machine

### Misc
- Move anything from the computer desktop
- Clean up torrents
- Push any git updates to dotfiles repo
- Copy all the home folder files (Not in icloud Drive)

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

### Settings
- VSCode
- BetterTouchTool

## Destination Machine
### Git Setup
- Set up GitHub SSH key and clone this repo  

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

### Settings Configuration
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

- BetterTouchTool
  - Open then quit it
  - Then copy over settings

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