#!/bin/sh

set -e

echo "[INFO] Let's get this puppy downloaded"
cd ${HOME}/ && \
wget -T 60 https://github.com/quarenw/.dot/archive/refs/heads/master.zip && \
unzip master.zip && \
mv .dot-master .dot

