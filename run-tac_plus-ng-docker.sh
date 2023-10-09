#!/bin/bash

# Clone tac_plus-ng repository
git clone https://github.com/MarcJHuber/event-driven-servers/

# Create log directories
sudo mkdir -p /var/log/tac_plus-ng/{authentication,authorization,accounting}

# Build and start services using docker compose
docker compose up -d

# Show docker containers is running
docker ps | grep tac_plus-ng-docker
