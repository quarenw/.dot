#!/bin/sh

# Set stop on errors and load util functions
set -e
. ./utils.sh

ln -sf ${HOME}/.dot/files/tmux.conf ${HOME}/.tmux.conf

