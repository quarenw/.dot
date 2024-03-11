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

install_pac net-tools
install_pac ripgrep
install_pac fzf
install_pac fd

install_pac gcc
install_pac gpp

# Manual MacOS Font install
msg "Installing terminal font"
cp ${HOME}/.dot/files/fonts/*.ttf ${HOME}/Library/Fonts/

