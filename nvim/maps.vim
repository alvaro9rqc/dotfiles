"PENDIENTE:
"Poner en vez de tabnext, combinación de gt para poder poner números
"NOTE: EMMET VIM
let g:user_emmet_leader_key='<A-e>'

let mapleader=" "

"nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>te :NvimTreeFindFile<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
"Para regresar a otro tab:
nmap <Leader>h gT
"para ir a otro tab:
nmap <Leader>l gt
"para abrir nuevo tab:
nmap <Leader>ta :tabe 
"Para el tabgar
nmap <Leader>tb :Tagbar<CR>
nmap <Leader>to :TagbarOpenAutoClose<CR>
"end tabgar
nmap <Leader>s <Plug>(easymotion-overwin-f2)
nmap <Leader>e <Plug>(easymotion-prefix)
nmap <Leader>mt :call MyTemplateInit(input("My template :D "))<CR>
nmap <Leader>ff :GFiles<CR>
nmap <Leader>fb :Buffers<CR> 
nmap <Leader>ag :Ag<CR> 
nmap <Leader>cc :Commits<CR> 


" =================
" NOTE: Fugitive nvim
" =================
nmap <Leader>gg :G<CR> 
nmap <Leader>ga :Gwrite<CR>
nmap <Leader>gr :Git restore --staged %<CR> 
nmap <Leader>gc :Git commit<CR> 
nmap <Leader>gd :Gvdiffsplit<CR> 

" VN
" Para que se copie el texto
vnoremap <Leader>y "+y
"" aumentar de tamaño vista
nnoremap <Leader>yy "+yy
nnoremap <Leader>> 6<C-w>>
"  para disminuir
nnoremap <Leader>< 6<C-w><
" para aumentar tamaño
nnoremap <Leader>+ 2<C-w>+
" para disminuir
nnoremap <Leader>- 2<C-w>-
" para coc
nnoremap <Leader>cd <Plug>(coc-definition)
nnoremap <Leader>cy <Plug>(coc-type-definition)
nnoremap <Leader>ci <Plug>(coc-implementation)
nnoremap <Leader>cr <Plug>(coc-references)

inoremap <silent><expr> <C-s> CocActionAsync("showSignatureHelp")

" Path completion with custom source command
" inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
" inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')
" Insert mode completion
" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-l> <plug>(fzf-complete-line)

" Word completion with custom spec with popup layout option
"inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})


" coc:
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" conflicto con auto pairs
let g:AutoPairsMapCR=0
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion
"  if has('nvim')
"    inoremap <silent><expr> <c-space> coc#refresh()
"  else
"    inoremap <silent><expr> <c-@> coc#refresh()
"  endif
"  
" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


" Map the function to a command for easy access
"command! Nt call EnableBreakIndentation()
