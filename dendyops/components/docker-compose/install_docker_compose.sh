#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi

VERSION="$1"
if [ ! -n "${VERSION}" ]; then
    VERSION="v2.7.0"
fi


#sudo curl -L "https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
 curl -L "https://get.daocloud.io/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

 chmod +x /usr/local/bin/docker-compose
if [ ! -h /usr/bin/docker-compose ] ;then
 ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
fi
docker-compose --version

sudo docker-compose --version
