# Extracteur_M-t-o_groupe2
L'objectif du projet était de travailler sur la récupération automatique des données météo d'une ville à l'aide du service wttr.in en groupe avec de nouveaux outils de travail collaboratif (Jira, Teams et GitHub).

meteo.txt	: historique des relevés météo

meteo_brut.txt : données JSON récupérées depuis wttr.in

meteo_error.log	:journal des erreurs

meteo_YYYYMMDD.txt :archivage quotidien (avec l'option -a)

Automatisation avec CRON  
Pour éviter de lancer le script manuellement à chaque fois, il est possible d'utiliser CRON. Cet outil permet de programmer l'exécution automatique du script à des heures précises.  
Pour le configurer il suffit d'ouvrir un terminal Linux. 
Taper la commande suivante pour accéder aux tâches CRON :  crontab -e  

Ajouter cette ligne pour lancer le script toutes les heures : 0 * * * * /chemin/vers/Extracteur_Meteo.sh   (adapter le chemin)

Enregistrer les modifications et quitter. Le script se lancera automatiquement toutes les heures et ajoutera les nouvelles données météo dans le fichier meteo.txt.  

Pour vérifier que la tâche a bien été enregistrée, il suffit de taper :   crontab -l   
