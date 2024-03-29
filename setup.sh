#!/bin/bash

font=false

usage() {
  echo "Usage: ./setup [-f]"
  echo "Options:"
  echo "  -f    for fonts"
  exit 1
}

while getopts "f" opt; do
  case $opt in
    f)
      font=true
      ;;
    *)
      usage
      ;;
  esac
done

# GENERAL

sudo apt update
sudo apt upgrade

## nvim: gcc (treesitter), curl (npm), make & ripgrep (fzf), xclip (copy with C-y).
sudo apt install -y \
  gcc \
  curl \
  make \
  ripgrep \
  xclip \

## utilities
sudo apt install -y \
  rimraf \
  fzf
  #g++ \
  #libstdc++-12-dev

# NVIM

## installation
sudo snap install nvim --classic
## symbolic link
ln -sn ${HOME}/dotfiles/nvim ${HOME}/.config/nvim

## Configure Packer
### setup packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
## Then :so & :PackerSync twice in packer setup file.

### install npm for Mason
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.39.1/install.sh | bash
source ${HOME}/.nvm/nvm.sh
nvm install node

# Font
if $font; then
  if [ -d "${HOME}/.local/share/fonts/DejaVuSansMono" ]; then
    echo "Font already installed."
    exit 1
  else
    mkdir -p ${HOME}/.local/share/fonts/DejaVuSansMono
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/DejaVuSansMono.zip 
    echo "Unziping fonts ..."
    unzip DejaVuSansMono.zip -d ~/.local/share/fonts/DejaVuSansMono > /dev/null 2>&1
    rm DejaVuSansMono.zip
    echo "Running fc-cache -f -v ..."
    fc-cache -f -v > /dev/null 2>&1
  fi
fi

# ZSH

## installation
sudo apt install zsh
## install zsh
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
