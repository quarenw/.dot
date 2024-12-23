#!/bin/bash

set -e
. ${HOME}/.dot/scripts/utils.sh

##########################################################
# Setting up c/cpp
msg "Installing c/cpp"

# TODO: Clean up and add choices, platform checks, etc.
msg "Install CMake"
install_pac cmake

msg "Install deps"
#install_pac build-essential
#install_pac pkg-config
#install_pac zip
#install_pac unzip
#install_pac autoconf
#install_pac autopoint
#install_pac libtool

#msg "Install vcpkg"
#wget -O ${HOME}/vcpkg.tar.gz https://github.com/microsoft/vcpkg/archive/master.tar.gz
#sudo mkdir /opt/vcpkg
#sudo tar xf ${HOME}/vcpkg.tar.gz --strip-components=1 -C /opt/vcpkg
#sudo /opt/vcpkg/bootstrap-vcpkg.sh
#sudo ln -s /opt/vcpkg/vcpkg /usr/local/bin/vcpkg
#rm -rf ${HOME}/vcpkg.tar.g

