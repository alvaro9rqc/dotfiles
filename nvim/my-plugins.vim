" =================
" NOTE: coc

autocmd BufRead * let b:coc_root_patterns = ['README.md']


" =================
" NOTE: copilot/copilot.vim
let g:copilot_enabled = 0

" =================
" NOTE: alvan/vim-closetag
" =================
" Close html tags
let g:closetag_shortcut = '>'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.astro'

" =================
" NOTE: mattn/emmet-vim
" =================
" to astro files
autocmd FileType astro EmmetInstall





" =================
" NOTE: itchyny/lightline.vim
" =================
" for git branch
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }




" =================
" NOTE: tibabit/vim-templates"
" =================
let g:tmpl_search_paths = ['~/.config/nvim/templates']
let g:tmpl_auto_initialize = 0
let g:tmpl_author_name = 'Alvaro R. Quispe Condori'

function! MyTemplateInit(arg)
  execute ':TemplateInit ' . a:arg
endfunction


" =================
" NOTE: fzf
" =================
let g:fzf_vim = {}
"let g:fzf_vim.preview_window = ['right,50%, <70(up,40%)']
let g:fzf_vim.preview_window = ['right,50%,<50(up,70%)', 'ctrl-h']
"function! SetupLayout()
"  if &columns > &lines  " Si la terminal es más ancha que alta
"    let g:fzf_vim.preview_window = ['right,50%']
"  else
"    let g:fzf_vim.preview_window = ['up,50%']
"  endif
"endfunction
"" Configurar al iniciar Neovim y cuando se redimensione la ventana
"autocmd VimEnter,VimResized * call SetupLayout()

lua <<EOF

-- " =================
-- " NOTE: treesitter
-- " =================
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


-- " =================
-- " NOTE: indent line
-- " =================
local hooks = require "ibl.hooks"
require("ibl").setup { 
  scope = { 
    highlight = { "Conceal" } 
  },
  indent = { 
    char = { "│", "|", "¦" },
  } 
}



-- " =================
-- " NOTE: tree explorer
-- " =================
local function custom_mapping_nvim_tree(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.del("n", "<C-e>", { buffer = bufnr })
end
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    number = true,
    relativenumber = true,
  },
  actions = {
    open_file = {
      quit_on_open = true, -- Cerrar el árbol al abrir un archivo
    },
  },
  filters = {
    dotfiles = true,
  },
  on_attach = custom_mapping_nvim_tree,
})

-- " =================
-- " NOTE: Colorscheme support
-- " =================
require("gruvbox").setup({
  transparent_mode = true,
})
vim.cmd("colorscheme gruvbox")


EOF

set background=dark " or light if you want light mode


"let NERDTreeQuitOnOpen=1            " Para cerrar nerdtree
"let NERDTreeShowLineNumbers=1
