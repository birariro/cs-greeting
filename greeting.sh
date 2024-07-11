#!/bin/sh

JSON_FILE="$(dirname $0)/db.json"

LENGTH=$(jq length "$JSON_FILE")

RANDOM_INDEX=$((RANDOM % LENGTH))

RANDOM_OBJECT=$(jq -r ".[$RANDOM_INDEX]" "$JSON_FILE")

KEY=$(echo "$RANDOM_OBJECT" | jq -r 'keys_unsorted[0]')
VALUE=$(echo "$RANDOM_OBJECT" | jq -r ".\"$KEY\"")



# 맞침표(.) 뒤에 개행 문자 추가
if [[ "$VALUE" == *"."* ]]; then
    output=$(echo "$VALUE" | sed 's/\./.\n/')
else
    output="$VALUE"
fi

# 결과 출력
echo "[ $KEY ]"
echo "$output"
echo ""