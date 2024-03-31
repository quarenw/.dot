#!/bin/sh

set -e
. ${HOME}/.dot/scripts/utils.sh

msg "Setting up XFCE"

if [ -d ${HOME}/.config/xfce4 ]; then 
  ln -sf ${HOME}/.dot/files/config/xfce4/terminal/terminalrc ${HOME}/.config/xfce4/terminal/terminalrc
else
  error "XFCE folder not present; are you sure this machine has XFCE?"
fi

