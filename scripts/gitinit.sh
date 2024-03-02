#!/bin/sh

set -e
. ${HOME}/.dot/scripts/utils.sh

msg "Checking for github and git cli, install if missing"

if command_exists git
then
	msg "git is installed, yay!"
else
	msg "git not installed, sadge"
fi

if command_exists gh
then
	msg "gh is installed, yay!"
else
	msg "gh not installed, sdge"
fi

