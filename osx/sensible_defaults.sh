#!/bin/bash
# Sources:
# - https://github.com/keith/dotfiles/blob/main/osx/defaults.sh
#

# VSCode
# Press and Hold (source: https://github.com/vscodevim/vim?tab=readme-ov-file#mac)
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# Dock
defaults write com.apple.dock "tilesize" -int "36"
# Do not show recent applications in Dock
defaults write com.apple.dock "show-recents" -bool "false"
defaults write com.apple.dock "autohide" -bool "true"
# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true
defaults write com.apple.dock mouse-over-hilte-stack -bool true
# Magnify select item
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock largesize -int 80
# Minimize to application icon
defaults write com.apple.dock minimize-to-application -bool true
killall Dock

# Finder
defaults write com.apple.finder "AppleShowAllFiles" -bool "true"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder "ShowPathbar" -bool "true"
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"
defaults write NSGlobalDomain "NSTableViewDefaultSizeMode" -int "1"
defaults write com.apple.finder "ShowStatusBar" -bool "true"
# Use column view in all Finder windows by default
# Four-letter codes for the other view modes: 'icnv', 'clmv', 'Flwv', 'Nlsv'
defaults write com.apple.finder FXPreferredViewStyle -string Nlsv
# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string SCcf
# Finder: new window location set to $HOME. Same as Finder > Preferences > New Finder Windows show
# For other path use "PfLo" and "file:///foo/bar/"
defaults write com.apple.finder NewWindowTarget -string PfLo
defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME/"
# Show the ~/Library folder
chflags nohidden ~/Library
# Don't use tabs in Finder
defaults write com.apple.finder AppleWindowTabbingMode -string "manual"
# Desktop
defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool "true"

killall Finder

# Safari
# Change the Safari search to find strings contained in other words
defaults write -app Safari FindOnPageMatchesWordStartsOnly -bool false
# Show developer tools
defaults write -app Safari IncludeDevelopMenu -bool true

# Menu Bar
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE d MMM HH:mm:ss\""
# show battery percentage value
defaults write com.apple.controlcenter "NSStatusItem Visible Battery" -bool true
defaults write com.apple.controlcenter BatteryShowPercentage -bool true

killall ControlCenter

# Mouse
defaults write NSGlobalDomain com.apple.mouse.scaling -float "1.5"

# Trackpad
# enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad ActuationStrength -int 0                  # Set built-in trackpad to quiet/light click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad ActuationStrength -int 0 # Set external Magic Trackpad to quiet/light click

killall cfprefsd

# Mail
# Only take address@example.com when copying email addresses in main
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# OS

# https://mmazzarolo.com/blog/2022-04-16-drag-window-by-clicking-anywhere-on-macos
defaults write NSGlobalDomain NSWindowShouldDragOnGesture -bool true

# Disable Tahoe menu images
# https://512pixels.net/2026/03/hide-macos-tahoes-menu-icons-with-this-one-simple-trick
defaults write NSGlobalDomain NSMenuEnableActionImages -bool false

# Screen Saver
# Set delay before password ask (minutes x 60)
defaults write com.apple.screensaver askForPasswordDelay -int 5
# Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName
# Set login window text
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText -string "But God demonstrates his own love for us in this: While we were still sinners, Christ died for us. (Romans 5:8, NIV)"

# Other
# Disable reopen on startup
defaults write NSGlobalDomain ApplePersistence -bool false
# Disable badges for Feedback Assistant, they never go away if you have a response that you reply to
defaults write com.apple.appleseed.FeedbackAssistant AttentionPrefBundleIDs -bool false
# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# Shows ethernet connected computers in airdrop
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
