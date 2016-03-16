#!/usr/bin/zsh

USER_OBJ_KEYS="id username discriminator verified bot email avatar"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/rest.sh
source $DIR/util.sh

declare -A BOT

function create_bot () {
  local bot_token=$1

  local me="$(r $bot_token "GET" "users/@me")"
  local me_code=$(r_code "$me")
  local me_data=$(r_data "$me")

  if ! [[ $me_code == "200" ]]; then
    debug "Error getting user profile, is the token correct? ($me_code $me_data)"
  else
    debug "Got user profile: $me_data"
  fi

  # Create a user hash from the payload
  for k in $USER_OBJ_KEYS; do
    BOT[$k]=`strip '"' $(key "$me_data" "$k")`
  done

  # We're logged on!
  echo "Logged on with ${BOT["username"]}#${BOT["discriminator"]}"
}
