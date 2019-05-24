#!/bin/bash

source ./scripts/helpers.sh;

title "CONFIGURATION FILES";

# Getting dotfiles list into an array
files=(.aliases .docker-aliases .gemrc .gitconfig .gitignore_global .tmux.conf .vimrc .zshrc)

for file in ${files[@]}; do
  installing "${file}\t"
  symlink_or_skip $file "${HOME}/${file}"
done