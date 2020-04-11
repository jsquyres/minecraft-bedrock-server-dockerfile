#!/bin/bash

set -x

docker kill squyres.com-minecraft-bedrock-server
docker rm squyres.com-minecraft-bedrock-server

docker image rm minecraft-bedrock-server
