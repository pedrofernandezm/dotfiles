#!/bin/bash

source ./scripts/helpers.sh;

title ZSH;

ZSH=~/.oh-my-zsh
zsh_plugins_path=$ZSH/custom/plugins
mkdir -p $zsh_plugins_path

installing "zsh-autosuggestions"
autosuggestions_path=$zsh_plugins_path/zsh-autosuggestions
if [ ! -d $autosuggestions_path ]; then
  git clone -q git://github.com/zsh-users/zsh-autosuggestions $autosuggestions_path
fi
installed "zsh-autosuggestions"

installing "fast-syntax-highlighting"
syntax_highlighting_path=$zsh_plugins_path/fast-syntax-highlighting
if [ ! -d $syntax_highlighting_path ]; then
  git clone -q  https://github.com/zdharma/fast-syntax-highlighting $syntax_highlighting_path
fi
installed "fast-syntax-highlighting"
