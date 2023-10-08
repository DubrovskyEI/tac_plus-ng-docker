#!/bin/bash

# Clone tac_plus-ng repository
git clone https://github.com/MarcJHuber/event-driven-servers/

# Build docker image
docker build -t tac_plus-ng-docker .

# Create log directories
mkdir -p ./tac_plus-ng-logs/{authentication,authorization,accounting}

# Run docker_tacacs container
docker run --rm -d -v ./tac_plus-ng:/usr/local/etc/ -v ./tac_plus-ng-logs:/var/log/tac_plus-ng/ -p 49:49 --name tac_plus-ng-docker tac_plus-ng-docker

# Show docker ps is running
docker ps | grep tac_plus-ng-docker
