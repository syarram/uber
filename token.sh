. config.inc

EMAIL=$1
PASSWORD=$2

HELP="Utilisation : token.sh EMAIL PASSWORD"

if ! test "$EMAIL"; then
    echo "$HELP";
    exit;
fi

if ! test "$PASSWORD"; then
    echo "$HELP";
    exit;
fi

bash login.sh $EMAIL $PASSWORD | grep -Eo '"token":"[a-z0-9]+"' | sed 's/"token":"//' | sed 's/"//'