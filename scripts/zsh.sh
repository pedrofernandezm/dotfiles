#!/bin/bash

source ./scripts/helpers.sh;

echo_title ZSH;

ZSH=~/.oh-my-zsh
ZSH_PLUGINS_PATH=$ZSH/custom/plugins
mkdir -p $ZSH_PLUGINS_PATH

echo_installing "zsh-autosuggestions"
autosuggestions_path=$ZSH_PLUGINS_PATH/zsh-autosuggestions
if [ ! -d $autosuggestions_path ]; then
  git clone -q git://github.com/zsh-users/zsh-autosuggestions $autosuggestions_path
fi
echo_installed "zsh-autosuggestions"

echo_installing "fast-syntax-highlighting"
syntax_highlighting_path=$ZSH_PLUGINS_PATH/fast-syntax-highlighting
if [ ! -d $syntax_highlighting_path ]; then
  git clone -q  https://github.com/zdharma/fast-syntax-highlighting $syntax_highlighting_path
fi
echo_installed "fast-syntax-highlighting"

ZSH_THEMES_PATH=$ZSH/custom/themes
item_to_install="Spaceship Prompt"
mkdir -p $ZSH_THEMES_PATH
if [ -f "$ZSH_THEMES_PATH/spaceship.zsh-theme" ]; then
  echo_updating "${item_to_install}"
  cd $ZSH_THEMES_PATH/spaceship-prompt
  git pull -q
  echo_updated "${item_to_install}"
else
  echo_installing "${item_to_install}"
  git clone -q https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_THEMES_PATH/spaceship-prompt"
  ln -s "$ZSH_THEMES_PATH/spaceship-prompt/spaceship.zsh-theme" "$ZSH_THEMES_PATH/spaceship.zsh-theme"
  echo_installed "${item_to_install}"
fi
