#!/bin/sh

set -e
. ./utils.sh

print_block "Bootstrapping system"

if [ "$(uname)" == "Darwin" ]; then
	echo "Detected MacOS"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	echo "Detected Linux"
fi
