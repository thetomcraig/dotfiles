# For reference: https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# https://github.com/ulwlu/dotfiles/blob/master/system/macos.sh
# https://macos-defaults.com/?



# NSDOMAIN
# Save to disk (not to iCloud) by default
defaults write NSDomain NSDocumentSaveNewDocumentsToCloud -bool false



# GLOBAL DOMAIN
# Green accent color
defaults write .GlobalPreferences AppleAccentColor -int 3
defaults write .GlobalPreferences AppleHighlightColor -string "0.752941 0.964706 0.678431 Green"

# Disable gatekeeper
sudo spctl --master-disable

# Show bars when scrolling
defaults write .GlobalPreferences AppleShowScrollBars -string "WhenScrolling"

# Click bar to jump to the spot that's clicked
defaults write NSGlobalDomain AppleScrollerPagingBehavior -int 1

# Prefer tabs when opening documents
defaults write .GlobalPreferences AppleWindowTabbingMode -string "always"

# Double-click a window's title bar to minimize
defaults write .GlobalPreferences AppleActionOnDoubleClick -string "Minimize"

# When switching to an application, switch to a Space with open windows for the application
defaults write .GlobalPreferences AppleSpacesSwitchOnActivate -bool true

# Set Monday to first day of week
defaults write .GlobalPreferences AppleFirstWeekday -dict gregorian 2


# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Trackpad: enable three-finger drag
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 2
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 2

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
# Delay until key repeat start
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Expand print panel by default.
defaults write NSGlobalDomain NSNavPanelExpandedStateForPrintMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForPrintMode2 -bool true


# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true



# FINDER
# Set Desktop as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true


# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Hide tags in Finder sidebar
defaults write com.apple.finder ShowRecentTags -bool false

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

# Show the ~/Library folder
sudo chflags nohidden ~/Library 

# Show the /Volumes folder
sudo chflags nohidden /Volumes

killall Finder



# PLISTBUDDY
# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy name" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy name" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy name" ~/Library/Preferences/com.apple.finder.plist

# Increase the size of icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist




# SYSTEM PREFS
# Disable Resume system-wide
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false



# UNIVERSAL ACCESS
# Reduce Motion
defaults write com.apple.universalaccess reduceMotion -bool true



# DOCK
# Do not show recent items in the dock
defaults write com.apple.dock show-recents -bool false

# Set the icon size of Dock items to 48 pixels
defaults write com.apple.dock tilesize -int 48

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Wipe all (default) app icons from the Dock
defaults write com.apple.dock persistent-apps -array

# Put all my applications into the dock
for app in \
  "/System/Applications/Messages.app" \
  "/Applications/Discord.app" \
  "/Applications/Slack.app" \
  "/System/Applications/Mail.app" \
  "/Applications/Fantastical.app" \
  "/Applications/Brave Browser.app" \
  "/Applications/Google Chrome.app" \
  "/System/Applications/Reminders.app" \
  "/Applications/iTerm.app" \
  "/Applications/Visual Studio Code.app" \
  "/Applications/zoom.us.app" \
  "/System/Applications/Preview.app" \
  "/System/Applications/Photos.app" \
  "/System/Applications/Music.app" \
  "/Applications/Transmission.app" \
  "/Applications/Transmit.app" \
  "/Applications/Plex.app" \
  "/System/Applications/System Preferences.app"; do
  defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>${app}</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
done

# Autohide dock
defaults write com.apple.dock autohide -bool true

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Set Dock auto-hide delay
defaults write com.apple.dock autohide-delay -float .25
# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

# Don’t group windows by application in Mission Control
# (i.e. use the old Exposé behavior instead)
defaults write com.apple.dock expose-group-by-app -bool false
# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen
# Bottom right screen corner → Start screen saver
defaults write com.apple.dock wvous-br-corner -int 5
defaults write com.apple.dock wvous-br-modifier -int 0



# TRACKPAD ADN MOSUE
# Four finger swipe up for mission control
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerVertSwipeGesture -int 2



# PREFS WITH PMSET
# Uncheck "slightly dim the display on battery"
sudo pmset -b lessbright 0

# Turn off the display after 15 mins
sudo pmset -b displaysleep 15



# SOFTWARE UPDATES
# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true



# MISC OS SETTINGS
# Turn on DnD when mirroring to display
# TODO FIX
# defaults -currentHost delete com.apple.notificationcenterui dndMirroring

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Media Disk
# TODO FIX
# osascript -e "tell application \"System Events\" to make login item at end with properties {path:\"Volumes/Bigboi\", kind:\"Volume\", hidden:false}"

# Show battery percentage in menu bar
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist BatteryShowPercentage -bool true

# Hide menubar items
defaults -currentHost write com.apple.Spotlight MenuItemHidden -int 1
defaults write com.apple.Siri StatusMenuVisible -bool false

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Login Items
# Applications
# for app in \
# 	"Alfred 5" \
# 	"Flux" \
# 	"Dropbox" \
# 	"Phoenix"; do
# 	osascript -e "tell application \"System Events\" to make login item at end with properties {path:\"/Applications/${app}.app\", hidden:false}"
# done

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Disable Spotlight Hotleys
# ./disable_spotlight_keys.sh



# TEXT EDIT
# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0
# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4



# DISK UTILITY
# Enable the debug menu in Disk Utility
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true



# SAFARI
# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true



# MAIL
# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Display emails in threaded mode, sorted by date (oldest at the top)
defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"

# Disable inline attachments (just show the icons)
defaults write com.apple.mail DisableInlineAttachmentViewing -bool yes
# Add the keyboard ⌘ ^a to archive
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Archive" "@^a"



# MESSAAGES
# Disable smart quotes as it’s annoying for messages that contain code
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false



# CHROME
# Use the system-native print preview dialog
defaults write com.google.Chrome DisablePrintPreview -bool true
defaults write com.google.Chrome.canary DisablePrintPreview -bool true

# Expand the print dialog by default
defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true



# Transmission
# Use `~/Documents/Torrents` to store incomplete downloads
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Documents/Torrents"

# Use `~/Downloads` to store completed downloads
defaults write org.m0k.transmission DownloadLocationConstant -bool true

# Don’t prompt for confirmation before downloading
defaults write org.m0k.transmission DownloadAsk -bool false
defaults write org.m0k.transmission MagnetOpenAsk -bool false

# Don’t prompt for confirmation before removing non-downloading active transfers
defaults write org.m0k.transmission CheckRemoveDownloading -bool true

# Trash original torrent files
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

# Hide the donate message
defaults write org.m0k.transmission WarningDonate -bool false
# Hide the legal disclaimer
defaults write org.m0k.transmission WarningLegal -bool false



# MYSIDES 
mysides remove Recents
mysides remove Downloads
mysides add tomcraig file://${HOME}
mysides add TomCraig file://${HOME}/Dropbox/TomCraig
mysides add Music file://${HOME}/Music
mysides add Movies file://${HOME}/Movies
mysides add Pictures file://${HOME}/Pictures



# DUTI
# Change the default applications for filetypes
# (The "Open With" option)
# Can find the bundle ID of an application with:
#    osascript -e 'id of app "<APP NAME"'
duti -s abnerworks.Typora .md all
duti -s org.freecadteam.freecad .stl all
duti -s org.vim.MacVim .sh all
duti -s org.vim.MacVim .yaml all
duti -s org.vim.MacVim .yml all
duti -s org.vim.MacVim .json all
duti -s org.vim.MacVim .log all
duti -s org.videolan.vlc .avi all
duti -s org.videolan.vlc .mkv all
duti -s org.videolan.vlc .mov all
duti -s org.videolan.vlc .mp4 all
duti -s cx.c3.theunarchiver .rar all
duti -s cx.c3.theunarchiver .7z all
duti -s cx.c3.theunarchiver .zip all



# DONE, RESTART APPLICATIONS
for app in "Activity Monitor" \
	"Calendar" \
	"cfprefsd" \
	"Dock" \
	"Finder" \
	"Mail" \
	"Messages" \
	"Photos" \
	"Safari" \
	"SystemUIServer" \
	"Terminal" \
	"Transmission" \
	"iCal"; do
	killall "${app}" &> /dev/null
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
