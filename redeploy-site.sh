#!/bin/bash

# Exit immediately if a command fails
set -e

# Change directory to project folder
cd /root/portfolio-zdm

# Fetch and reset git repository to latest main branch
git fetch && git reset origin/main --hard

# Spin down containers to prevent out of memory issues when building
docker compose -f docker-compose.prod.yml down

# Build and start containers
docker compose -f docker-compose.prod.yml up -d --build

# Print status
docker compose -f docker-compose.prod.yml ps
