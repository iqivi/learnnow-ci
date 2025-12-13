#!/bin/bash
# CI Environment setup
# Ustawia zmienne do łatwego użycia docker-compose i katalogów

# Root repo
export REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export INFRA_DIR="$REPO_ROOT/infra"
export FRONTEND_DIR="$REPO_ROOT/web-app"
export BACKEND_DIR="$REPO_ROOT/backend"

# Docker Compose command
export DC="docker compose -f $INFRA_DIR/docker-compose.yml"
export REPO="$REPO_ROOT/ci/bin/repo"

echo "Environment initialized:"
echo "  REPO_ROOT=$REPO_ROOT"
echo "  INFRA_DIR=$INFRA_DIR"
echo "  FRONTEND_DIR=$FRONTEND_DIR"
echo "  BACKEND_DIR=$BACKEND_DIR"
echo "  DC command=$DC"
echo "  Repo tool path=$REPO"

# Load this script using: source envsetup.sh
