#!/bin/bash

DATE=$1
TMP_DIR=/tmp/uber_archive_$DATE
TMP_JSON_DIR=$TMP_DIR/$DATE
BASE_DIR=/home/vince/bin/uber_data

if ! test "$DATE"; then
    echo "La date est requise en premier paramètre"
    exit;
fi

if test -e $BASE_DIR/datas_archives/$DATE.tar.gz ; then
    echo "Cette date a déjà été archivée"
    exit;
fi

cd $BASE_DIR && mkdir -p $TMP_JSON_DIR && find datas/ -type f -name $DATE* | sort > $TMP_DIR/list && cat $TMP_DIR/list | sed 's/^/cp /' | sed "s|$| $TMP_JSON_DIR/|" > $TMP_DIR/archive.sh && bash $TMP_DIR/archive.sh && cd $TMP_DIR && tar -zcf $BASE_DIR/datas_archives/$DATE.tar.gz $DATE/ && cd $BASE_DIR && cat $TMP_DIR/list | sed 's/^/rm /' > $TMP_DIR/delete.sh && bash $TMP_DIR/delete.sh && rm -rf $TMP_DIR
