#!/bin/bash

font=false

usage() {
  echo "Usage: ./setup [-i] [-c] [-s]"
  echo "Options:"
  echo "  -f    for fonts"
  exit 1
}

while getopts "ics" opt; do
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
sudo apt install curl git

## Fonts
if $font; then
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DejaVuSansMono.zip 
  mkdir -p ${HOME}/.local/share/fonts/DejaVuSansMono
  unzip DejaVuSansMono.zip -d ~/.local/share/fonts/DejaVuSansMono
  rm DejaVuSansMono.zip
  fc-cache -f -v
fi

# NVIM
## installation
sudo snap install nvim --classic
## symbolic link
ln -sn ${HOME}/dotfiles/nvim ${HOME}/.config/nvim
## Configure Packer
### setup packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
echo "Executing nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' silently..."
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' > /dev/null 2>&1
### install npm for Mason
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.39.1/install.sh | bash
source ${HOME}/.nvm/nvm.sh
nvm install node
