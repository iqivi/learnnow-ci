#!/bin/bash
# Update & rebuild backend only

source "$(dirname "$0")/envsetup.sh"

echo "Updating backend..."

$DC down mysql_db
$DC build mysql_db
$DC up -d mysql_db
$DC restart nginx

