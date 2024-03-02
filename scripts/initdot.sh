#!/bin/sh

# Set stop on errors and load util functions
set -e
. ${HOME}/.dot/scripts/utils.sh

# Init local folder
if [ ! -d ./local ]; then
  msg "Creating local folder"
  mkdir -p ./local
  cat ./localfiles.list | xargs -I % sh -c 'echo "[INFO] Creating %" && touch ./local/%'
else
  msg "Local folder already exists"
fi

if [ ! -d ./backup ]; then
  msg "Creating backup folder"
  mkdir -p ./backup
else
  msg "Backup folder already exists"
fi
