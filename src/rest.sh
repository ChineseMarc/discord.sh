#!/usr/bin/zsh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/util.sh

DEFAULT_URL_BASE="https://discordapp.com/api"
URL_BASE=${DISCORD_API_URL:-$DEFAULT_URL_BASE}

function r() {
  local token=$1
  local method=$2
  local route=$3

  local url="$URL_BASE/$route"
  debug "Attempting to load url $url"

  res=$(curl -k -s \
       -w " %{http_code}" \
       -H "Authorization: $token" \
       -H "Content-Type: application/json" \
       -X $method \
       $URL_BASE/$route | tr -d '\n')
  echo $res
}
