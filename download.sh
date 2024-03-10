#!/bin/sh

set -e

GH_USER=quarenw
GH_REPO=".dot"
GH_BRANCH="new-setup"
SYS_PATH="${HOME}/${GH_USER}-${GH_REPO}-${GH_BRANCH}"

if [ $(command -v "wget") ] && [ $(command -v "tar") ]; then
  echo "[INFO] Let's get this puppy downloaded with wget"
  cd ${HOME} && \
  wget https://github.com/${GH_USER}/${GH_REPO}/archive/refs/heads/${GH_BRANCH}.tar.gz -O "${SYS_PATH}.tar.gz" && \
  tar -xzvf "${SYS_PATH}.tar.gz" && \
  mv "${HOME}/${GH_REPO}-${GH_BRANCH}/" "${HOME}/.dot" && \
  rm "${SYS_PATH}.tar.gz"
elif [ $(command -v "curl") ] && [ $(command -v "tar") ]; then
  echo "[INFO] Let's get this puppy downloaded with curl"
  cd ${HOME} && \
  curl -L https://github.com/${GH_USER}/${GH_REPO}/archive/refs/heads/${GH_BRANCH}.tar.gz -o "${SYS_PATH}.tar.gz" && \
  tar -xzvf "${SYS_PATH}.tar.gz" && \
  mv "${HOME}/${GH_REPO}-${GH_BRANCH}/" "${HOME}/.dot" && \
  rm "${SYS_PATH}.tar.gz"
else
  echo "[ERROR] Missing binaries"
  echo "[INFO] wget: $(command -v "wget")"
  echo "[INFO] curl: $(command -v "curl")"
  echo "[INFO] tar: $(command -v "tar")"
fi
