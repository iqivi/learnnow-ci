#!/bin/bash
# Update & rebuild frontend only

source "$(dirname "$0")/envsetup.sh"

echo "Updating web-app..."
cd $FRONTEND_DIR || exit 1

# Pobierz najnowszy kod
cd $REPO_ROOT && repo sync learnnow-webapp

# Buduj i startuj kontener frontend
$DC down frontend
$DC build frontend
$DC up -d frontend
$DC restart nginx
