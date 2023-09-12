#!/bin/bash

echo "Dumping the database from the cloud"

# dump the cloud database
export PGPASSWORD=${CLOUD_DB_PASSWORD}
pg_dump -Fc -b -v -h ${CLOUD_DBHOST} -p ${CLOUD_DBPORT} -U ${CLOUD_DBUSER} -d ${CLOUD_DBNAME} -n ${CLOUD_DBSCHEMA} > ./db-data-dump.pgdump

# sleep for a while, wait for the local postgres instance ready
sleep 5

# restore the db into the local postgres instance.
PGPASSWORD=${POSTGRES_PASSWORD} 
pg_restore --create -d ${POSTGRES_DB} --clean --no-acl --no-owner -h temp_instance -p ${POSTGRES_PORT} -U ${POSTGRES_USER} ./db-data-dump.pgdump

echo "Database restored successfully"
