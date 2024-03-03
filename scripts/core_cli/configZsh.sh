#!/bin/sh

set -e
. ${HOME}/.dot/scripts/utils.sh

print_block "Setting up ZSH"

# Install Oh my ZSH
if [ -d ${HOME}/.oh-my-zsh ]; then
  msg "THERE IS OH-MY-ZSH"
else
  msg "Installing Oh-my-ZSH"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ -f ${HOME}/.zshrc ]; then
  # Zsh theme
  msg "Setting zsh theme"
  ln -s ${HOME}/.dot/files/zsh/imp.zsh-theme ${HOME}/.oh-my-zsh/themes/
  [ -f ${HOME}/.zshrc ] && sed -i.backup -e "s,ZSH_THEME=.*,ZSH_THEME='imp',g" ${HOME}/.zshrc

  # Zsh imports
  msg "Setting up remote import"
  grep "^\..*\.dot\/files\/shrc" ${HOME}/.zshrc || echo '. ${HOME}/.dot/files/shrc' >> ${HOME}/.zshrc
  grep "^\..*\.dot\/files\/zshrc" ${HOME}/.zshrc || echo '. ${HOME}/.dot/files/zshrc' >> ${HOME}/.zshrc
  msg "Setting up local import"
  grep "^\..*\.dot\/local\/shrc" ${HOME}/.zshrc || echo '. ${HOME}/.dot/local/shrc' >> ${HOME}/.zshrc
  grep "^\..*\.dot\/local\/zshrc" ${HOME}/.zshrc || echo '. ${HOME}/.dot/local/zshrc' >> ${HOME}/.zshrc
fi

if ask "Set tmux auto-attach?" Y; then
  read -p "Enter default session nasme [local]: " SESSION_NAME
  SESSION_NAME=${SESSION_NAME:-local}

  if [ -f ${HOME}/.dot/local/zshrc ]; then
    grep "tmux attach" ${HOME}/.dot/local/zshrc || echo -e '\nif [ -z "$TMUX" ]; then\n    tmux attach -t '${SESSION_NAME}' || tmux new -s '${SESSION_NAME}$'\nfi\n' >> ${HOME}/.dot/local/zshrc
  fi
fi

