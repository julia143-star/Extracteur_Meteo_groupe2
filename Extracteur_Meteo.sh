#!/bin/bash

# V3 : lecture des arguments (ville + option -a pour l'archivage)
archive=0
ville=""
for arg in "$@"
do
    if [ "$arg" = "-a" ]
    then
        archive=1
    else
        ville="$arg"
    fi
done

# paris comme ville par defaut
if [ -z "$ville" ]
then
    ville="Paris"
fi

fichier_brut="meteo_brut.txt"
curl -s "https://wttr.in/${ville}?format=j1" > "$fichier_brut"

# vérifier que fichier_brut n'est pas vide
if [ ! -s "$fichier_brut" ]
then
    echo "Erreur : impossible de récupérer les données météo."
    exit 1
fi

#température actuelle
temp_actuelle=$(grep -m1 '"temp_C"' "$fichier_brut" | tr -cd '0-9-')
#température lendemain
temp_demain=$(grep '"avgtempC"' "$fichier_brut" | head -n 2 | tail -n 1 | tr -cd '0-9-')

# récup de la date et de l'heure
date_actuelle=$(date +"%Y-%m-%d")
heure_actuelle=$(date +"%H:%M")
# Enregistrement dans le fichier final
echo "${date_actuelle} - ${heure_actuelle} - ${ville} : ${temp_actuelle}°C - ${temp_demain}°C" >> meteo.txt
echo "Météo enregistrée dans meteo.txt"

# V3 : archivage dans un fichier par jour (meteo_YYYYMMDD.txt)
if [ "$archive" -eq 1 ]
then
    date_fichier=$(echo "$date_actuelle" | tr -d '-')
    fichier_archive="meteo_${date_fichier}.txt"
    echo "${date_actuelle} - ${heure_actuelle} - ${ville} : ${temp_actuelle}°C - ${temp_demain}°C" >> "$fichier_archive"
    echo "Météo archivée dans ${fichier_archive}"
fi
