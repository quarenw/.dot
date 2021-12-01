#!/bin/bash

[ -f ${HOME}/.vimrc ] && mv ${HOME}/.vimrc ${HOME}/.vimrc.bak
cp ${HOME}/.dot/files/vimrc ${HOME}/.vimrc
[ -d ${HOME}/.vim ] && mv ${HOME}/.vim ${HOME}/.vim.bak
cp -r ${HOME}/.dot/files/vim ${HOME}/.vim
