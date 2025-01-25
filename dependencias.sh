sudo apt install tree
echo "Para snap"
sudo apt install snapd
echo "Install flatpak"
sudo apt install flatpak
echo "Neovim"
sudo snap install nvim --classic
cd ~ 
rm .bashrc
ln -s ~/dotfiles/bash/.bashrc .bashrc
echo "Tmux"
sudo snap install tmux --clasic
cd
ln -s ~/dotfiles/tmux/.tmux.conf .tmux.conf
mkdir -p ~/.tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo apt-get install xsel # or xclip
# leader + I en tmux para instalar
###############
# Herramientas diversas
###############
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb
sudo dpkg -i ripgrep_14.1.0-1_amd64.deb
###############
# Para pip
###############
sudo apt install python3-pip
pip3 install --user pynvimpara 
pip install typing-extensions #importante

# Nerd font
mkdir -p ~/.fonts
cd ~/.fonts
cp ~/Descargas/JetBrainsMono.zip .
unzip JetBrainsMono.zip 
rm JetBrainsMono.zip 
fc-cache -fv
cd



#Herramientas vim
sudo apt install bat
# noo: sudo apt install fzf
sudo apt install xclip
sudo apt install cargo
cargo install git-delta
sudo apt-get install silversearcher-ag
sudo apt install bat #para batcat
sudo apt install ruby
snap install lsd
sudo gem install colorls

# Node
sudo apt remove libnode-dev
curl -sL https://deb.nodesource.com/setup_22.x | sudo -E bash - 
sudo apt-get install nodejs
npm install -g neovim
sudo npm install -g tree-sitter
sudo npm install -g tree-sitter-cli

sudo apt install jq
#
#Para tag
sudo apt-get install exuberant-ctags
# para compulador de c
sudo apt-get install clangd

cd
ln -s ~/dotfiles/nvim/ .config/
cd .config/nvim
mkdir autoload
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mv plug.vim autoload

# intalar lo que es el diccionario para vim
# dentro del directorio spell en vim
wget --no-check-certificate https://ftp.vim.org/vim/runtime/spell/es.latin1.spl
wget --no-check-certificate https://ftp.vim.org/vim/runtime/spell/es.latin1.sug
wget --no-check-certificate https://ftp.vim.org/vim/runtime/spell/es.utf-8.spl
wget --no-check-certificate https://ftp.vim.org/vim/runtime/spell/es.utf-8.sug




#interesante
# curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
# Te descarga un paquete de git hub

#
#

# Para documentación install:
# npm -g install tree-sitter-cli 
# :TSInstall vim
# :TSInstall vimdoc

#ERADE
#- **fuzzy finder**
#  - For more information, see: https://github.com/junegunn/fzf
#  - Para que las búsquedas sean más fáciles
