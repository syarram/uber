# Uber Data

Ce projet est un ensemble de script permettant de récupérer les données json emises par l'application uber.

## Récupération des données

Récupérer le token lié à son compte uber afin de pouvoir utiliser l'api de uber : 

> bash token.sh email password 

Récupération du json émit par l'api de uber à une position données

> bash get.sh your_token latitude longitude

Récupération des jsons à partir d'un fichier geojson

> bash storeByGeojson.sh your_token geojson_file path_to_store sleep_delay
