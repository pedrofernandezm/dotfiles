#!/bin/bash

source ./scripts/helpers.sh;

p_title "Neovim"
brew install neovim
p_success "Neovim installed."

p_title "Vim-plug"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
p_success "Vim-plug"

p_title "Neovim configuration files"
NEOVIM_PATH=${HOME}/.config/nvim
mkdir -p $NEOVIM_PATH
cp ./configs/neovim ${NEOVIM_PATH}/init.vim
cp ./configs/bundles.vim ${NEOVIM_PATH}/bundles.vim
touch ${NEOVIM_PATH}/bundle.vim.local
p_success "Neovim configuration files"

p_title "Neovim Plugins"
nvim +PlugInstall +qall
p_success "NeoVim Plugins"
