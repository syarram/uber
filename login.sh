. config.inc

EMAIL=$1
PASSWORD=$2

HELP="Utilisation : login.sh EMAIL PASSWORD"

if ! test "$EMAIL"; then
    echo "$HELP";
    exit;
fi

if ! test "$PASSWORD"; then
    echo "$HELP";
    exit;
fi

curl -s -X POST "$BASE_URL" -d "{\"email\":\"$EMAIL\",\"password\":\"$PASSWORD\",\"messageType\":\"Login\",\"app\":\"client\",\"language\":\"$LANG\"}"