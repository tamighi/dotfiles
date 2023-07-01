# NVIM
## installation
sudo snap install nvim --classic
## symbolic link
ln -s ~/dotfiles/nvim ~/.config/nvim
## Configure Packer
### install npm for Mason
sudo apt install npm -y
### setup packer
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
