#!/bin/bash

# include config
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/../config/docker-config.sh

BIN_DIR=`dirname $(readlink -f $0)`
ROOT_DIR=`dirname $BIN_DIR`

cd "$ROOT_DIR"

USER_ID=$(id -u)
GROUP_ID=$(id -g)

sudo docker exec -it ${CONTAINER_WEB} find ./ -user root | xargs chown -R $USER_ID:$GROUP_ID