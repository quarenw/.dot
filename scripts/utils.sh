#!/bin/sh

command_exists() {
	command -v "$1" >/dev/null 2>&1
}

msg() {
  echo "[INFO] $1"
}

prompt() {
  echo "[INPUT] $1"
}

error() {
  echo "[ERROR] $1"
}

print_block() {
  echo ""
  echo "<<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>>"
  echo "${1}"
  echo "<<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>>"
  echo ""
}

ask() {
    prompt=$1
    default=$2
    reply=""

    if [ "$2" = "Y" ]; then
        prompt="Y/n"
        default="Y"
    elif [ "$2" = "N" ]; then
        prompt="y/N"
        default="N"
    else
        prompt="y/n"
        default=''
    fi

    while true; do
        echo -n "[INPUT] $1 [$prompt] "
        read -r reply </dev/tty

        if [ -z $reply ]; then
            reply=$default
        fi

        case "$reply" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac
    done
}
