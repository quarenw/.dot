#!/bin/sh
#
set -e

. ${HOME}/.dot/scripts/utils.sh

echo $(get_distro)

install_pac neofetch
