#!/bin/sh

set -e
. ${HOME}/.dot/scripts/utils.sh

print_block "Bootstrapping system"

##########################################################
# SSH key
if [ ! -f $HOME/.ssh/id_rsa ]; then
  msg "Generating SSH key"
  ssh-keygen -t rsa -b 4096 -f "$HOME/.ssh/id_rsa"
fi

##########################################################
# System bootstraps
if [ "$(uname)" == "Darwin" ]; then
	msg "Detected MacOS"
  sh ${HOME}/.dot/scripts/system/bootstrapMac.sh
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	msg "Detected Linux"
  sh ${HOME}/.dot/scripts/system/bootstrapLinux.sh
fi
