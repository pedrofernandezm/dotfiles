#!/bin/bash

set -e
set encoding=utf-8

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

function title {
  TITLE=$1
  printf "\n${GEAR}  SETTING UP ${TITLE}\n"
  printf -- "··············································\n"
}

function installing {
  printf "\n${HOURGLASS} Installing ${1}... "
}

function installed {
  printf "\r${CHECK} ${GREEN}${1} installed successfully${NC}\n"
  if [ ! -z "${2}" ]; then
    printf "\t${2}\n"
  fi
}

# Sysmlink dotfiles to HOME directory and renaming existing file with .old suffix
function symlink_or_skip {
  local file=$1
  local link_path=$2
  local link_dir_path=$(dirname "${link_path}")
  local dotfile_path="${dir}/${file}"
  local message=""
  # If file exists and it's a symlink
  if [ ! -L "${link_path}" ] && [ -f "${link_path}" ]; then
    local today=$(date +"%Y%m%d%H%M%S")
    local backup_filename="${file}.${today}"
    mv "${link_path}" "${link_path}.${today}"
    message="${YELLOW}Existing ${file} renamed to ${backup_filename}${NC}\t"
  fi
  mkdir -p $link_dir_path
  ln -fs "${dotfile_path}" "${link_path}"
  installed $file "${message}"
}

