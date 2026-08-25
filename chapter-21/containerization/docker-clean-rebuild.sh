#!/bin/bash

# Robust Docker cleanup and rebuild script for all project and infra containers
# Services: eureka-server, gateway-server, inventory-ms, user-ms, postgres, mongo, zipkin, keycloak
# Usage: ./docker-clean-rebuild.sh [--purge-images]

set -euo pipefail

PROJECT_NAME="bookstore"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMPOSE_FILE="$SCRIPT_DIR/docker-compose.yml"
COMPOSE_CMD=(docker compose -f "$COMPOSE_FILE")
PURGE_IMAGES=false

if [[ "${1:-}" == "--purge-images" ]]; then
  PURGE_IMAGES=true
fi

echo "[INFO] Stopping all running containers related to the project and infra..."
docker ps -a --format '{{.Names}}' | grep -E 'eureka|gateway|inventory|user|postgres|mongo|zipkin|keycloak' | xargs -r docker stop || true

echo "[INFO] Removing all containers related to the project and infra..."
docker ps -a --format '{{.Names}}' | grep -E 'eureka|gateway|inventory|user|postgres|mongo|zipkin|keycloak' | xargs -r docker rm -f || true

if [[ "$PURGE_IMAGES" == true ]]; then
  echo "[INFO] Removing all images related to the project and infra (--purge-images enabled)..."
  docker images --format '{{.Repository}}:{{.Tag}} {{.ID}}' | grep -E 'eureka|gateway|inventory|user|postgres|mongo|zipkin|keycloak' | awk '{print $2}' | xargs -r docker rmi -f || true
else
  echo "[INFO] Keeping existing downloaded images (pass --purge-images to remove them)."
fi

echo "[INFO] Removing all volumes related to the project and infra..."
docker volume ls --format '{{.Name}}' | grep -E 'eureka|gateway|inventory|user|postgres|mongo|zipkin|keycloak' | xargs -r docker volume rm || true

echo "[INFO] Removing all networks related to the project and infra..."
docker network ls --format '{{.Name}}' | grep -E 'eureka|gateway|inventory|user|postgres|mongo|zipkin|keycloak' | xargs -r docker network rm || true

echo "[INFO] Pruning unused Docker resources (optional)..."
docker system prune -f

if "${COMPOSE_CMD[@]}" config | grep -q '^[[:space:]]*build:'; then
  echo "[INFO] Building latest images from local Dockerfiles..."
  "${COMPOSE_CMD[@]}" build --no-cache
else
  echo "[INFO] No build contexts found in compose file. Pulling images instead..."
  "${COMPOSE_CMD[@]}" pull
fi

echo "[INFO] Starting up all services with Docker Compose..."
"${COMPOSE_CMD[@]}" up -d --remove-orphans

echo "[SUCCESS] All containers rebuilt and started."
