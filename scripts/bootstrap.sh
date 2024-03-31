#!/bin/sh

set -e
. ${HOME}/.dot/scripts/utils.sh

print_block "Bootstrapping system"

##########################################################
# Validate min binaries
msg "Validating min binaries"
for i in $(echo "cat grep awk sed tr")
do
  echo "$i: $(command -v $i)"
  if [ ! $(command -v $i) ]; then
    error "Aborting as $i not found"
    exit 1
  fi
done


##########################################################
# System bootstraps
if [ "$(uname)" = "Darwin" ]; then
	msg "Detected MacOS"
  sh ${HOME}/.dot/scripts/system/bootstrapMac.sh
elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
	msg "Detected Linux"
  sh ${HOME}/.dot/scripts/system/bootstrapLinux.sh
fi
