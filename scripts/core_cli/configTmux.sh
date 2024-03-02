#!/bin/sh

set -e
. ${HOME}/.dot/scripts/utils.sh

if [ -f ${HOME}/.tmux.conf ]; then
  msg ".tmux.conf already exists"
  if ask "Backup .tmux.conf?" Y; then
    mv ${HOME}/.tmux.conf ${HOME}/.dot/backup/
  fi
fi

ln -sf ${HOME}/.dot/files/tmux.conf ${HOME}/.tmux.conf

