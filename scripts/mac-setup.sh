#!/bin/bash

source ./scripts/helpers.sh;
source ./scripts/oh-my-zsh.sh;

function install_package () {
  local human_name=$1
  local package_name=$2
  echo_installing "${human_name}"
  package_installed=$(brew ls -1 | grep -q "${package_name}")
  if [ $? -eq 1 ]; then
    brew install $package_name &> /dev/null
  fi
  echo_installed "${human_name}"
}

echo_installing "Homebrew"
which -s brew
if [[ $? != 0 ]] ; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
  echo_installed "Homebrew"
else
  printf "\r${HOURGLASS} Updating Homebrew packages..."
  brew update &> /dev/null
  printf "\r${CHECK}${GREEN} Homebrew updated successfully${NC}\n"
fi

install_package "Curl" "curl"
install_package "Vim" "vim"
install_package "Tmux" "tmux"
install_package "Autojump" "autojump"
install_package "Silver Searcher" "the_silver_searcher"
install_package "ZSH" "zsh"

install_oh_my_zsh
