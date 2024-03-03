#!/bin/sh

set -e
. ${HOME}/.dot/scripts/utils.sh

msg "Configuring VIM"
if [ -f ${HOME}/.vimrc ]; then
  msg ".vimrc already exists"
  if ask "Backup .vimrc?" Y; then
    mv ${HOME}/.vimrc ${HOME}/.dot/backup/
  fi
fi

ln -sf ${HOME}/.dot/files/vimrc ${HOME}/.vimrc

if command_exists nvim; then
  msg "Configuring NeoVIM"
  mkdir -p ${HOME}/.config
  if [ -d ${HOME}/.config/nvim ]; then
    msg "nvim already exists"
    if ask "Backup nvim?" Y; then
      mv ${HOME}/.config/nvim ${HOME}/.dot/backup/
    fi
  fi

  ln -sf ${HOME}/.dot/files/config/nvim ${HOME}/.config/nvim
fi
