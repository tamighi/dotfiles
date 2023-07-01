#!/bin/bash
# GENERAL
sudo apt install curl git

# NVIM
## installation
sudo snap install nvim --classic
## symbolic link
ln -sn ${HOME}/dotfiles/nvim ${HOME}/.config/nvim
## Configure Packer
### setup packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
echo "nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'"
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' > /dev/null 2>&1
### install npm for Mason
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.39.1/install.sh | bash
source ${HOME}/.nvm/nvm.sh
nvm install node
