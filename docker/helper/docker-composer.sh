#!/bin/bash

###################################
########## Docker Composer ########
###################################
# run composer commands directly in docker container

# include config
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/../config/docker-config.sh

BIN_DIR=`dirname $(readlink -f $0)`
ROOT_DIR=`dirname $BIN_DIR`

cd "$ROOT_DIR"

sudo docker exec -itu "$USER" ${CONTAINER_WEB} php -d memory_limit=-1 ./build/bin/composer.phar "$@"
