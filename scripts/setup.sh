#!/bin/bash

set -e

source ./scripts/helpers.sh;

./scripts/tools.sh
./scripts/dotfiles.sh
./scripts/vim.sh
./scripts/neovim.sh
./scripts/zsh.sh

printf "\n${SMILING_FACE_SUNGLASSES} All done!\n"
