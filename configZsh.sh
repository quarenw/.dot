#!/bin/bash

set -e
. ./utils.sh

print_block "Setting up ZSH"

if [ -d ${HOME}/.oh-my-zsh ]; then
  msg "THERE IS OH-MY-ZSH"
else
  msg "Installing Oh-my-ZSH"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ -f ${HOME}/.zshrc ]; then
  msg "Setting up remote import"
  grep "^\..*\.dot\/files\/shrc" ${HOME}/.zshrc || echo $'. ${HOME}/.dot/files/shrc\n' >> ${HOME}/.zshrc
  grep "^\..*\.dot\/files\/zshrc" ${HOME}/.zshrc || echo $'. ${HOME}/.dot/files/zshrc\n' >> ${HOME}/.zshrc
  msg "Setting up local import"
  grep "^\..*\.dot\/local\/shrc" ${HOME}/.zshrc || echo $'. ${HOME}/.dot/local/shrc\n' >> ${HOME}/.zshrc
  grep "^\..*\.dot\/local\/zshrc" ${HOME}/.zshrc || echo $'. ${HOME}/.dot/local/zshrc\n' >> ${HOME}/.zshrc
fi

if ask "Set tmux auto-attach?" Y; then
  read -p "Enter default session nasme [local]: " SESSION_NAME
  SESSION_NAME=${SESSION_NAME:-local}

  if [ -f ${HOME}/.zshrc ]; then
    grep "tmux attach" ${HOME}/.zshrc || echo $'\nif [ -z "$TMUX" ]; then\n    tmux attach -t '${SESSION_NAME}' || tmux new -s '${SESSION_NAME}$'\nfi\n' >> ${HOME}/.zshrc
  fi
fi

