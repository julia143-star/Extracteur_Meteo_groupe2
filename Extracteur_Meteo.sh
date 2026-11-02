#!/bin/bash
ville=$1
donnees_meteoVille="meteo_ville.txt"
curl -s "https://wttr.in/${ville}?format=j1" >"$donnees_meteoVille"
