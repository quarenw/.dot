#!/bin/bash

if [ -d ${HOME}/.bash_it ]; then 
  echo THERE IS BASH_IT
else 
  cp -r ${HOME}/.quaren/bash_it ${HOME}/.bash_it
  ~/.bash_it/install.sh
  [ -f ${HOME}/.bashrc ] && sed -i.backup -e "s,THEME='.*',THEME='zork',g" ${HOME}/.bashrc
  [ -f ${HOME}/.bash_profile ] && sed -i.backup -e "s,THEME='.*',THEME='zork',g" ${HOME}/.bash_profile
  # [ -f ${HOME}/.bashrc ] && source ${HOME}/.bashrc
  # [ -f ${HOME}/.bash_profile ] && source ${HOME}/.bash_profile
  # bash_it update
  echo bash_it installed updated
fi

[ -f ${HOME}/.bashrc ] && grep "tmux" ${HOME}/.bashrc || echo $'\nif [ -z "$TMUX" ]; then\n    tmux attach -t local || tmux new -s local\nfi\n' >> ${HOME}/.bashrc

[ -f ${HOME}/.bash_profile ] && grep "tmux" ${HOME}/.bash_profile || echo $'\nif [ -z "$TMUX" ]; then\n    tmux attach -t local || tmux new -s local\nfi\n' >> ${HOME}/.bash_profile

