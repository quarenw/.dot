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
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

mkdir -p ${HOME}/.tmux/plugins/tmux/
if [ -d ${HOME}/.tmux/plugins/tmux/custom ]; then
	if [ ! test -L ~/.tmux/plugins/tmux/custom ]; then
  	# Move the folder if it isn't a symlink
    mv -f ${HOME}/.tmux/plugins/tmux/custom ${HOME}/.dot/backup/
  else
  	# If it is a symlink then burn it with fire I guess
    rm ${HOME}/.tmux/plugins/tmux/custom
  fi
fi

ln -sf ${HOME}/.dot/files/tmux_custom/ ${HOME}/.tmux/plugins/tmux/custom