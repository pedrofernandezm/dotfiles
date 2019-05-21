#!/bin/bash

source ./scripts/helpers.sh;

function install_package () {
  local human_name=$1
  local package_name=$2
  installing "${human_name}"
  package_installed=$(dpkg-query -l $package_name 2> /dev/null | grep -q "${package_name}")
  if [ $? -eq 1 ]; then
    sudo apt-get -y -q=2 install -qq $package_name &> /dev/null
  fi
  installed "${human_name}"
}


printf "${HOURGLASS} Updating package lists..."
sudo apt-get update &> /dev/null
printf "\r${CHECK}${GREEN} Package lists updated successfully${NC}\n"

install_package "Curl" "curl"
install_package "Vim" "vim"
install_package "Tmux" "tmux"
install_package "Autojump" "autojump"
install_package "Silver Searcher" "silversearcher-ag"
install_package "ZSH" "zsh"

installing "Oh-My-Zsh"
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &> /dev/null
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh -l::g' | sed 's:chsh -s .*$::g')" &> /dev/null
installed "Oh-My-Zsh"
