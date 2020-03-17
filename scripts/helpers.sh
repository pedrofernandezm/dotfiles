#!/bin/bash

set encoding=utf-8

#PATHS
NEOVIM_PATH=${HOME}/.config/nvim

#EMOJIS
GEAR="\xE2\x9A\x99\xEF\xB8\x8F"
SMALL_BLUE_DIAMOND="\xF0\x9F\x94\xB9"
CHECK="\xE2\x9C\x85"
HOURGLASS="\xE2\x8F\xB3"
SMILING_FACE_SUNGLASSES="\xF0\x9F\x98\x8E"


#COLORS
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
GREY='\e[90m'
NC='\e[0m' # No Color

function echo_title {
  TITLE=$1
  printf "\n${GEAR}  SETTING UP ${TITLE}\n"
  printf -- "··············································\n"
}

function echo_installing {
  printf "\n${HOURGLASS} Installing ${1}... "
}

function echo_installed {
  printf "\r${CHECK} ${GREEN}${1} installed successfully${NC}\n"
  if [ ! -z "${2}" ]; then
    printf "\t${2}\n"
  fi
}

function echo_updating {
  printf "\n${HOURGLASS} Updating ${1}... "
}

function echo_updated {
  printf "\r${CHECK} ${GREEN}${1} updated successfully${NC}\n"
  if [ ! -z "${2}" ]; then
    printf "\t${2}\n"
  fi
}

function backup_file {
  local original_file_path=$1
  local filename=$(basename $original_file_path)
  local today=$(date +"%Y%m%d%H%M%S")
  local backup_filename="${filename}.${today}"
  mv "${original_file_path}" "${original_file_path}.${today}"
  echo "${YELLOW}Existing ${filename} renamed to ${backup_filename}${NC}\t"
}

function install_file {
  local file=$1
  local installation_path=$2
  local origin_path="${PWD}/${file}"
  local message=""
  echo_installing "${file}"
  if [ -f "${installation_path}" ]; then
    message=$(backup_file $installation_path)
  fi
  cp "${origin_path}" "${installation_path}"
  echo_installed $file "${message}"
}
