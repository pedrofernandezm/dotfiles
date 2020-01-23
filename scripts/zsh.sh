#!/bin/bash

source ./scripts/helpers.sh;

echo_title ZSH;

ZSH=~/.oh-my-zsh
zsh_plugins_path=$ZSH/custom/plugins
mkdir -p $zsh_plugins_path

echo_installing "zsh-autosuggestions"
autosuggestions_path=$zsh_plugins_path/zsh-autosuggestions
if [ ! -d $autosuggestions_path ]; then
  git clone -q git://github.com/zsh-users/zsh-autosuggestions $autosuggestions_path
fi
echo_installed "zsh-autosuggestions"

echo_installing "fast-syntax-highlighting"
syntax_highlighting_path=$zsh_plugins_path/fast-syntax-highlighting
if [ ! -d $syntax_highlighting_path ]; then
  git clone -q  https://github.com/zdharma/fast-syntax-highlighting $syntax_highlighting_path
fi
echo_installed "fast-syntax-highlighting"
