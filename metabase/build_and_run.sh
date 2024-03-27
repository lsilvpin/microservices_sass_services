#!/bin/bash

docker build \
    -t metabase:1.0 \
    -f Dockerfile \
    .

docker container prune -f

docker run \
    -d \
    -p 3000:3000 \
    -e "MB_DB_TYPE"="postgres" \
    -e "MB_DB_DBNAME"="metabaseappdb" \
    -e "MB_DB_PORT"="5432" \
    -e "MB_DB_USER"="postgres" \
    -e "MB_DB_PASS"="postgres" \
    -e "MB_DB_HOST"="192.168.0.109" \
    --name metabase \
    metabase:1.0
