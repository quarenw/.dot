#!/bin/sh

set -e
. ${HOME}/.dot/scripts/utils.sh

msg "MacOS core setup"

msg "Install all the casks"
brew install --cask rectangle
brew install --cask karabiner-elements
brew install --cask clipy
brew install --cask unnaturalscrollwheels

brew install --cask google-chrome
brew install --cask visual-studio-code
brew install --cask docker
brew install --cask google-cloud-sdk

brew install --cask slack
brew install --cask vlc


