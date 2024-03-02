#!/bin/bash

set -e
. ${HOME}/.dot/scripts/utils.sh

print_block "Setting up BASH"

PS3='Which bash framework do you want: '
options=("oh-my-bash" "bash-it" "quit")
select opt in "${options[@]}"
do
  case $opt in
    "oh-my-bash")
      if [ -d ${HOME}/.oh-my-bash ]; then 
        msg "THERE IS OH-MY-BASH"
      else 
        bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
        [ -f ${HOME}/.bashrc ] && sed -i.backup -e "s,OSH_THEME=.*,OSH_THEME='zork',g" ${HOME}/.bashrc
        [ -f ${HOME}/.bash_profile ] && sed -i.backup -e "s,OSH_THEME=.*,OSH_THEME='zork',g" ${HOME}/.bash_profile
        [ -f ${HOME}/.bashrc ] && source ${HOME}/.bashrc
        [ -f ${HOME}/.bash_profile ] && source ${HOME}/.bash_profile
        msg "oh-my-bash installed"
      fi
      break
      ;;
    "bash-it")
      if [ -d ${HOME}/.bash_it ]; then 
        msg "THERE IS BASH_IT"
      else 
        git clone --depth=1 https://github.com/Bash-it/bash-it.git ${HOME}/.bash_it
        ${HOME}/.bash_it/install.sh
        [ -f ${HOME}/.bashrc ] && sed -i.backup -e "s,THEME='.*',THEME='zork',g" ${HOME}/.bashrc
        [ -f ${HOME}/.bash_profile ] && sed -i.backup -e "s,THEME='.*',THEME='zork',g" ${HOME}/.bash_profile
        [ -f ${HOME}/.bashrc ] && source ${HOME}/.bashrc
        [ -f ${HOME}/.bash_profile ] && source ${HOME}/.bash_profile
        msg "bash_it installed"
      fi
      break
      ;;
    "quit")
      break
      ;;
    *) msg "invalid option";;
  esac
done

if [ -f ${HOME}/.bashrc ]; then
  msg "Setting up remote import"
  grep "^\..*\.dot\/files\/shrc" ${HOME}/.bashrc || echo $'. ${HOME}/.dot/files/shrc\n' >> ${HOME}/.bashrc
  grep "^\..*\.dot\/files\/bashrc" ${HOME}/.bashrc || echo $'. ${HOME}/.dot/files/bashrc\n' >> ${HOME}/.bashrc
  msg "Setting up local import"
  grep "^\..*\.dot\/local\/shrc" ${HOME}/.bashrc || echo $'. ${HOME}/.dot/local/shrc\n' >> ${HOME}/.bashrc
  grep "^\..*\.dot\/files\/bashrc" ${HOME}/.bashrc || echo $'. ${HOME}/.dot/files/bashrc\n' >> ${HOME}/.bashrc
fi

if [ -f ${HOME}/.bash_profile ]; then
  msg "Setting up remote import"
  grep "^\..*\.dot\/local\/shrc" ${HOME}/.bash_profile || echo $'. ${HOME}/.dot/local/shrc\n' >> ${HOME}/.bash_profile
  grep "^\..*\.dot\/local\/bashrc" ${HOME}/.bash_profile || echo $'. ${HOME}/.dot/local/bashrc\n' >> ${HOME}/.bash_profile
  msg "Setting up local import"
  grep "^\..*\.dot\/local\/shrc" ${HOME}/.bash_profile || echo $'. ${HOME}/.dot/local/shrc\n' >> ${HOME}/.bash_profile
  grep "^\..*\.dot\/local\/bashrc" ${HOME}/.bash_profile || echo $'. ${HOME}/.dot/local/bashrc\n' >> ${HOME}/.bash_profile
fi

if ask "Set tmux auto-attach?" Y; then
  read -p "Enter default session nasme [local]: " SESSION_NAME
  SESSION_NAME=${SESSION_NAME:-local}

  if [ -f ${HOME}/.dot/local/bashrc ]; then
    grep "tmux attach" ${HOME}/.dot/local/bashrc || echo $'\nif [ -z "$TMUX" ]; then\n    tmux attach -t '${SESSION_NAME}' || tmux new -s '${SESSION_NAME}$'\nfi\n' >> ${HOME}/.dot/local/bashrc
  fi
fi
