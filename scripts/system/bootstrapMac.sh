#!/bin/sh

set -e
. ${HOME}/.dot/scripts/utils.sh

msg "MacOS bootstrap setup"

# xcode install
if [ "$(xcode-select -p 2> /dev/null)" ]; then
  msg "Looks like xcode is already set up, yay, that thing is such a chore"
fi

while [ ! "$(xcode-select -p 2> /dev/null)" ]; do
  msg "Installing xcode commmand line tools"
  msg "Waiting for installation to be complete"
  msg "Press enter to continue..."
  xcode-select --install
  read
done


# Brew yourself a pacman
if command_exists brew; then
  msg "Brew here"
else
  msg "Installing Brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi


# ZSH, VIM and Tmux
msg "Install zsh, vim, nvim and tmux"
install_pac bash
install_pac zsh
install_pac fish

install_pac vim
install_pac nvim
install_pac tmux

install_pac curl
install_pac wget

install_pac ripgrep
install_pac fzf
install_pac fd

install_pac gcc
install_pac gpp

# Manual MacOS Font install
msg "Installing terminal font"
cp ${HOME}/.dot/files/fonts/*.ttf ${HOME}/Library/Fonts/


if ask "Customize MacOS?" Y; then
  # Automatically hide and show the Dock
  defaults write com.apple.dock autohide -bool true

  # Don’t show recent applications in Dock
  defaults write com.apple.dock show-recents -bool false

  # Hide the menubar
  defaults write NSGlobalDomain _HIHideMenuBar -bool true

  # Disable "Play user interface sound effects"
  defaults write NSGlobalDomain com.apple.sound.uiaudio.enabled -int 0

  # Set highlight and accent color to purple
  defaults write NSGlobalDomain AppleHighlightColor -string "0.968627 0.831373 1.000000 Purple"
  defaults write NSGlobalDomain AppleAccentColor -int 5

  # Clear the entire dock of all pinned apps - fresh new start
  defaults write com.apple.dock persistent-apps -array

  # Change minimize/maximize window effect
  defaults write com.apple.dock mineffect -string "scale"

  # Minimize windows into their application’s icon
  defaults write com.apple.dock minimize-to-application -bool true

  # Don’t show recent applications in Dock
  defaults write com.apple.dock show-recents -bool false

  # Remove any and all Hot Corners, begone notes
  defaults write com.apple.dock wvous-tl-corner -int 0
  defaults write com.apple.dock wvous-tr-corner -int 0
  defaults write com.apple.dock wvous-bl-corner -int 0
  defaults write com.apple.dock wvous-br-corner -int 0

  # Disable “natural” (Lion-style) scrolling
  defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

  # Disable automatic capitalization as it’s annoying when typing code
  defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

  # Disable smart dashes as they’re annoying when typing code
  defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

  # Disable automatic period substitution as it’s annoying when typing code
  defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

  # Disable smart quotes as they’re annoying when typing code
  defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

  # Avoid creating .DS_Store files on network or USB volumes
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
  defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

  # Set the icon size of Dock items to 36 pixels
  defaults write com.apple.dock tilesize -int 32

  # Don’t group windows by application in Mission Control
  # (i.e. use the old Exposé behavior instead)
  defaults write com.apple.dock expose-group-by-app -bool false

  # Use plain text mode for new TextEdit documents
  defaults write com.apple.TextEdit RichText -int 0

  # Kill both to pick up changes
  killall Finder
  killall Dock
fi

