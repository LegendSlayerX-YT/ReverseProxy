#!/usr/bin/env bash
#
# Start the reverse-proxy nginx container.
# Routes chess.chen-henry.org -> :8001 and math.chen-henry.org -> :8000
#
set -euo pipefail

# Run from the directory this script lives in, so docker-compose.yml is found.
cd "$(dirname "$0")"

# Tear down the old container and image so nothing stale is reused.
# --rmi all removes the images referenced in the compose file too.
echo "Stopping and removing old container/image..."
docker compose down --rmi all --remove-orphans

# Pull a fresh image and recreate the container from scratch.
echo
echo "Pulling latest image..."
docker compose pull

echo
echo "Starting reverse proxy..."
docker compose up -d --force-recreate

echo
echo "Status:"
docker compose ps

echo
echo "Recent logs:"
docker compose logs --tail=50 nginx
