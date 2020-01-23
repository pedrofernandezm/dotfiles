#!/bin/bash

source ./scripts/helpers.sh;

echo_title VIM;

echo_installing "Vim-plug"
curl -qfLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &> /dev/null
echo_installed "Vim-plug"

install_file bundles.vim ${HOME}/.vim/bundles.vim

echo_installing "Vim Plugins"
vim +PlugInstall +qall &> /dev/null
echo_installed "Vim Plugins"
