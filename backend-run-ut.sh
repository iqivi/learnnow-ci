#!/bin/bash
# Skrypt do uruchamiania testów jednostkowych backendu

# Załadowanie środowiska i zmiennych (REPO_ROOT, DC, REPO)
source "$(dirname "$0")/envsetup.sh"

echo "-------------------------------------------------------"
echo "STARTING BACKEND UNIT TESTS"
echo "-------------------------------------------------------"

# 1. Pobierz najnowszy kod backendu
echo "Syncing backend code..."
cd $REPO_ROOT && $REPO sync learnnow-backend

# 2. Uruchom kontener testowy
# --profile test: aktywuje profil z docker-compose.yml
# run --rm: uruchamia testy i usuwa kontener natychmiast po zakończeniu
echo "Executing: $DC --profile test run --rm backend-test"
$DC --profile test run --rm backend-test

# Skrypt automatycznie zwróci kod wyjścia (exit code) z mvn test.
# Jeśli testy padną, Jenkins oznaczy build jako FAILED.