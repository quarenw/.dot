#!/bin/bash

set -e
. ${HOME}/.dot/scripts/utils.sh

##########################################################
# Setting up Javascript
msg "Installing Javascriptses"
if [ ! $( command_exists nvm) ]; then
  msg "Setup nvm"
  LATEST_NVM=$(curl -s "https://api.github.com/repos/nvm-sh/nvm/tags" | sed -n '3 p' | awk -F'"' '{print $4}')
  curl -o- "https://raw.githubusercontent.com/creationix/nvm/${LATEST_NVM}/install.sh" | bash

  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
  msg "Let's install all the nodes"
  nvm install node
  nvm install 16
  nvm install 12
  nvm install 8
  nvm use node

  # Add nvm to all possible shells
  msg "Add nvm to all possible shells"
  declare -a shells_arr=(".zshrc" ".bashrc" ".bash_profile")
  for i in "${shells_arr[@]}"; do
    [ -f ${HOME}/"$i" ] && grep "nvm" ${HOME}/"$i" || echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"\n[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm\n' >> ${HOME}/"$i"
  done
else
  msg "Seems like you have nvm"
fi
