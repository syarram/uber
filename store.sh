DATETIME=$(date +%Y%m%d%H%M%S)

TOKEN=$1
LAT=$2
LON=$3
STORE_PATH=$4

FILE_NAME=$(date +%Y%m%d%H%M%S)_$(echo "$LAT"_"$LON" | sed 's/\./-/g').json

bash get.sh $TOKEN $LAT $LON > $STORE_PATH/$FILE_NAME
echo -n "$STORE_PATH/$FILE_NAME : "
grep '"messageType":"OK"' $STORE_PATH/$FILE_NAME | wc -l | sed 's/1/SUCCESS/' | sed 's/0/ERROR/'