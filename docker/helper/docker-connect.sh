#!/bin/bash

###############################################
########## Connect to Docker Container ########
###############################################

# include config
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/../config/docker-config.sh

sudo docker exec -it ${CONTAINER_WEB} /bin/bash