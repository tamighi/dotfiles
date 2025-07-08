#!/bin/bash

# GENERAL

```sh
sudo apt update
sudo apt upgrade
```

## nvim: gcc (treesitter), curl (npm), make & ripgrep (fzf), xclip (copy with C-c in vim)

```sh
sudo apt install -y \
  gcc \
  curl \
  make \
  ripgrep \
  xclip
```

Install npm with NVM

## utilities

```sh
sudo apt install -y \
  fzf
```

# NVIM

## installation

```sh
sudo snap install nvim --classic
ln -sn ${HOME}/dotfiles/nvim ${HOME}/.config/nvim
```

# TMUX

## installation

```sh
sudo apt install tmux -y
ln -sn ${HOME}/dotfiles/tmux ${HOME}/.config/tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

# DOCKER

```sh
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt install docker-ce
```

# Font

```sh
mkdir -p ${HOME}/.local/share/fonts/DejaVuSansMono
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/DejaVuSansMono.zip 
unzip DejaVuSansMono.zip -d ~/.local/share/fonts/DejaVuSansMono > /dev/null 2>&1
rm DejaVuSansMono.zip
fc-cache -f -v > /dev/null 2>&1
```

# ZSH

## installation

```sh
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp -i .zshrc ~/.zshrc
```
