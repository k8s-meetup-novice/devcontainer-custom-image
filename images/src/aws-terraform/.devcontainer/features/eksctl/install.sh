#!/bin/bash
set -ex

VERSION=${1:-"latest"}
DOWNLOAD_DIR=$(mktemp -d /tmp/eksctl.XXXXXX)
INSTALL_DIR="/usr/local/bin/"

ARCH="amd64"
if [ $(uname -m) == "aarch64" ]; then
  ARCH="arm64"
fi
PLATFORM=$(uname -s)_$ARCH
FILENAME="eksctl_${PLATFORM}.tar.gz"

DOWNLOAD_URL_BASE="https://github.com/eksctl-io/eksctl/releases/download/${VERSION}"
if [ $VERSION == "latest" ]; then
  DOWNLOAD_URL_BASE="https://github.com/eksctl-io/eksctl/releases/latest/download"
fi

cd $DOWNLOAD_DIR
sudo curl --fail -sS -L -o $FILENAME "${DOWNLOAD_URL_BASE}/eksctl_$PLATFORM.tar.gz"
curl -sL "${DOWNLOAD_URL_BASE}/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check

sudo tar -zxvf $FILENAME > /dev/null
sudo mv eksctl $INSTALL_DIR
sudo rm -fr $DOWNLOAD_DIR

eksctl version
