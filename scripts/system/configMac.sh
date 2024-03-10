#!/bin/sh

set -e
. ${HOME}/.dot/scripts/utils.sh

msg "MacOS core setup"

msg "Install all the casks"

# Required for a sane MacOS experience
install_pac rectangle cask
install_pac karabiner-elements cask
install_pac clipy cask
install_pac unnaturalscrollwheels cask


# Need this as a matter of course
install_pac google-chrome cask # Le'ts be honest this is all we need
install_pac visual-studio-code cask
install_pac docker cask
install_pac vlc cask
install_pac virtualbox cask


if ask "Setup perosnal apps?" Y; then
  install_pac telegram cask
  install_pac steam cask # Long shot but ever the optimist
fi


if ask "Setup *urgh* work apps?" N; then
  install_pac slack cask
  #install_pac google-cloud-sdk cask
fi

