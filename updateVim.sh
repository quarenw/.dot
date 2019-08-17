#!/bin/bash

[ -f ${HOME}/.vimrc ] && mv ${HOME}/.vimrc ${HOME}/.vimrc.bak
cp ${HOME}/.quaren/files/vimrc ${HOME}/.vimrc
[ -d ${HOME}/.vim ] && mv ${HOME}/.vim ${HOME}/.vim.bak
cp -r ${HOME}/.quaren/files/vim ${HOME}/.vim

