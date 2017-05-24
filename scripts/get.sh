#!/bin/bash

HOST="http://localhost:3000"

CREDENTIAL=$(./signin.sh)
ACCESS_TOKEN=$(echo "$CREDENTIAL" | jq -r '.["access-token"]')
MY_UID=$(echo "$CREDENTIAL" | jq -r .uid)
CLIENT=$(echo "$CREDENTIAL" | jq -r .client)
EXPIRY=$(echo "$CREDENTIAL" | jq -r .expiry)

curl -X GET -H "access-token: $ACCESS_TOKEN" -H "uid: $MY_UID" -H "client: $CLIENT" -H "expiry: $EXPIRY" $HOST/histories
