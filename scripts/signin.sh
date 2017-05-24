#!/bin/bash

RET=$(curl -v -H "Content-Type: application/json" -X POST -d '{"email":"test@test.com","password":"12345678"}' http://localhost:3000/auth/sign_in -v 2>&1)
ACCESS_TOKEN=$(echo "${RET}" | grep "access-token:" | sed 's/^.*: //g' | sed 's/[^a-zA-Z0-9_\-]$//g')
MY_UID=$(echo "${RET}" | grep "uid:" | sed 's/^.*: //g' | sed 's/[^a-zA-Z0-9_\-]$//g')
CLIENT=$(echo "${RET}" | grep "client:" | sed 's/^.*: //g' | sed 's/[^a-zA-Z0-9_\-]$//g')
EXPIRY=$(echo "${RET}" | grep "expiry:" | sed 's/^.*: //g' | sed 's/[^a-zA-Z0-9_\-]$//g')
echo "{\"access-token\": \"${ACCESS_TOKEN}\", \"uid\": \"${MY_UID}\", \"client\": \"${CLIENT}\", \"expiry\": \"${EXPIRY}\"}"
