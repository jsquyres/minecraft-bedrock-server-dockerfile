#!/bin/bash

# Make a Docker image with our Dockerfile
my_uid=`id -u`
docker build \
       --build-arg uid=$my_uid \
       --tag minecraft-bedrock-server \
       .
