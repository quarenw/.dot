#!/bin/bash

set -e
. ${HOME}/.dot/scripts/utils.sh

##########################################################
# Setting up python
msg "Installing python"

install_pac python3-venv

msg "Install deps"
python -m ensurepip --upgrade

install_pac pipx
pipx ensurepath

