#!/bin/bash

source ./scripts/helpers.sh;
source ./scripts/oh-my-zsh.sh;

function install_package () {
  local human_name=$1
  local package_name=$2
  echo_installing "${human_name}"
  package_installed=$(which $package_name &> /dev/null)
  if [ $? -eq 1 ]; then
    sudo apt-get -y -q=2 install -qq $package_name &> /dev/null
  fi
  echo_installed "${human_name}"
}

printf "${HOURGLASS} Updating package lists..."
sudo apt-get update &> /dev/null
printf "\r${CHECK}${GREEN} Package lists updated successfully${NC}\n"

install_package "Curl" "curl"
install_package "Vim" "vim"
install_package "NeoVim" "neovim"
install_package "Tmux" "tmux"
install_package "Autojump" "autojump"
install_package "Silver Searcher" "silversearcher-ag"
install_package "Ack" "ack-grep"
install_package "ZSH" "zsh"

install_oh_my_zsh
