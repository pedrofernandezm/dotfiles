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

installing "zsh-syntax-highlighting"
syntax_highlighting_path=$zsh_plugins_path/zsh-syntax-highlighting
if [ ! -d $syntax_highlighting_path ]; then
  git clone -q git://github.com/zsh-users/zsh-syntax-highlighting.git $syntax_highlighting_path
fi
installed "zsh-syntax-highlighting"
