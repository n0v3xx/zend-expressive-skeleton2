#!/bin/bash

# include config
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/../config/docker-config.sh

echo "This is what you want to delete:"
echo "Container: " $(sudo docker ps -a | grep "${DOCKER_ALIAS}" | awk '{print $2}')
echo "Images: "$(sudo docker images | grep "${DOCKER_ALIAS}" | awk '{print $1}')
echo "__________________________________________________________________________"
read -p "Do you really want to delete the project docker container and images? (y)" answer
if [ "$answer" == "y" ]
    then
        echo "Start"

        # stop all running containers
        sudo docker stop $(sudo docker ps -a | grep "${DOCKER_ALIAS}" | awk '{print $1}')

        # delete all containers
        sudo docker rm -f $(sudo docker ps -a | grep "${DOCKER_ALIAS}" | awk '{print $1}')

        # delete all images
        sudo docker rmi -f $(sudo docker images | grep "${DOCKER_ALIAS}" | awk '{print $3}')

        echo "Finish"
    else
        echo "Feels bad man :("

fi