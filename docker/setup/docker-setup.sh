#!/bin/bash

######################################
########## Start Docker Setup ########
######################################

# include config
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/../config/docker-config.sh

# set permissions
chmod 775 -R docker/setup/*
echo "You choose: PHP 7"
./docker/setup/docker-prepare-php7.sh

# run deplyoment
sudo docker exec -itu "$USER" ${CONTAINER_WEB} ./docker/setup/build-setup.sh