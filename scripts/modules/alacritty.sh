#!/bin/sh

set -e
. ${HOME}/.dot/scripts/utils.sh

msg "Setting up Alacritty"

ln -sf ${HOME}/.dot/files/config/alacritty ${HOME}/.config/alacritty

