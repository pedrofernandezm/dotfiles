#!/bin/bash

source ./scripts/helpers.sh;

title VIM;

installing "Vim Monokai color theme"
mkdir -p ${HOME}/.vim/colors
curl -q -o ${HOME}/.vim/colors/monokai.vim https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim &> /dev/null
installed "Vim Monokai color theme"

installing "Vim-plug"
curl -qfLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &> /dev/null
installed "Vim-plug"

install_file bundles.vim ${HOME}/.vim/bundles.vim

installing "Vim Plugins"
vim '+PlugInstall --sync' +qall &> /dev/null
installed "Vim Plugins"
