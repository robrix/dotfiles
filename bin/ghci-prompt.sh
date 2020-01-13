#!/usr/bin/env bash

printf "\e[46m\0%*s\r%s\e[m\0\n\e[1;36m\0λ \e[m\0" "$(tput cols)" "$(git describe --contains --all HEAD)" ""
