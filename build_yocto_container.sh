#!/bin/bash

# Script name: build_mdm9607_docker.sh

# Name of container
DOCKER_NAME=build_mdm9607_linux6_$USER

# Username of host PC
HOST_USER=$USER

# Username of docker image
DOCKER_USER=user

# gitconfig on Host machine,
GIT_CONF=/home/$HOST_USER/.gitconfig
GIT_CRED=/home/$HOST_USER/.git-credentials

# SSH dir on Host machine
SSH_PATH=/home/$HOST_USER/.ssh

# Qualcomm_Tools that was extracted above
QC_TOOLS=/home/bonsaitama/Workspaces/Companies/Cavli/Qualcomm_Tools_Server

# Your workspace folder
WORK_SPACE=/home/bonsaitama/Workspaces/Companies/Cavli

# Build container
docker run --name $DOCKER_NAME -dit --privileged \
    -u $DOCKER_USER \
    -h $DOCKER_NAME \
    -v /dev/bus/usb/:/dev/bus/usb \
    -v /etc/localtime:/etc/localtime:ro  \
    -v $GIT_CONF:/home/$DOCKER_USER/.gitconfig \
    -v $GIT_CRED:/home/$DOCKER_USER/.git-credentials \
    -v $SSH_PATH:/home/$DOCKER_USER/.ssh:ro \
    -v $WORK_SPACE:/home/$DOCKER_USER/workspace \
    -v $QC_TOOLS:/pkg \
    yocto_docker_image bash
