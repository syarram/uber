. config.inc

TOKEN=$1
LAT=$2
LON=$3
EPOCH=$((`date +%s`*1000+`date +%-N`/1000000))

HELP="Utilisation : get.sh TOKEN LATITUDE LONGITUDE
/?\ Récupération du token : token.sh EMAIL PASSWORD"

if ! test "$TOKEN"; then
    echo "$HELP";
    exit;
fi

if ! test "$LAT"; then
    echo "$HELP";
    exit;
fi

if ! test "$LON"; then
    echo "$HELP";
    exit;
fi

curl -s -X POST "$BASE_URL" -d "{\"messageType\":\"PingClient\",\"token\":\"$TOKEN\",\"app\":\"client\",\"language\":\"$LANG\",\"epoch\":$EPOCH,\"latitude\":$LAT,\"longitude\":$LON}"