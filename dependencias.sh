#!/usr/bin/bash
set -e

sudo apt-get install xclip

printb() {
  echo -e "\033[1;34m"
  echo "$1"
  echo -e "\033[0m"
}
printb "Comienza la instalación :D"

printb "instalar zsh?"
read in
if [[ "$in" == "y"  ]]; then
  sudo apt install zsh
  chsh -s /bin/zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  # zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  # zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  cd
  sed -i '/export ZSH="\$HOME\/.oh-my-zsh"/a\'"source ~/dotfiles/zsh/settings.zsh" ".zshrc"
  pluggins="
plugins=(git 
  zsh-autosuggestions
  zsh-syntax-highlighting
)
  "
  sed -i 's/^plugins=(git)$/'"$pluggins"'/' ".zshrc"
  printb "elimina el tema por defecto en zsh"
else
  printb "ok"
fi



printb "instalar kitty?"
read in
if [[ "$in" == "y"  ]]; then
  sudo apt intall kitty \
    && sudo update-alternatives --config x-terminal-emulator
else
  printb "ok"
fi


printb "instalar snap flatpak?"
read in
if [[ "$in" == "y"  ]]; then
  sudo apt install snapd
  sudo apt install flatpak
else
  printb "terminado"
fi

printb "instalar nvim y tmux?"
read in
if [[ "$in" == "y"  ]]; then
  sudo snap install nvim --classic
  sudo snap install tmux --classic
else
  printb "terminado"
fi

printb "instalar nodejs"
read in
if [[ "$in" == "y"  ]]; then
  # Node
  sudo apt remove libnode-dev  
  curl -sL https://deb.nodesource.com/setup_22.x | sudo -E bash - 
  sudo apt-get install nodejs
  sudo npm install -g neovim
  sudo npm install -g tree-sitter
  sudo npm install -g tree-sitter-cli
else
  printb "terminado"
fi

printb "instalar pip y complementos?"
read in
if [[ "$in" == "y"  ]]; then
  sudo apt install python3-pip
  python3 -m pip install --user --upgrade pynvim
  pip install typing-extensions #importante
else
  printb "terminado"
fi

printb "instalar caro y ruby?"
read in
if [[ "$in" == "y"  ]]; then
  sudo apt install cargo
  sudo apt install ruby
else
  printb "terminado"
fi

printb "instalar herramientas como: 
- ripgrep, 
- fzf
- bat
- git delta
- lsd
- colorls
- jq
- ctags
- clangd
- tree
?"
read in
if [[ "$in" == "y"  ]]; then
  sudo apt install bat
  sudo apt-get install silversearcher-ag
  snap install lsd
  sudo gem install colorls
  sudo apt install jq
  sudo apt-get install exuberant-ctags
  sudo apt-get install clangd
  sudo apt install tree
  cargo install git-delta
  #ripgrep
  curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb
  sudo dpkg -i ripgrep_14.1.0-1_amd64.deb
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
else
  printb "terminado"
fi

printb "instalar nerd font?"
read in
if [[ "$in" == "y"  ]]; then
  # Nerd font
  mkdir -p ~/.fonts
  cd ~/.fonts
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip
  unzip JetBrainsMono.zip 
  rm JetBrainsMono.zip 
  fc-cache -fv
  cd
else
  printb "terminado"
fi

printb "configurar enlaces simbólicos?"
read in
if [[ "$in" == "y"  ]]; then
  printb "tmux"
  ln -s ~/dotfiles/tmux/.tmux.conf .tmux.conf
  mkdir -p ~/.tmux
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  # leader + I en tmux para instalar
  printb "nvim"
  cd
  ln -s ~/dotfiles/nvim/ .config/
  cd .config/nvim
  mkdir autoload
  wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  mv plug.vim autoload
  printb "kitty"
  ln -s ~/dotfiles/kitty/ ~/.config/
else
  printb "terminado"
fi


###############
# Herramientas diversas
###############
###############
# Para pip
###############




#Herramientas vim

# instalar lo que es el diccionario para vim
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
