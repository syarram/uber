TOKEN=$1
GEOJSON_FILE=$2
STORE_PATH=$3
SLEEP_DELAY=$4

HELP="Utilisation : storeByGeojson.sh TOKEN GEOJSON_FILE STORE_PATH SLEEP_DELAY"

if ! test "$TOKEN"; then
    echo "$HELP";
    exit;
fi

if ! test "$GEOJSON_FILE"; then
    echo "$HELP";
    exit;
fi

if ! test "$STORE_PATH"; then
    echo "$HELP";
    exit;
fi

if ! test "$SLEEP_DELAY"; then
    echo "$HELP";
    exit;
fi

bash geojson2LatLon.sh $GEOJSON_FILE | while read coordinates
do 
    bash store.sh $TOKEN $coordinates $STORE_PATH
    sleep $SLEEP_DELAY
done