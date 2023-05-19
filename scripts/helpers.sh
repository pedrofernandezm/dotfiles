#!/bin/bash

set encoding=utf-8

#OUTPUT
NORMAL_OUPUT="2>&1"
SILENT_OUTPUT="/dev/null"

#EMOJIS
ARROW="\xE2\x9E\xA1"
ARROW_DOWN="\xE2\xAC\x87"
GEAR="\xE2\x9A\x99\xEF\xB8\x8F"
SMALL_BLUE_DIAMOND="\xF0\x9F\x94\xB9"
CHECK="\xE2\x9C\x85"
HOURGLASS="\xE2\x8F\xB3"
SMILING_FACE_SUNGLASSES="\xF0\x9F\x98\x8E"
WARNING="\xe2\x9a\xa0\xef\xb8\x8f"

## Fonts
BOLD=$(tput bold)
UNDERLINE=$(tput sgr 0 1)
RESET=$(tput sgr0)

#COLORS
PURPLE=$(tput setaf 171)
RED=$(tput setaf 1)
GREEN=$(tput setaf 76)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
# RED='\e[31m'
# GREEN='\e[32m'
# YELLOW='\e[33m'
# GREY='\e[90m'
# NO_COLOR='\e[0m' # No Color

function p_title {
  printf "\n${GEAR}  ${BLUE}${BOLD}$@\n---------------------------------------------------${RESET}\n"
}

function p_wait {
  printf "\n${HOURGLASS} ${@}\n"
}

function p_warn {
  printf "\n${WARNING}  ${YELLOW}${@}${RESET}\n"
}

function p_success {
  printf "\n${CHECK} ${GREEN}${@}${RESET}\n"
}

function p_bold {
  printf "\n${BOLD}$@${RESET}\n"
}

function p_is_linux {
  if [[ "$(uname)" == "Linux" ]]; then
    return 1
  fi
  return 0
}

function cmd_exists {
  if test ! $(which $1); then
    return 1
  fi
  return 0
}

function file_exists {
  if [ -f "$file" ]; then
    return 1
  else
    return 0
  fi
}

function activate_brew {
  if [[ p_is_linux ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  else
    eval "$(/usr/local/bin/brew shellenv)"
  fi
}

function install_package {
  PACKAGE_NAME=$1
  if [[ p_is_linux ]]; then
    sudo apt -y install $PACKAGE_NAME
  else
    brew install $PACKAGE_NAME
  fi
}
