#!/bin/bash

# usage: ./docker_build.sh 8.0-pnc

BASE_IMAGE=gezp/ubuntu-desktop:18.04

# pull base iamge
docker pull ${BASE_IMAGE}
if [[ $? != 0 ]]; then 
    echo "Failed to pull docker image '${BASE_IMAGE}'"
    exit -2
fi

# build ubuntu-desktop-apollo image
DOCKER_TAG=${1}
docker build . --file Dockerfile \
             --build-arg BASE_IMAGE=${BASE_IMAGE} \
             --tag ubuntu-desktop-apollo:${DOCKER_TAG}

if [[ $? != 0 ]]; then 
    echo "Failed to build docker image 'ubuntu-desktop-apollo:${DOCKER_TAG}'"
    exit -3
fi

exit 0
