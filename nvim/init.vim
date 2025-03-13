"--------------------------
"--------------------------
"NOTE: INTERFAZ
"--------------------------
"--------------------------
" automatically show matching brackets. works like it does in bbedit.
set showmatch                   
" make the last line where the status is two lines deep so you can see status always
set laststatus=2                
" show the current mode
set showmode                    
" Better command line completion
set wildmode=list:longest,longest:full   
set relativenumber 
set number
set conceallevel=2
set spelllang=es
"Formato de como aparece el cursor
set guicursor=n-v-c:block
set guicursor+=a:blinkon1
set exrc
set cursorline



"--------------------------
"--------------------------
"NOTE: TABULACION
"--------------------------
"--------------------------
" set auto-indenting on for programming
set ai                          
" Usar espacios 
set expandtab                  
set autoindent
" Define la cantidad de espacios para cada nivel de indentación.
set shiftwidth=2                
" Establece la cantidad de espacios que representa un carácter de tabulación.
set tabstop=2                   
" Para que las palabras de lineas largas no se rompan
set linebreak
"Para que se indenten
set breakindent
set breakindentopt=shift:2


"--------------------------
"--------------------------
"NOTE: IGNORAR-ARCHIVOS
"--------------------------
"--------------------------
set wildignore+=*.class
set wildignore+=*.out
let g:skip_defaults_vim = 1     " Do not source defaults.vim again (after loading this system vimrc)
" OK, in python files I need to change in python.vim in
" /usr/share/nvim/runtime/ftplugin/python.vim

"--------------------------
"--------------------------
"PREFERENCIAS DE COMP.-----
"--------------------------
"--------------------------
"Para elegir el portapepeles
set clipboard=unnamed           
" Show (partial) command in status line.
set showcmd	                	
" Incremental search
set incsearch	            	
set encoding=utf-8              
" Parra que barra de estado esté en todo momento
set laststatus=2
syntax enable

autocmd BufReadPre COMMIT_EDITMSG,MERGE_MSG,git-rebase-todo setlocal fileencoding=utf-8

" Remember the positions in files with some git-specific exceptions"
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$")
  \           && &filetype !~# 'commit\|gitrebase'
  \           && expand("%") !~ "ADD_EDIT.patch"
  \           && expand("%") !~ "addp-hunk-edit.diff" |
  \   exe "normal! g`\"" |
  \ endif

  autocmd BufNewFile,BufRead *.patch set filetype=diff

  autocmd Filetype diff
  \ highlight WhiteSpaceEOL ctermbg=red |
  \ match WhiteSpaceEOL /\(^+.*\)\@<=\s\+$/


"--------------------------
"--------------------------
"TERCEROS------------------
"--------------------------
"--------------------------
let g:python3_host_prog = '/usr/bin/python3'

" PLUGS---------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged/')
Plug 'shinchu/lightline-gruvbox.vim'            " Tema para la barra de estado
Plug 'ellisonleao/gruvbox.nvim'
"Plug 'preservim/nerdtree'
Plug 'easymotion/vim-easymotion'                " Para buscar facil
Plug 'christoomey/vim-tmux-navigator'           " Para oper tener pantalla partida
Plug 'jiangmiao/auto-pairs'                     " Para que se cierren los paréntesis 
Plug 'alvan/vim-closetag'                       " Para etiquetas html
Plug 'tpope/vim-surround'                       " Para encapsular variables
Plug 'j-hui/vim-css-color'

Plug 'itchyny/lightline.vim'                    " Para colores barra de estado
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'                          " para html
Plug 'lukas-reineke/indent-blankline.nvim'      "indent lines

Plug 'tibabit/vim-templates'                    " Para las plantillas
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'ryanoasis/vim-devicons'             " plug para los íconos -- es lento
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
" Plug 'junegunn/goyo.vim'                " Plug to read very well
Plug 'neoclide/coc.nvim', {'branch': 'release'}   " coc to semantic support

"Plug 'majutsushi/tagbar'              " Pane with tags para 'resumir' los métodos
Plug 'preservim/tagbar'              " Pane with tags para 'resumir' los métodos, es el mismo
Plug 'aquach/vim-http-client'         " Solicitud http
"Plug 'elzr/vim-json'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'HiPhish/rainbow-delimiters.nvim' 
" Plug 'chrisbra/colorizer'              " Colorize color codes
call plug#end()
" --------------------------------------------------------------------
so ~/.config/nvim/my-plugins.vim
so ~/.config/nvim/maps.vim

"--------------------------
"--------------------------
"AUTOCOMAND----------------
"--------------------------
"--------------------------
autocmd FileType json setlocal formatprg=jq
"autocmd FileType markdown setlocal textwidth=80


"hi Normal guibg=NONE ctermbg=NONE   
