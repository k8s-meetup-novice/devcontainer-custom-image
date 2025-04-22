#!/bin/bash
set -ex

VERSION=${1:-"latest"}

PACKAGE="google-cloud-cli=${VERSION}"
if [ $VERSION == "latest" ]; then
  PACKAGE="google-cloud-cli"
fi

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list 
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
apt update -y
apt install ${PACKAGE} -y

gcloud version