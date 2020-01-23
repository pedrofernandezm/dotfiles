#!/bin/bash

set -e

source ./scripts/helpers.sh;

echo_title "TOOLS"

if [ "$(uname)" == "Darwin" ]; then
  ./scripts/mac-setup.sh
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  ./scripts/linux-setup.sh
fi
