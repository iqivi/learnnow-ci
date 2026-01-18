#!/bin/bash
# Skrypt do uruchamiania testów jednostkowych backendu z wymuszeniem przebudowy

# Załadowanie środowiska i zmiennych
source "$(dirname "$0")/envsetup.sh"

echo "-------------------------------------------------------"
echo "STARTING BACKEND UNIT TESTS"
echo "-------------------------------------------------------"

# 1. Synchronizacja kodu
# UWAGA: Jeśli poprawiłeś testy lokalnie na serwerze, upewnij się, że 
# zrobiłeś commit/push, inaczej 'repo sync' może nadpisać Twoje poprawki!
echo "Syncing backend code..."
cd $REPO_ROOT && $REPO sync learnnow-backend

# 2. Uruchomienie testów z flagą --build
# --build: gwarantuje, że Docker skopiuje najnowsze zmiany w kodzie do obrazu
# --rm: usuwa kontener po zakończeniu
echo "Executing: $DC --profile test run --build --rm backend-test mvn clean test"
$DC --profile test run --build --rm backend-test mvn clean test