# NVIM
## installation
sudo snap install nvim --classic
## symbolic link
ln -sn ${HOME}/dotfiles/nvim ${HOME}/.config/nvim
## Configure Packer
### setup packer
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
### install npm for Mason
sudo apt install curl
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.39.1/install.sh | bash
source ${HOME}/.bashrc
nvm install node
