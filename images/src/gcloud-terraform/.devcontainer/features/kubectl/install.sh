#!/bin/bash
set -ex

VERSION=${1:-"latest"}

PACKAGE="kubectl=${VERSION}"
if [ $VERSION == "latest" ]; then
  PACKAGE="kubectl"
fi

grep -rhE ^deb /etc/apt/sources.list* | grep "cloud-sdk"
apt update
apt install -y ${PACKAGE}

kubectl version --client
