#!/bin/bash

source ./scripts/helpers.sh;

title VIM;

installing "Vim Monokai color theme"
mkdir -p ${HOME}/.vim/colors
curl -q -o ${HOME}/.vim/colors/monokai.vim https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim &> /dev/null
installed "Vim Monokai color theme"

installing "Vundle"
git clone -q https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim
installed "Vundle"

installing "Vim plugins"
symlink_or_skip bundles.vim ${HOME}/.vim/bundles.vim
vim +PluginInstall +qall
