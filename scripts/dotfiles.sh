#!/bin/bash

source ./scripts/helpers.sh;

echo_title "CONFIGURATION FILES";

# Getting dotfiles list into an array
files=(.aliases .docker-aliases .gemrc .gitconfig .gitignore_global .tmux.conf .vimrc .zshrc)

for file in ${files[@]}; do
  install_file $file "${HOME}/${file}"
done

mkdir -p ${NEOVIM_PATH}
install_file .neovim "${NEOVIM_PATH}/init.vim"
