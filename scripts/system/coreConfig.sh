#!/bin/sh

set -e
. ${HOME}/.dot/scripts/utils.sh


##########################################################
# SSH key
if [ ! -f ${HOME}/.ssh/id_rsa ] && [ $(command_exists "ssh-keygen") ]; then
  msg "Generating SSH key"
  ssh-keygen -t rsa -b 4096 -f "${HOME}/.ssh/id_rsa"
else
  msg "Not possible to gen ssh key"
  msg "ssh-keygen: $(command -v ssh-keygen)"
fi


##########################################################
# System core install
if [ "$(uname)" = "Darwin" ]; then
	msg "Detected MacOS"
  sh ${HOME}/.dot/scripts/system/configMac.sh
fi
if [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
	msg "Detected Linux"
  sh ${HOME}/.dot/scripts/system/configLinux.sh
fi
