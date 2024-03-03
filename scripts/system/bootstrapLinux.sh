#!/bin/sh

set -e
. ${HOME}/.dot/scripts/utils.sh

msg "Linux bootstrap setup"

DISTRO=$(cat /etc/*release | grep '^ID=' | awk -F '=' '{ print $2 }' | sed 's/"//g')
msg "Found to be running distro: $DISTRO"



