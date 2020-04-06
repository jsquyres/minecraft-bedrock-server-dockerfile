#!/bin/bash

# Make a Docker image with our Dockerfile
docker build \
       --tag minecraft-bedrock-server \
       .
