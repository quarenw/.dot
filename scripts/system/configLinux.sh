#!/bin/sh

set -e
. ${HOME}/.dot/scripts/utils.sh

msg "Linux core setup"

#install_pac yt-dlp tomtomtom/yt-dlp
install_pac alacritty
install_pac fastfetch

if ask "Setup perosnal apps?" Y; then
  install_pac telegram
  install_pac steam
fi

