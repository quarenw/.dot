#!/bin/bash

# Set stop on errors and load util functions
set -e
. ./utils.sh

PS3='Which bash framework do you want: '
options=("oh-my-bash" "bash-it" "quit")
select opt in "${options[@]}"
do
  case $opt in
    "oh-my-bash")
      if [ -d ${HOME}/.oh-my-bash ]; then 
        echo THERE IS OH-MY-BASH
      else 
        bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
        [ -f ${HOME}/.bashrc ] && sed -i.backup -e "s,OSH_THEME=.*,OSH_THEME='zork',g" ${HOME}/.bashrc
        [ -f ${HOME}/.bash_profile ] && sed -i.backup -e "s,OSH_THEME=.*,OSH_THEME='zork',g" ${HOME}/.bash_profile
        [ -f ${HOME}/.bashrc ] && source ${HOME}/.bashrc
        [ -f ${HOME}/.bash_profile ] && source ${HOME}/.bash_profile
        echo oh-my-bash installed
      fi
      break
      ;;
    "bash-it")
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
      break
      ;;
    "quit")
      break
      ;;
    *) echo "invalid option";;
  esac
done

if ask "Set tmux auto-attach?" Y; then
  read -p "Enter default session nasme [local]: " SESSION_NAME
  SESSION_NAME=${SESSION_NAME:-local}

  if [ -f ${HOME}/.bashrc ]; then
    grep "tmux attach" ${HOME}/.bashrc || echo $'\nif [ -z "$TMUX" ]; then\n    tmux attach -t '${SESSION_NAME}' || tmux new -s '${SESSION_NAME} >> ${HOME}/.bashrc
    echo $'fi\n' >> ${HOME}/.bashrc
  fi

  if [ -f ${HOME}/.bash_profile ]; then
    grep "tmux attach" ${HOME}/.bash_profile || echo $'\nif [ -z "$TMUX" ]; then\n    tmux attach -t '${SESSION_NAME}' || tmux new -s '${SESSION_NAME} >> ${HOME}/.bash_profile
    echo $'fi\n' >> ${HOME}/.bash_profile
  fi
fi
