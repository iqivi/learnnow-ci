#!/bin/bash
# Update & rebuild backend only

source "$(dirname "$0")/envsetup.sh"

echo "Updating backend..."

cd $REPO_ROOT && $REPO sync backend

$DC down backend
$DC build backend
$DC up -d backend
$DC restart nginx

