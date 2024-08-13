#!/bin/bash

# GENERAL
sudo apt update
sudo apt upgrade

## nvim: gcc (treesitter), curl (npm), make & ripgrep (fzf), xclip (copy with C-c in vim), npm (mason)
sudo apt install -y \
  gcc \
  curl \
  make \
  ripgrep \
  xclip \
  npm

## utilities
sudo apt install -y \
  fzf

# NVIM

## installation
sudo snap install nvim --classic
## symbolic link
ln -sn ${HOME}/dotfiles/nvim ${HOME}/.config/nvim

## Configure Packer
### setup packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
## Then :so & :PackerSync in packer setup file.

# ZSH

## installation
sudo apt install zsh
## install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
## needs restart to apply as default term

cp -i .zshrc ~/.zshrc

# TMUX

## installation
sudo apt install tmux -y
ln -sn ${HOME}/dotfiles/tmux ${HOME}/.config/tmux
## tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# DOCKER
echo "Do you wish to install docker? (y/n)"
read answer

if [ "$answer" == "y" ]; then
  sudo apt install apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
  sudo apt install docker-ce
else
    echo "Installation aborted."
fi

# Font
echo "Do you wish to install fonts? (y/n)"
read answer

if [ "$answer" == "y" ]; then
  if [ -d "${HOME}/.local/share/fonts/DejaVuSansMono" ]; then
    echo "Font already installed."
    exit 1
  else
    mkdir -p ${HOME}/.local/share/fonts/DejaVuSansMono
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/DejaVuSansMono.zip 
    unzip DejaVuSansMono.zip -d ~/.local/share/fonts/DejaVuSansMono > /dev/null 2>&1
    rm DejaVuSansMono.zip
    fc-cache -f -v > /dev/null 2>&1
  fi
fi

