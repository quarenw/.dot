#!/bin/bash

# Set stop on errors and load util functions
set -e
. ./utils.sh

# Init local folder
if [ ! -d ./local ]; then
  msg "Creating local folder"
  mkdir -p ./local

  cat ./localfiles.list | xargs -I % sh -c 'echo "[INFO] Creating %" && touch ./local/%'
fi
