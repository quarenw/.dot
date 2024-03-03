#!/bin/sh

set -e
. ${HOME}/.dot/scripts/utils.sh

msg "Linux bootstrap setup"

DISTRO=$(cat /etc/*release | grep '^ID=' | awk -F '=' '{ print $2 }' | sed 's/"//g' | tr A-Z a-z)
msg "Found to be running distro: $DISTRO"

install_pac curl
install_pac ssh
install_pac git

install_pac gcc
install_pac gpp

install_pac bash
install_pac zsh
install_pac fish

if ask "Set up graphical VIM?" Y; then
  install_pac vim-athena
else
  install_pac vim
fi
install_pac neovim "neovim-ppa/unstable"
install_pac tmux

install_pac yt-dlp tomtomtom/yt-dlp
