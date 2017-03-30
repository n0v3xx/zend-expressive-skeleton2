#!/bin/bash

###################################
########## Docker Build ###########
###################################
# Builds Docker images from a Dockerfile
# https://docs.docker.com/engine/reference/commandline/build/

BIN_DIR=`dirname $(readlink -f $0)`
ROOT_DIR=`dirname $BIN_DIR`

cd "$ROOT_DIR"

USER_ID=$(id -u)
GROUP_ID=$(id -g)
GROUP_NAME=$(id -gn)

sudo docker-compose stop

DOCKER_BUILD_ARGS=" \
    --build-arg USER_ID=$USER_ID \
    --build-arg USER_NAME=$USER \
    --build-arg GROUP_ID=$GROUP_ID \
    --build-arg GROUP_NAME=$GROUP_NAME \
    --build-arg USER_HOME=$HOME \
    $@"

sudo docker build $DOCKER_BUILD_ARGS .

#sudo docker-compose up -d