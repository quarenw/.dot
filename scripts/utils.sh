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

  case $DISTRO in
    debian|ubuntu|mint)
      PPA=$2
      if ask "Install $1" Y; then
        if [ ! -z ${PPA} ]; then
          if command_exists add-apt-repository; then
            sudo add-apt-repository -y ppa:$2
            sudo apt-get update
            yes | sudo apt-get install $1
            msg "Installled $1"
          else
            if ask "Install PPA support?" Y; then
              yes | sudo apt-get install software-properties-common
              sudo add-apt-repository -y ppa:$2
              sudo apt-get update
              yes | sudo apt-get install $1
              msg "Installled $1"
            else
              msg "Skipping"
            fi
          fi
        else
          sudo apt-get update
          yes | sudo apt-get install $1
          msg "Installled $1"
        fi
      else
        msg "Skipping $1"
      fi
      ;;

    fedora|rhel|centos)
      sudo yum update
      sudo yum install $1
      ;;

    darwin)
      CASK=$2
      CASK_CMD=$( ! [ -z "${CASK}" ] && echo "--cask")
      if ask "Install $1" Y; then
        brew update
        brew install ${CASK_CMD} $1
      fi
      ;;

    *)
      error "Unsupported OS"
      ;;
  esac
}
