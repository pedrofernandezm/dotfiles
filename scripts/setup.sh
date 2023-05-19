#!/bin/bash

set -e

source ./scripts/helpers.sh;

p_bold "${BLUE}---------------------------------------------------
|                                                 |
| Welcome!                                        |
|                                                 |
| Author: https://github.com/pedrofernandezm      |
|                                                 |
---------------------------------------------------"

if [[ is_linux ]]; then
  ./scripts/linux-setup.sh
fi

####################################################
#                                                  #
#                  HOMEBREW                        #
#                                                  #
####################################################
p_title "Homebrew"
if cmd_exists brew ; then
  p_warn "Homebrew already installed."
else
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  p_success "Homebrew installed."
fi
activate_brew

p_title "The silver searcher"
if cmd_exists ag ; then
  p_warn "The silver searcher is already installed."
else
  brew install the_silver_searcher
  p_success "The silver searcher installed."
fi

p_title "Ack"
if cmd_exists ack ; then
  p_warn "Ack is already installed."
else
  brew install ack
  p_success "Ack installed."
fi

####################################################
#                                                  #
#                  SHELL                           #
#                                                  #
####################################################
p_title "ZSH shell"
if cmd_exists zsh ; then
  p_warn "ZSH is already installed."
else
  install_package zsh
  sudo chsh -s /bin/zsh $USER
  p_success "ZSH shell installed."
fi

ZSH=~/.oh-my-zsh
ZSH_CUSTOM=$ZSH/custom
ZSH_PLUGINS=$ZSH_CUSTOM/plugins

p_title "Oh My ZSH"
if [ -d $ZSH ]; then
  p_warn "Oh My ZSH is already installed."
else
  curl -L http://install.ohmyz.sh | sh
  p_success "Oh My ZSH installed."
fi

p_title "ZSH Configuration files"
cp ./config-files/zshrc ~/.zshrc
p_success "ZSH configuration files installed."

mkdir -p $ZSH_PLUGINS
p_success "ZSH plugins folder created."

p_title "zsh-autosuggestions"
autosuggestions_path=$ZSH_PLUGINS/zsh-autosuggestions
if [ -d $autosuggestions_path ]; then
  p_warn "zsh-autosuggestions is already installed."
else
  git clone -q https://github.com/zsh-users/zsh-autosuggestions.git $autosuggestions_path
  p_success "zsh-autosuggestions"
fi

p_title "fast-syntax-highlighting"
syntax_highlighting_path=$ZSH_PLUGINS/fast-syntax-highlighting
if [ -d $syntax_highlighting_path ]; then
  p_warn "fast-syntax-highlighting is already installed."
else
  git clone -q  https://github.com/zdharma-continuum/fast-syntax-highlighting.git $syntax_highlighting_path
  p_success "fast-syntax-highlighting"
fi

p_title "Autojump"
if cmd_exists autojump ; then
  p_warn "Autojump is already installed."
else
  brew install autojump
  p_success "Autojump installed."
fi

p_title "Spaceship theme"
SPACESHIP_THEME_PATH=$ZSH_CUSTOM/themes/spaceship-prompt
if [ -d $SPACESHIP_THEME_PATH ]; then
  p_warn "Spaceship theme is already installed."
else
  git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
  ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
  p_success "Spaceship theme installed."
fi

####################################################
#                                                  #
#                  NEOVIM                          #
#                                                  #
####################################################
./scripts/neovim.sh;

####################################################
#                                                  #
#                  TMUX                            #
#                                                  #
####################################################
p_title "Tmux"
if cmd_exists tmux ; then
  p_warn "Tmux is already installed."
else
  brew install tmux
  p_success "Tmux installed."
fi

p_title "Tmux Configuration files"
cp ./config-files/tmux.conf ~/.tmux.conf
p_success "Tmux configuration files installed."

####################################################
#                                                  #
#                  FILES                           #
#                                                  #
####################################################
p_title "CONFIGURATION FILES";
cp ./config-files/aliases ~/.aliases
p_success "Configuration files installed."

printf "\n${SMILING_FACE_SUNGLASSES} All done!\n"
