#!/bin/bash

#Processo de desligamento
backup() {
    echo "Container foi desligado, performando backup..."
    mv "./database.json" "./data/"
    cat "./data/database.json"
}

#Trap SIGTERM
trap 'true' SIGTERM SIGKILL

#Executa comando como Por exemplo o nodejs ou python.
while true; do
    :
    echo "{\"number\": $((1 + RANDOM % 100))}" >> database.json
    cat database.json
    sleep 60
done &

#Wait
wait $!

#Backup
backup
