#!/bin/bash

#Define cleanup procedure
cleanup() {
    cat "./database.json"
    mv "./database.json" "./data/"
    echo "Container stopped, performing cleanup..."
}

#Trap SIGTERM
trap 'true' SIGTERM SIGKILL

number=""number""

#Execute command
while true; do
    :
    echo "{\"number\": $((1 + RANDOM % 100))}" >> database.json
    sleep 30
done &

#Wait
wait $!

#Cleanup
cleanup
