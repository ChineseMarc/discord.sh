#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/../src/import.sh

echo "Starting up hello world example"
create_bot $TOKEN
