#!/bin/bash
# Update & rebuild backend only

source "$(dirname "$0")/envsetup.sh"

echo "Updating backend..."
cd $BACKEND_DIR || exit 1

cd $REPO_ROOT && repo sync backend

$DC down backend
$DC build backend
$DC up -d backend
$DC restart nginx

