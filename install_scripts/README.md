# Read First
- Copy this folder to new machine

## Step 0: Setup Origin Machine
- Export bookmarks from browser
- Export Mac App Store Apps list (white listed):
  - `mas list | grep -E 'Moom|The Unarchiver|Fantastical|Amphetamine|Key Codes|Ethernet Status' | awk '{print $1}' > mac_app_store_app_ids.txt` 


## Step 1: Initial Operating System Setup
- Sign in to icloud
- Disable spotlight hotkeys
- Adjust Key repeat settings
- Adjust Trackpad settings

## Step 2: App Install
- Install these apps manually
  - - [Dropbox](https://www.dropbox.com/install#downloaded)
    - Setup and login, let is sync and continue
  - [Brave](https://laptop-updates.brave.com/latest/osx)
    - Import bookmarks
    - Set as deefault browser
    - Setup sync
    - Install CVim
      - Copy RAW URL from here: `https://gist.github.com/thetomcraig/dffaa31306bc1d5e2f5d1e91318b0055`
  - [1Password](https://1password.com/downloads/mac/)
  - [Alfred](https://www.alfredapp.com/)
  - [Karabiner](https://karabiner-elements.pqrs.org/)
  - [VLC](https://get.videolan.org/vlc/3.0.11.1/macosx/vlc-3.0.11.1.dmg)
  - [iTerm2](https://www.iterm2.com/)
    - Install Schemes
  - [Flux](https://justgetflux.com/)
  - [Typora](https://typora.io/)
  - [Transmit](https://panic.com/transmit/#download)
  - [Transmission](https://transmissionbt.com/download/)
  - [PIA](https://www.privateinternetaccess.com/installer/x/download_installer_osx)
  - [Developer tools](https://developer.apple.com/download/more/)

## Step 3: Command Line Setup
- Run 
  - `install_cli_apps.sh`

## Step 4: App Configurations
- Fantastical
  - Make a new iCloud app password
  - Sign into Flexibits account
