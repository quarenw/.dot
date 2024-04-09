#!/bin/sh

# No exit on error as we are using test for symlinks
. ${HOME}/.dot/scripts/utils.sh

if [ -f ${HOME}/.tmux.conf ]; then
  msg ".tmux.conf already exists"
  if ask "Backup .tmux.conf?" Y; then
    mv ${HOME}/.tmux.conf ${HOME}/.dot/backup/
  fi
fi

ln -sf ${HOME}/.dot/files/tmux.conf ${HOME}/.tmux.conf
if ask "Install TPM?" Y; then
  [ -d ${HOME}/.tmux/plugins/tpm ] && rm -r ${HOME}/.tmux/plugins/tpm
  git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
fi

mkdir -p ${HOME}/.tmux/plugins/tmux/
if [ -d ${HOME}/.tmux/plugins/tmux/custom ]; then
  IS_SYMBOLIC=$(test -L ${HOME}/.tmux/plugins/tmux/custom && echo "yes")
	if [ -z $IS_SYMBOLIC ]; then
  	# Move the folder if it isn't a symlink
    if ask "Backup custom folder?" Y; then
      mv -f ${HOME}/.tmux/plugins/tmux/custom ${HOME}/.dot/backup/
    else
      rm -r ${HOME}/.tmux/plugins/tmux/custom
    fi
  else
  	# If it is a symlink then burn it with fire I guess
    rm ${HOME}/.tmux/plugins/tmux/custom
  fi
fi

ln -sf ${HOME}/.dot/files/tmux_custom/ ${HOME}/.tmux/plugins/tmux/custom
