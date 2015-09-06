#!/bin/bash

. config.inc

DATE=$1
TMP_UBER_DIR=/$TMP_DIR/uber_archive_$DATE
TMP_UBER_JSON_DIR=$TMP_UBER_DIR/$DATE

if ! test "$DATE"; then
    echo "La date est requise en premier paramètre"
    exit;
fi

if test -e $BASE_DIR/datas_archives/$DATE.tar.gz ; then
    echo "Cette date a déjà été archivée"
    exit;
fi

cd $BASE_DIR && mkdir -p $TMP_UBER_JSON_DIR && find datas/ -type f -name $DATE* | sort > $TMP_UBER_DIR/list && cat $TMP_UBER_DIR/list | sed 's/^/cp /' | sed "s|$| $TMP_UBER_JSON_DIR/|" > $TMP_UBER_DIR/archive.sh && bash $TMP_UBER_DIR/archive.sh && cd $TMP_UBER_DIR && tar -zcf $BASE_DIR/datas_archives/$DATE.tar.gz $DATE/ && cd $BASE_DIR && cat $TMP_UBER_DIR/list | sed 's/^/rm /' > $TMP_UBER_DIR/delete.sh && bash $TMP_UBER_DIR/delete.sh && rm -rf $TMP_UBER_DIR
