#!/bin/bash

[ -d ${HOME}/.oh-my-zsh ] && [ -d ${HOME}/.oh-my-zsh/themes ] && cp ${HOME}/.dot/files/zsh/imp.zsh-theme ${HOME}/.oh-my-zsh/themes/imp.zsh-theme
[ -f ${HOME}/.zshrc ] && sed -i.backup -e 's,ZSH_THEME=".*",ZSH_THEME="imp",g' ${HOME}/.zshrc
echo switched to Imp theme

[ -f ${HOME}/.zshrc ] && grep "tmux" ${HOME}/.zshrc || echo $'\nif [ -z "$TMUX" ]; then\n    tmux attach -t local || tmux new -s local\nfi\n' >> ${HOME}/.zshrc
