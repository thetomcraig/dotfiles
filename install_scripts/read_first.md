# Read First
- Copy this folder to new machine

## On Main Machine
- Export bookmarks from browser
- Export Mac App Store Apps list (white listed):
  - `mas list | grep -E 'Moom|The Unarchiver|Fantastical|Amphetamine|Key Codes|Ethernet Status' | awk '{print $1}' > mac_app_store_app_ids.txt` 


## OS Stuff
- Sign in to icloud
- Disable spotlight hotkeys
- Adjust Key repeat settings
- Adjust Trackpad settings

## Apps
- [Dropbox](https://www.dropbox.com/install#downloaded)
  - Setup and login, let is sync and continue
- [Brave](https://laptop-updates.brave.com/latest/osx)
  - Import bookmarks
  - Set as deefault browser
- [1Password](https://1password.com/downloads/mac/)
- [Alfred](https://www.alfredapp.com/)
- [Karabiner](https://karabiner-elements.pqrs.org/)
- [iTerm2](https://www.iterm2.com/)
- [Flux](https://justgetflux.com/)
- [Typora](https://typora.io/)
- [Transmit](https://panic.com/transmit/#download)
- [Transmission](https://transmissionbt.com/download/)
- [Developer tools](https://developer.apple.com/download/more/)

## Command Line Stuff
- Run 
  - `install_cli_apps.sh`
