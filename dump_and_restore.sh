#!/bin/bash

docker run --m -i postgres:15.4-alpine pg_dump -Fc -b -v -h {DBHOST} -p {DBPORT} -U {DBUSER} -d {DBNAME} -n {DBSCHEMA} > db-data-dump.pgdump

docker run -rm -i --net host -v $(pwd)/db-data-dump.pgdump:/db-data-dump.pgdump postgres:15.4-alpine pg_restore --create -d postgres --clean --no-acl --no-owner -h host.docker.internal -p 5432 -U username /db-data-dump.pgdump