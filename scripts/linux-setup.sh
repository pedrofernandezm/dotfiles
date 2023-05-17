#!/bin/bash

source ./scripts/helpers.sh;

####################################################
#                                                  #
#                  UTILITIES                       #
#                                                  #
####################################################
p_title "UPDATE PACKAGE LISTS"
sudo apt-get update
p_success "Package lists updated."

p_title "CURL"
sudo apt -y install curl
p_success "CURL installed."

p_title "Essentials"
sudo apt-get -y install build-essential
p_success "Essentials installed."
