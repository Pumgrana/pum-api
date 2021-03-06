#!/bin/bash

if [ "$#" -ne "1" ]; then
    echo "Usage: $0 file_to_insert"
    exit 418
fi

HOST="http://localhost:3000"
FILE=$1

CREDENTIAL=$(./signin.sh)
ACCESS_TOKEN=$(echo "$CREDENTIAL" | jq -r '.["access-token"]')
MY_UID=$(echo "$CREDENTIAL" | jq -r .uid)
CLIENT=$(echo "$CREDENTIAL" | jq -r .client)
EXPIRY=$(echo "$CREDENTIAL" | jq -r .expiry)

curl -X POST -H "access-token: $ACCESS_TOKEN" -H "uid: $MY_UID" -H "client: $CLIENT" -H "expiry: $EXPIRY" -H "Content-Type: application/json" -d @$FILE $HOST/histories
