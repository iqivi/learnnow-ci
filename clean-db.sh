#!/bin/bash
# Reset MySQL database and its persistent volume
# Czyści wolumen: mysql_prod_data

source "$(dirname "$0")/envsetup.sh"

echo "!!! UWAGA: To polecenie CAŁKOWICIE USUNIE dane z bazy danych MySQL !!!"
read -p "Czy na pewno chcesz kontynuować? (y/N) " confirm

if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
    echo "Zatrzymywanie i usuwanie kontenera oraz wolumenu..."
    
    # -f wymusza stop, -v usuwa wolumeny (mysql_prod_data)
    $DC rm -svf mysql
    
    echo ""
    echo "✓ Baza została wyczyszczona (wolumen usunięty)."
    echo "Przy następnym uruchomieniu (./start-mysql.sh) baza zostanie zainicjalizowana na nowo."
else
    echo "Anulowano."
fi