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
# libstdc++-12-dev is used for clangd in neovim
sudo apt install curl git gcc make ripgrep xclip libstdc++-12-dev

## Font
if $font; then
  if [ -d "${HOME}/.local/share/fonts/DejaVuSansMono" ]; then
    echo "Font already installed."
    exit 1
  else
    mkdir -p ${HOME}/.local/share/fonts/DejaVuSansMono
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DejaVuSansMono.zip 
    echo "Unziping fonts ..."
    unzip DejaVuSansMono.zip -d ~/.local/share/fonts/DejaVuSansMono > /dev/null 2>&1
    rm DejaVuSansMono.zip
    echo "Running fc-cache -f -v ..."
    fc-cache -f -v > /dev/null 2>&1
  fi
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

# ZSH
## installation
sudo apt install zsh
## install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# TMUX
## installation
sudo apt install tmux -y
ln -sn ${HOME}/dotfiles/tmux ${HOME}/.config/tmux
## tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
