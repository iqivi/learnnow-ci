#!/bin/bash
# Update & rebuild frontend only

source "$(dirname "$0")/envsetup.sh"

echo "Updating web-app..."

# Pobierz najnowszy kod
cd $REPO_ROOT && $REPO sync learnnow-webapp

# Buduj i startuj kontener frontend
$DC down frontend
$DC build frontend
$DC up -d frontend
$DC restart nginx
