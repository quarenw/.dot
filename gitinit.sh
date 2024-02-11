#!/bin/sh
set -e

. ./utils.sh

echo "Checking for github and git cli, install if missing"; echo

if command_exists git
then
	echo "git is installed, yay!"; echo
	
else
	echo "git not installed, sadge"
	
fi

if command_exists gh
then
	echo "gh is installed, yay!"
else
	echo "gh not installed, sdge"
fi



