#!/bin/sh

JSON_FILE="$(dirname $0)/db.json"

LENGTH=$(jq length "$JSON_FILE")

RANDOM_INDEX=$((RANDOM % LENGTH))

RANDOM_OBJECT=$(jq -r ".[$RANDOM_INDEX]" "$JSON_FILE")

KEY=$(echo "$RANDOM_OBJECT" | jq -r 'keys_unsorted[0]')
VALUE=$(echo "$RANDOM_OBJECT" | jq -r ".\"$KEY\"")

echo "[$KEY]"
echo "$VALUE"