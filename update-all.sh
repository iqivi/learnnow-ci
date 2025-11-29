#!/bin/bash
# Update & rebuild everything (frontend + backend + nginx)

source "$(dirname "$0")/envsetup.sh"

echo "Updating all services..."

# Pull repos
cd $FRONTEND_DIR && git pull origin main
cd $BACKEND_DIR && git pull origin main
cd $INFRA_DIR && git pull origin dev || echo "Infra repo may be local-only"

# Rebuild & start containers
$DC build
$DC up -d
