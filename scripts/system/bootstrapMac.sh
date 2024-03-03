#!/bin/sh

set -e
. ${HOME}/.dot/scripts/utils.sh

msg "MacOS bootstrap setup"

# xcode install
msg "Installing xcode commmand line tools"
xcode-select --install

# Brew yourself a pacman
if [ ! $(command_exists brew) ]; then
  msg "Installing Brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# ZSH, VIM and Tmux
msg "Install zsh, vim, nvim and tmux"
install zsh
install vim
install nvim
install tmux

# Manual MacOS Font install
msg "Installing terminal font"
cp ${HOME}/files/fonts/*.ttf ${HOME}/Library/Fonts/

