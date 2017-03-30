#!/bin/bash

# stop all running containers
sudo docker stop $(sudo docker ps -a -q)

# delete all containers
sudo docker rm $(sudo docker ps -a -q)

# delete all images
sudo docker rmi $(sudo docker images -q)