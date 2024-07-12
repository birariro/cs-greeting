#!/bin/sh

## random 'question type' select
JSON_FILES=("$(dirname $0)"/db/*.json)
JSON_FILES_SIZE=${#JSON_FILES[@]}
RANDOM_INDEX=$(( RANDOM % JSON_FILES_SIZE ))
JSON_FILE="${JSON_FILES[$RANDOM_INDEX]}"

## 'question type' print
FILE_NAME=$(basename "$JSON_FILE")
echo "[ ${FILE_NAME%.json} ]"

## random 'question type' in question select
LENGTH=$(jq length "$JSON_FILE")
RANDOM_INDEX=$((RANDOM % LENGTH))
RANDOM_OBJECT=$(jq -r ".[$RANDOM_INDEX]" "$JSON_FILE")

## question parsing
KEY=$(echo "$RANDOM_OBJECT" | jq -r 'keys_unsorted[0]')
VALUE=$(echo "$RANDOM_OBJECT" | jq -r ".\"$KEY\"")

# 맞침표(.) 뒤에 개행 문자
if [[ "$VALUE" == *".  "* ]]; then
    output=$(echo "$VALUE" | sed 's/\.  /.\n/g')
elif [[ "$VALUE" == *". "* ]]; then
    output=$(echo "$VALUE" | sed 's/\. /.\n/g')
else 
    output="$VALUE"
fi

echo "[ $KEY ]"
echo ""
echo "$output"
echo ""