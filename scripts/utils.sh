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

get_os() {
  echo "$(expr substr $(uname -s) 1 5 | tr A-Z a-z)"
}

get_distro() {
  case $(get_os) in
    linux)
      echo "$(cat /etc/*release | grep '^ID=' | awk -F '=' '{ print $2 }' | sed 's/"//g' | tr A-Z a-z)"
      ;;
    darwin)
      echo "darwin"
      ;;
    *) echo "default" ;; 
  esac
}

install_pac() {
  DISTRO=$(get_distro)
  PACKAGE=$1
  PPA=$2

  case $DISTRO in
    debian|ubuntu|mint)
      if [ ! -z ${PPA} ]; then sudo add-apt-repository ppa:$2; fi
      if ask "Install $1" Y; then
        sudo apt-get update
        yes | sudo apt-get install $1
      fi
      msg "Installled $1"
      ;;

    fedora|rhel|centos)
      sudo yum update
      sudo yum install $1
      ;;

    darwin)
      brew update
      brew install $1
      ;;

    *)
      echo -n "unsupported OS"
      ;;
  esac
}
