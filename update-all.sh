#!/bin/bash
# Update & rebuild everything (frontend + backend + nginx)

source "$(dirname "$0")/envsetup.sh"

echo "Updating all services..."

# Pull repos
cd $REPO_ROOT && repo sync


# Rebuild & start containers
$DC down
$DC build
$DC up -d
