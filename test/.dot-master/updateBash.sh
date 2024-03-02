#!/bin/bash

if [ -d ${HOME}/.bash_it ]; then 
  echo THERE IS BASH_IT
else 
  git clone --depth=1 https://github.com/Bash-it/bash-it.git ${HOME}/.bash_it
  ${HOME}/.bash_it/install.sh
  [ -f ${HOME}/.bashrc ] && sed -i.backup -e "s,THEME='.*',THEME='zork',g" ${HOME}/.bashrc
  [ -f ${HOME}/.bash_profile ] && sed -i.backup -e "s,THEME='.*',THEME='zork',g" ${HOME}/.bash_profile
  [ -f ${HOME}/.bashrc ] && source ${HOME}/.bashrc
  [ -f ${HOME}/.bash_profile ] && source ${HOME}/.bash_profile
  echo bash_it installed
fi

[ -f ${HOME}/.bashrc ] && grep "tmux" ${HOME}/.bashrc || echo $'\nif [ -z "$TMUX" ]; then\n    tmux attach -t local || tmux new -s local\nfi\n' >> ${HOME}/.bashrc

[ -f ${HOME}/.bash_profile ] && grep "tmux" ${HOME}/.bash_profile || echo $'\nif [ -z "$TMUX" ]; then\n    tmux attach -t local || tmux new -s local\nfi\n' >> ${HOME}/.bash_profile
