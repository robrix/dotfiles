#!/usr/bin/env bash

printf "%*s\r%s" "$(tput cols)" "$(git describe --contains --all HEAD)" ""
