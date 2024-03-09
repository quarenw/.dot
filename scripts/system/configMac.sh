#!/bin/sh

set -e
. ${HOME}/.dot/scripts/utils.sh

msg "MacOS core setup"

msg "Install all the casks"
install_pac rectangle cask
install_pac karabiner-elements cask
install_pac clipy cask
install_pac unnaturalscrollwheels cask

install_pac google-chrome cask
install_pac visual-studio-code cask
install_pac docker cask
install_pac google-cloud-sdk cask

install_pac slack cask
install_pac vlc cask


