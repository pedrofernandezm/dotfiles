#!/bin/bash

set -e

source ./scripts/helpers.sh;

p_bold "${tan}---------------------------------------------------
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
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
activate_brew
p_success "Homebrew installed."

p_title "The silver searcher"
brew install the_silver_searcher
p_success "The silver searcher installed."

p_title "Ack"
brew install ack
p_success "Ack installed."

####################################################
#                                                  #
#                  SHELL                           #
#                                                  #
####################################################
p_title "ZSH shell"
install_package zsh
sudo chsh -s /bin/zsh $USER
p_success "ZSH shell installed."

p_title "Oh My ZSH"
curl -L http://install.ohmyz.sh | sh
p_success "Oh My ZSH installed."

p_title "ZSH Configuration files"
cp ./config-files/zshrc ~/.zshrc
p_success "ZSH configuration files installed."

ZSH=~/.oh-my-zsh
ZSH_CUSTOM=$ZSH/custom
ZSH_PLUGINS=$ZSH_CUSTOM/plugins
mkdir -p $ZSH_PLUGINS

p_title "zsh-autosuggestions"
autosuggestions_path=$ZSH_PLUGINS/zsh-autosuggestions
if [ ! -d $autosuggestions_path ]; then
  git clone -q https://github.com/zsh-users/zsh-autosuggestions.git $autosuggestions_path
fi
p_success "zsh-autosuggestions"

p_title "fast-syntax-highlighting"
syntax_highlighting_path=$ZSH_PLUGINS/fast-syntax-highlighting
if [ ! -d $syntax_highlighting_path ]; then
  git clone -q  https://github.com/zdharma-continuum/fast-syntax-highlighting.git $syntax_highlighting_path
fi
p_success "fast-syntax-highlighting"

p_title "Autojump"
brew install autojump
p_success "Autojump installed."

p_title "Spaceship theme"
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
p_success "Spaceship theme installed."

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
brew install tmux
p_success "Tmux installed."

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
