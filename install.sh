#!/bin/sh

# Set stop on errors and load util functions
set -e
. ./utils.sh

print_block "Starting install process"

if ask "Should we bootstrap this system?"; then
	echo "Let's bootstrap"
else
	echo "Ok skipping bootstrap"
fi




# if [ ! -f $HOME/.ssh/id_rsa ]; then
#   print "Generating SSH key"
#   ssh-keygen -t rsa -b 4096 -f "$HOME/.ssh/id_rsa"
# fi
# 
# # Install core dev
# print "Getting the core dev setup"
# 
# # Core setup for MacOS
# if [ "$(uname)" = "Darwin" ]; then
#   print "MacOS core setup"
# 
#   # Brew
#   if [ -z "$(command -v brew)" ]; then
#     print "Install Brew to get us started on Mac"
#     ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#   fi
# 
#   # ZSH, VIM and Tmux
#   print "Install zsh, vim and tmux"
# 
#   brew install zsh
#   brew install vim
#   brew install tmux
# 
#   # Manual MacOS Font install
#   # cd ~/Library/Fonts && { 
#   #   curl -o RobotoMonoPowerline.ttf 'https://github.com/powerline/fonts/raw/master/RobotoMono/Roboto%20Mono%20for%20Powerline.ttf'
#   #   cd -; }
# 
# # Core setup for Linux
# elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
#   print "Linux core setup"
#   # Core setup for Linux
#   sudo apt update
#   sudo apt upgrade
#   sudo apt-get install -y curl
#   sudo apt-get install -y zsh
#   sudo apt-get install -y vim-athena
#   sudo apt-get install -y neovim
#   sudo apt-get install -y tmux
# fi
# 
# # Oh my ZSH
# print "Oh my"
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# 
# # Fonts
# print "Install fonts"
# git clone https://github.com/powerline/fonts.git --depth=1
# cd fonts
# ./install.sh
# cd ..
# rm -rf fonts
# 
# /bin/bash ${HOME}/.dot/updateBash.sh
# /bin/bash ${HOME}/.dot/updateZsh.sh
# /bin/bash ${HOME}/.dot/updateVim.sh
# /bin/bash ${HOME}/.dot/updateTmux.sh
# 
# # Install NVM
# print "Javascript Five star dev"
# curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.35.3/install.sh | bash
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# nvm install 12
# nvm install 8
# nvm install node
# nvm use 12
# # Add nvm to Zsh if it exists
# [ -f ${HOME}/.zshrc ] && grep "nvm" ${HOME}/.zshrc || echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"\n[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm\n' >> ${HOME}/.zshrc
# 
# # Git setup
# print "Let's get Git set up"
# 
# echo "What name should we use for Git?"
# read gitname
# echo "What email should we use for Git?"
# read gitemail
# git config --global user.name $gitname
# git config --global user.email $gitemail
# 
# # Mac Apps
# if [ "$(uname)" = "Darwin" ]; then
# print "Install all the casks"
#   brew install --cask rectangle
#   brew install --cask karabiner-elements
#   brew install --cask clipy
#   brew install --cask unnaturalscrollwheels
# 
#   brew install --cask google-chrome
#   brew install --cask visual-studio-code
#   brew install --cask docker
#   brew install --cask google-cloud-sdk
# 
#   brew install --cask slack
#   brew install --cask vlc
# fi
# 
# print "Setup complete, congratulations!"
# 
# # if [ $0 != -zsh ]; then
# #   chsh -s /bin/zsh
# # fi
