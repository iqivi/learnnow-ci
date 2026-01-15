#!/bin/bash
# Start MySQL container only (without rebuild)
# Dla developera uruchamiającego backend lokalnie przez IntelliJ

source "$(dirname "$0")/envsetup.sh"

echo "Starting MySQL container..."

$DC up -d mysql

# Przeczytaj port z pliku .env
MYSQL_PORT=$(grep MYSQL_EXTERNAL_PORT $INFRA_DIR/.env | cut -d '=' -f2)

echo ""
echo "✓ MySQL uruchomiony!"
echo ""
echo "Dla developera (IntelliJ/lokalny backend):"
echo "  Hostname: localhost"
echo "  Port: $MYSQL_PORT"
echo "  Database: $(grep DB_NAME $INFRA_DIR/.env | cut -d '=' -f2)"
echo "  User: $(grep DB_USER $INFRA_DIR/.env | cut -d '=' -f2)"
echo "  Password: $(grep DB_PASSWORD $INFRA_DIR/.env | cut -d '=' -f2)"
echo ""
