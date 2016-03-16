#!/usr/bin/zsh

USE_DEBUG=${DEBUG:1}

function debug() {
  local msg=$1
  if [[ $DEBUG == '1' ]]; then
    echo "[DEBUG] $msg" 1>&2
  fi
}

function strip() {
  local char=$1
  result="${2%\"}"
  result="${result#\"}"
  echo $result
}

function r_data() {
  local data=$1
  echo "$data" | sed -rn 's/(\{.+)\} ([0-9]+)$/\1}/p'
}

function r_code() {
  local data=$1
  echo "$data" | sed -rn 's/(\{.+)\} ([0-9]+)$/\2/p'
}

function key() {
  local data=$1
  local key=$2
  echo "$data" | jq ".$key"
}

