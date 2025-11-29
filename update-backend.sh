#!/bin/bash
# Update & rebuild backend only

source "$(dirname "$0")/envsetup.sh"

echo "Updating backend..."
cd $BACKEND_DIR || exit 1

git pull origin main

$DC build backend
$DC up -d backend
