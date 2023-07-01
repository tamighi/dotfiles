# NVIM
## installation
sudo snap install nvim --classic
## symbolic link
ln -s ${HOME}/dotfiles/nvim ${HOME}/.config/nvim
## Configure Packer
### install npm for Mason
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.3/install.sh | bash
source ~/.bashrc
nvm install node
### setup packer
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
