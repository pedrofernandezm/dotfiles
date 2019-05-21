#!/bin/bash

source ./scripts/helpers.sh;

title VIM;

installing "Vim Monokai color theme"
symlink_or_skip .vim/colors/monokai.vim ${HOME}/.vim/colors/monokai.vim

installing "Vundle"
git submodule init && git submodule update
symlink_or_skip Vundle.vim ${HOME}/.vim/bundle/Vundle.vim

installing "Vim plugins"
symlink_or_skip bundles.vim ${HOME}/.vim/bundles.vim
vim +PluginInstall +qall
