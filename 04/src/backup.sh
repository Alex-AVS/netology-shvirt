#!/bin/bash
cd /opt
. env.sh
now=$(date +"%s_%Y-%m-%d")

docker run \
    --rm --entrypoint "" \
    -v `pwd`/backup:/backup \
    --network="shvirtd-example-python_backend" \
    avssys/mysqldump-my \
    mysqldump --opt -h $DB_HOST -u $DB_USER -p"$DB_PASSWORD" "--result-file=/backup/$DB_DATABASE-$now.sql" $DB_DATABASE