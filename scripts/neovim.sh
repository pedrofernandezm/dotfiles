#!/bin/bash

source ./scripts/helpers.sh;

echo_title NEOVIM;

echo_installing "Vim-plug"
curl -qfLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &> /dev/null
echo_installed "Vim-plug"

install_file bundles.vim ${NEOVIM_PATH}/bundles.vim
touch ${NEOVIM_PATH}/bundle.vim.local

echo_installing "NeoVim Plugins"
nvim +PlugInstall +qall &> /dev/null
echo_installed "NeoVim Plugins"

echo_updating "NeoVim Plugins"
nvim +PlugUpdate +qall &> /dev/null
echo_updated "NeoVim Plugins"
