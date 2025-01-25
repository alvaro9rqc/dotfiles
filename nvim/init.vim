"--------------------------
"--------------------------
"INTERFAZ------------------
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



"--------------------------
"--------------------------
"TABULACION----------------
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
"IGNORAR-ARCHIVOS----------
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

"--------------------------
"--------------------------
"TERCEROS------------------
"--------------------------
"--------------------------
let g:python3_host_prog = '/usr/bin/python3'

" PLUGS---------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged/')
"Plug 'morhetz/gruvbox'                  " Tema
" Plug 'folke/tokyonight.nvim'
" Plug 'ghifarit53/tokyonight-vim'
Plug 'shinchu/lightline-gruvbox.vim'            " Tema para la barra de estado
Plug 'ellisonleao/gruvbox.nvim'
Plug 'sheerun/vim-polyglot'                     " Mejor resaltado de sintaxys
Plug 'preservim/nerdtree'
Plug 'easymotion/vim-easymotion'                " Para buscar facil
Plug 'christoomey/vim-tmux-navigator'           " Para oper tener pantalla partida
Plug 'jiangmiao/auto-pairs'                     " Para que se cierren los paréntesis 
Plug 'alvan/vim-closetag'                       " Para etiquetas html
Plug 'tpope/vim-surround'                       " Para encapsular variables
Plug 'j-hui/vim-css-color'

Plug 'maximbaz/lightline-ale'                   " Para barra de abajo
Plug 'itchyny/lightline.vim'                    " Para colores barra de estado
" Plug 'mengelbrecht/lightline-bufferline'
Plug 'tpope/vim-fugitive'
"Plug 'dense-analysis/ale'                      " Algún análisis después
"Plug 'yggdroot/indentline'                     " Para mostrar linea de indentar
Plug 'mattn/emmet-vim'                          " para html
Plug 'lukas-reineke/indent-blankline.nvim'      "indent lines

"Plug 'vim-airline/vim-airline'                 " Para barra airline
"Plug 'vim-airline/vim-airline-themes'          " Para los temas de airline
Plug 'tibabit/vim-templates'                    " Para las plantillas
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'             " plug para los íconos -- es lento
" Plug 'junegunn/goyo.vim'                " Plug to read very well
Plug 'neoclide/coc.nvim', {'branch': 'release'}   " coc to semantic support

"Plug 'majutsushi/tagbar'              " Pane with tags para 'resumir' los métodos
Plug 'preservim/tagbar'              " Pane with tags para 'resumir' los métodos, es el mismo
Plug 'aquach/vim-http-client'         " Solicitud http
"Plug 'elzr/vim-json'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'HiPhish/rainbow-delimiters.nvim' 
"Plug 'SirVer/ultisnips'                 " Para snipets, pero no usar con virtual enviroment
"Plug 'dpelle/vim-LanguageTool'
" Plug 'github/copilot.vim'             " Copilot                    

" PENDIENTES POR VER
" https://neuron.zettel.page/zettelkasten -> para tomar notas
"" Plug 'vim-pandoc/vim-pandoc-syntax'    " Pandoc syntax
" Plug 'chrisbra/colorizer'              " Colorize color codes
call plug#end()
" --------------------------------------------------------------------
so ~/.config/nvim/my-plugins.vim
so ~/.config/nvim/maps.vim

"let g:gruvbox_italic=1
"au FileType c,cpp,objc,javascript,java call rainbow#load()
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,              -- false deshabilita toda la extensión
    -- disable = { "c", "rust" },  -- lista de lenguajes a deshabilitar
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
  -- Otras configuraciones adicionales si es necesario
}



-- Color:
--vim.cmd [[highlight LineaIndentacion guifg=#5e81ac gui=nocombine]]
local hooks = require "ibl.hooks"
require("ibl").setup { 
  scope = { 
    highlight = { "Conceal" } 
  },
  indent = { 
    char = { "│", "|", "¦" },
  } 
}
--hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

EOF

set background=dark " or light if you want light mode
colorscheme gruvbox

let NERDTreeQuitOnOpen=1            " Para cerrar nerdtree
let NERDTreeShowLineNumbers=1
"
"--------------------------
"--------------------------
"AUTOCOMAND----------------
"--------------------------
"--------------------------
autocmd FileType json setlocal formatprg=jq
"autocmd FileType markdown setlocal textwidth=80


"---------------------------------------------------------------------
"
" NO tener espefício en GUI ni terminales 256
hi Normal guibg=NONE ctermbg=NONE   
" CAMBIA: let s:gb.dark0_hard =[#1d2021] a let s:gb.dark0_hard =[#000000]
"let g:gruvbox_italic=1            " Para italic
"set noshowmode
"set termguicolors
"let g:tokyonight_style = 'night' " available: night, storm
"let g:tokyonight_enable_italic = 1
"colorscheme tokyonight
"--------------------Teclas

"---------------------------------------------------------------------
" Show EOL type and last modified timestamp, right after the filename
set statusline=%f               " filename relative to current $PWD
set statusline+=%h              " help file flag
set statusline+=%m              " modified flag
set statusline+=%r              " readonly flag
set statusline+=\ [%{&ff}]      " Fileformat [unix]/[dos] etc...
set statusline+=\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})  " last modified timestamp
set statusline+=%=              " Rest: right align
set statusline+=%l,%c%V         " Position in buffer: linenumber, column, virtual column
set statusline+=\ %P            " Position in buffer: Percentage

if &term =~ 'xterm-256color'    " mintty identifies itself as xterm-compatible
  if &t_Co == 8
    set t_Co = 256              " Use at least 256 colors
  endif
  " set termguicolors           " Uncomment to allow truecolors on mintty
endif
"------------------------------------------------------------------------------
" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Set UTF-8 as the default encoding for commit messages
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
endif " has("autocmd")


if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
