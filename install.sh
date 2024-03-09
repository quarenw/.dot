#!/bin/sh

# Set stop on errors and load util functions
set -e
. ${HOME}/.dot/scripts/utils.sh

##########################################################
print_block "Bootstrapping"
##########################################################

##########################################################
# Init of the .dot repo
print_block "Init .dot"
sh ${HOME}/.dot/scripts/initdot.sh


##########################################################
# Bootstrap
print_block "Starting install process"
if ask "Should we bootstrap this system?" Y; then
	msg "Bootstrap in"
  sh ${HOME}/.dot/scripts/bootstrap.sh
else
	msg "Ok skipping bootstrap"
fi


##########################################################
print_block "Core Setup"
##########################################################

if ask "Setup core components?" Y; then
	msg "Ok let's set up the minimum"
  sh ${HOME}/.dot/scripts/system/coreConfig.sh
else
	msg "Ok skipping core config"
fi


##########################################################
# CORE CONFIGS
print_block "Core Configs"
if ask "Config core CLIs?" Y; then
  if command_exists bash; then bash ${HOME}/.dot/scripts/core_cli/configBash.sh; fi
  if command_exists zsh; then sh ${HOME}/.dot/scripts/core_cli/configZsh.sh; fi
  if command_exists vim; then sh ${HOME}/.dot/scripts/core_cli/configVim.sh; fi
  if command_exists tmux; then sh ${HOME}/.dot/scripts/core_cli/configTmux.sh; fi
fi

 
##########################################################
# PROGRAMMING
print_block "Programming"
if ask "Is this a programming compter?" N; then
  PROG_LANGS=$(ls ${HOME}/.dot/scripts/programming/ | awk -F '.' '{ print $1 }')
  for i in $PROG_LANGS; do
    if ask "Setup $i?" N; then
      bash ${HOME}/.dot/scripts/programming/"$i".sh
    fi
  done
fi


##########################################################
# Git setup
if command_exists git && ask "Setup git?" Y; then
  msg "Let's get Git set up"

  prompt "What name should we use for Git?"
  read gitname
  prompt "What email should we use for Git?"
  read gitemail
  git config --global user.name $gitname
  git config --global user.email $gitemail
fi
 

##########################################################
# Modules
print_block "Modules"
if ask "Should we modularize?" Y; then
  MODULE_SCRIPTS=$(ls ${HOME}/.dot/scripts/modules/ | awk -F '.' '{ print $1 }')
  for i in $MODULE_SCRIPTS; do
    if ask "Setup $i?" N; then
      bash ${HOME}/.dot/scripts/programming/"$i".sh
    fi
  done
fi

# # if [ $0 != -zsh ]; then
# #   chsh -s /bin/zsh
# # fi
