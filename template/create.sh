#!/bin/bash

# CONFIURATION

# The image to base the container on
BASE_IMAGE="ubuntu:18.04"

# Name for the service in docker-compose
CONTAINER_NAME="mc-ftb"

# Port forward. Indent 6 spaces and watch the linefeeds"
PORTS=$"ports:\n\
      - '25565:25565\/tcp'\n\
      - '25575:25575\/tcp'"

# Maximum memory (ram) for the container
MEM_LIMIT="1000m"

# Maximum CPU usage in percent for the container
CPU_PERCENT="80"

# Overwrite the ${uid} in docker-compose by putting a # at the end
FORCE_UID="1234 #" # " 1234 #"

# This is injected into the beginning of the Dockerfile
FORCE_DOCKER_RUN="RUN apt-get update" # "RUN apt-get update"


if [ -z "$1" ]; then
  echo "Usage: $(basename $0) [new directory]"
  exit 1
fi

read -p "This script is not stable yet. Are you shure you want to execute it? (y/n): " yn
if [ "$yn" != "y" ]; then
  echo "Not doing anything..."
  exit 0
fi

mkdir -p "$1"
cp -r ./* "$1/"
cd "$1"

sed -i -e "s/{{CONTAINER_NAME}}/$CONTAINER_NAME/g" docker-compose.yml
sed -i -e "s/{{MEM_LIMIT}}/$MEM_LIMIT/g" docker-compose.yml
sed -i -e "s/{{CPU_PERCENT}}/$CPU_PERCENT/g" docker-compose.yml
sed -i -e "s/{{PORTS}}/$PORTS/g" docker-compose.yml
sed -i -e "s/{{FORCE_UID}}/$FORCE_UID/g" docker-compose.yml
sed -i -e "s/{{BASE_IMAGE}}/$BASE_IMAGE/g" Dockerfile
sed -i -e "s/{{FORCE_DOCKER_RUN}}/$FORCE_DOCKER_RUN/g" Dockerfile
