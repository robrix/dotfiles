#!/usr/bin/env bash

case $1 in
[1-9][0-9]*)
  cols="$1"
  shift
  ;;
*)
  cols="$(tput cols)"
  ;;
esac

branch="$(git describe --contains --all HEAD)"

printf "%*s\r%s" "$cols" "${branch:+($branch)}" "$@"
