#!/bin/bash

ville=$1
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

