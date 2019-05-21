#!/bin/bash

source ./scripts/helpers.sh;

title DOTFILES;

# Getting dotfiles list into an array
files=( $(find $DOTFILES_PATH -maxdepth 1 -name '.*' -type f | sed 's#^\./##') )

for file in ${files[@]}; do
  installing "${file}\t"
  symlink_or_skip $file "${HOME}/${file}"
done
