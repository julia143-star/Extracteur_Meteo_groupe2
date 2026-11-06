# Extracteur_M-t-o_groupe2

L'objectif du projet :
Ce projet a pour but de travailler sur la récupération automatique des données météo d'une ville à l'aide du service wttr.in en groupe avec de nouveaux outils de travail collaboratif (Jira, Teams et GitHub).

Prérequis : 
  git bash
  Curl 
  Connexion Internet

Branche Version 1:
Cette première version du script Extracteur_Meteo.sh permet de récupérer les informations météorologiques d'une ville passée en argument lors de l'exécution et si aucun argument n'est fourni le script retourne une erreur.
Le script utilise la commande curl pour récupérer les données météo depuis le site wttr.in. Les informations importantes sont ensuite extraites à l'aide de commandes grep notamment la température actuelle (temp_actuelle) et la température moyenne prévue pour le lendemain (temp_demain).

Branche Version 2 :
Cette version introduit l'automatisation du script grâce à Cron.
Cron permet de programmer l'exécution automatique du script à des horaires définis sans intervention de l'utilisateur.Pour accéder à la configuration des tâches Cron (crontab -e).

Branche Version 3 :
Cette 3eme version du script apporte plusieurs améliorations :
Possibilité de lancer le script sans préciser de ville. Dans ce cas, la ville de Paris est utilisée par défaut.
Ajout de l'option -a permettant d'archiver automatiquement les relevés météo dans un fichier journalier.
Création d'un fichier d'archive nommé selon la date de l'éxécution : meteo_YYYYMMDD.txt
Exemple : meteo_20261105.txt

Branche Version 4 (la Variante 3) :
La branche 4 ajoute une gestion des erreurs liées à la récupération des données météo. Lorsque la connexion au service wttr.in fonctionne correctement les données sont enregistrées dans le fichier meteo_brut.txt
Par contre, si les données ne peuvent pas être récupérées (problème réseau ou indisponibilité du service), le fichier reste vide.
Le script détecte alors cette situation et enregistre automatiquement l'erreur dans un fichier de journalisation meteo_error.log.
Chaque erreur est accompagnée de la date et de l'heure de l'incident afin d'en faciliter le suivi.

Fichiers générés :

meteo.txt	: historique des relevés météo

meteo_brut.txt : données JSON récupérées depuis wttr.in

meteo_error.log	:journal des erreurs

meteo_YYYYMMDD.txt :archivage quotidien (avec l'option -a)

Utilisation du script :

Exécution simple :   ./Extracteur_Meteo.sh Toulouse

Exécution avec archivage :    ./Extracteur_Meteo.sh Toulouse -a

Exécution sans préciser de ville :    ./Extracteur_Meteo.sh                                                                             
Le script utilisera alors Paris comme ville par défaut.
