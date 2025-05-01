#!/bin/bash
set -ex

VERSION=${1:-"latest"}

PACKAGE="google-cloud-sdk-gke-gcloud-auth-plugin=${VERSION}"
if [ $VERSION == "latest" ]; then
  PACKAGE="google-cloud-sdk-gke-gcloud-auth-plugin"
fi

apt update
apt install -y ${PACKAGE}

gke-gcloud-auth-plugin --version
