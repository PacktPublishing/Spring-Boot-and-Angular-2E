#!/bin/bash
set -euo pipefail

echo "Stopping and removing all containers, volumes, and networks..."
docker compose down -v --remove-orphans

echo "Pulling latest images..."
docker compose pull

echo "Starting all services..."
docker compose up -d

echo "Done. Run 'docker compose ps' to check status."