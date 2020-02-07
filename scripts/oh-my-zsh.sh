#!/bin/bash

source ./scripts/helpers.sh;

function install_oh_my_zsh () {
  echo_installing "Oh-My-Zsh"
  curl -Lo /tmp/install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh &> /dev/null
  sh /tmp/install.sh --unattended &> /dev/null
  echo_installed "Oh-My-Zsh"
}
