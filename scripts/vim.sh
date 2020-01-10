#!/bin/bash

source ./scripts/helpers.sh;

title VIM;

installing "Vim-plug"
curl -qfLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &> /dev/null
installed "Vim-plug"

install_file bundles.vim ${HOME}/.vim/bundles.vim

installing "Vim Plugins"
vim +PlugInstall +qall &> /dev/null
installed "Vim Plugins"
