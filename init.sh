#!/bin/sh

FILE_PATH="$(pwd)"
FILE_NAME="greeting.sh"

if ! command -v jq > /dev/null 2>&1; then
	brew install jq
fi	

chmod +x "${FILE_PATH}/${FILE_NAME}"

echo "${FILE_PATH}/${FILE_NAME}" >> ~/.zshrc
echo "success"
